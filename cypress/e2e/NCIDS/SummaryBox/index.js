/// <reference types="Cypress" />
import { When } from "cypress-cucumber-preprocessor/steps";


When('user clicks on {int} link {string} in summary box', (index, href) => {
    cy.get(`div.usa-summary-box__body a[href="${href}"]`).eq(index - 1).then(link$ => {
        link$.on('click', e => {
            e.preventDefault();
        });
    })
        .click({ followRedirect: false });
});

