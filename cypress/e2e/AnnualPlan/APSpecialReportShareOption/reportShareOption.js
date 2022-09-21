/// <reference types="Cypress" />

import { When, Then } from "cypress-cucumber-preprocessor/steps";

Then('the following page options are displayed', dataTable => {
    for (const { pageOption } of dataTable.hashes()) {
        cy.document().then(doc => {
            if (doc.documentElement.clientWidth < 768) {
                cy.get(`.mobile-page-options #PageOptionsControl1 a[title='${pageOption}']`).should('be.visible');
            } else {
                cy.get(`#PageOptionsControl1 a[title='${pageOption}']`).should('be.visible');
            }
        })
    }
}

);


Then('the page options will have a header {string}', shareTitle => {
    cy.get(`.mobile-page-options p`).should('have.text', shareTitle);
});

Then('the page options should appear under the bottom of the content area', () => {
    cy.get(`.mobile-page-options #PageOptionsControl1`).should('have.attr', 'class').and('include', 'bottom');
});

Then('the page options should appear in a fixed position to the right of the main content area', () => {
    cy.get(` #PageOptionsControl1`).should('have.attr', 'class').and('not.include', 'bottom');
});

When('user clicks on a page option {string} link', (option) => {

    if (option === 'Print') {
        cy.window().then(win => {
            //stubbing the print window to prevent the call to open it, 
            //but still triggering the click event
            const printStub = cy.stub(win, 'print')
            cy.get(`div.page-options-container a[title='${option}']:visible`).click({ force: true });

        })
    } else {
        cy.get(`div.page-options-container a[title='${option}']:visible`).then(option$ => {
            option$.on('click', e => {
                e.preventDefault();
            });
        }).click({ force: true });
    }
});

Then('{string} option is not displayed', (pageOption) => {
    cy.document().then(doc => {
        if (doc.documentElement.clientWidth < 768)
            cy.get('div.mobile-page-options').find(`div.page-options-container a[title='${pageOption}']`).should('not.be.visible');
    });
});