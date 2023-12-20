/// <reference types="Cypress" />
import { Then, And } from "cypress-cucumber-preprocessor/steps";




And('user clicks on NCIDS Dynamic list item at position {int}', (index) => {
    cy.get('div.cgdp-dynamic-list').find('li.usa-collection__item a').eq(index - 1).trigger('click', { followRedirect: false });
})

And('user clicks on NCIDS right rail link {string}', (href) => {
    cy.get(`a[href="${href}"]`).trigger('click', { followRedirect: false });
});

