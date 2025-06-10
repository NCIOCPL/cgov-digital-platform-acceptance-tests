/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';


And('user selects {string} rows and {string} columns', (rows, columns) => {
    cy.get(`button[data-row='${rows}'][data-column='${columns}']`).click()
})

And('user selects {string} from {string} dropdown for {int} table', (alignment, property,index) => {

    cy.get("div.ck-balloon-rotator__content :nth-child(6)").click({ force: true })
    cy.get(`button[data-cke-tooltip-text="${alignment}"]`).click({ force: true })
    cy.get('div[class="ck ck-form__row ck-table-form__action-row"] button').first().click({ force: true })
})

And('user writes {string} into {string} labeled field', (value, fieldLabel) => {
    cy.get("div.ck-balloon-rotator__content :nth-child(4)").click()
    cy.get('.ck-content[contenteditable=true] figcaption').realType(value)
});


And('user types {string} in all cells of table {int}', (cellText, tableNum) => {
    cy.get('.ck-content[contenteditable=true] figure table').eq(tableNum).find('td').each(cell => {
        cy.wrap(cell).focus().realType(cellText)
    });
});

And('user toggles Header Row for {int} table',(headerRow, index)=>{
    cy.get("div.ck-balloon-rotator__content div.ck.ck-dropdown").eq(1).click().find('button:contains("Header row")').click()
})
And('user toggles Header Column for {int} table',(headerRow, index)=>{
    cy.get("div.ck-balloon-rotator__content div.ck.ck-dropdown").eq(0).click().find('button:contains("Header column")').click()
})

And('user types {string} in all headers of table {int}', (cellText, tableNum) => {
    cy.get('.ck-content[contenteditable=true] figure table').eq(tableNum).find('th').each(cell => {
        cy.wrap(cell).focus().realType(cellText)
    });
});

And('the following tables are displayed', (dataTable) => {
    for (const { index, rowCount, columnCount, headerCount, caption, alignment } of dataTable.hashes()) {
        cy.get('div.cgdp-article-body.cgdp-article-body--multiple').find('section').eq(index)
            .find('tr').should('have.length', rowCount)
        cy.get('div.cgdp-article-body.cgdp-article-body--multiple').find('section').eq(index)
            .find('td').should('have.length', (rowCount * columnCount) - headerCount)
        if (caption != 'null') {
            cy.get('div.cgdp-article-body.cgdp-article-body--multiple').find('section').eq(index)
                .find('figure').find('figcaption').should('have.text', caption)
        }
        else {
            cy.get('div.cgdp-article-body.cgdp-article-body--multiple').find('section').eq(index)
                .find('figure').find('figcaption').should('not.exist')
        }
    
        if (alignment != 'null') {
            cy.get('div.cgdp-article-body.cgdp-article-body--multiple').find('section').eq(index)
                .find('figure').find('div').find('div').find('table')
                .should('have.attr', 'style', `float:${alignment};`)
        }
        else {
            cy.get('div.cgdp-article-body.cgdp-article-body--multiple').find('section').eq(index)
                .find('figure').find('div').find('div').find('table')
                .should('not.have.attr', 'align')
        }
    }
});

And('table at position {int} has {int} headers', (num, compareNum) => {
    cy.get('div.cgdp-article-body.cgdp-article-body--multiple').find('section').eq(num)
        .find('th').should('have.length', (compareNum))
})

And('the rest of the tables have the following table contents', (dataTable) => {
    for (const { index, row } of dataTable.hashes()) {
        var tempRows = row.split(',');
        for (let i = 0; i < tempRows.length; i++) {
            const contents = tempRows[i].split("|");
            for (let j = 0; j < contents.length; j++) {
                cy.get('div.cgdp-article-body.cgdp-article-body--multiple').find('section').eq(index)
                    .find('tr').eq(i).children().then(child => {
                        cy.wrap(child).eq(j).should('have.text', contents[j])
                    })
            }
        }
    }
})