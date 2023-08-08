/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';





And('user writes {string} into {string} labeled field', (value, fieldLabel) => {
    cy.get(`div[class*="cke_dialog_ui_text"] label:contains("${fieldLabel}")`).parent().find('div>input').type(value);
});

And('user clicks "OK" to save table properties', () => {
    cy.get('span:contains("OK")').click({ force: true })
});

And('user types {string} in all cells of table {int}', (cellText, tableNum) => {
    cy.getNthIframe("iframe[title='Rich Text Editor, Content field']", tableNum).find('td').each(($el) => {
        cy.wrap($el).type(cellText)
    })
});


And('user types {string} in all headers of table {int}', (cellText, tableNum) => {
    cy.getNthIframe("iframe[title='Rich Text Editor, Content field']", tableNum).find('th').each(($el) => {
        cy.wrap($el).type(cellText)
    })
});

And('the following tables are displayed', (dataTable) => {
    for (const { index, rowCount, columnCount, headerCount, caption, summary, alignment } of dataTable.hashes()) {
        cy.get('div.accordion').find('section').eq(index)
            .find('tr').should('have.length', rowCount)
        cy.get('div.accordion').find('section').eq(index)
            .find('td').should('have.length', (rowCount * columnCount) - headerCount)
        if (caption != 'null') {
            cy.get('div.accordion').find('section').eq(index)
                .find('figure').find('figcaption').should('have.text', caption)
        }
        else {
            cy.get('div.accordion').find('section').eq(index)
                .find('figure').find('figcaption').should('not.exist')
        }
        if (summary != 'null') {
            cy.get('div.accordion').find('section').eq(index)
                .find('figure').find('div').find('div').find('table')
                .should('have.attr', 'summary', summary)
        }
        else {
            cy.get('div.accordion').find('section').eq(index)
                .find('figure').find('div').find('div').find('table')
                .should('not.have.attr', 'summary')
        }
        if (alignment != 'null') {
            cy.get('div.accordion').find('section').eq(index)
                .find('figure').find('div').find('div').find('table')
                .should('have.attr', 'align', alignment)
        }
        else {
            cy.get('div.accordion').find('section').eq(index)
                .find('figure').find('div').find('div').find('table')
                .should('not.have.attr', 'align')
        }
    }
});

And('table at position {int} has {int} headers', (num, compareNum) => {
    cy.get('div.accordion').find('section').eq(num)
        .find('th').should('have.length', (compareNum))
})

And('the rest of the tables have the following table contents', (dataTable) => {
    for (const { index, row } of dataTable.hashes()) {
        var tempRows = row.split(',');
        for (let i = 0; i < tempRows.length; i++) {
            const contents = tempRows[i].split("|");
            for (let j = 0; j < contents.length; j++) {
                cy.get('div.accordion').find('section').eq(index)
                    .find('tr').eq(i).children().then(child => {
                        cy.wrap(child).eq(j).should('have.text', contents[j])
                    })
            }
        }
    }
})