/// <reference types="Cypress" />
import { When } from "cypress-cucumber-preprocessor/steps";

When('user clicks on summary box link {string}', (href) => {
    cy.get(`a[class*='usa-summary-box__link '][href='${href}']`).trigger('click', { followRedirect: false })
});

When('user expands letter {string}', (letter) => {
    cy.get(`button.usa-accordion__button:contains(${letter})`).trigger('click', { followRedirect: false })
});

When('user clicks on cancer type link {string}', (href) => {
    cy.get(`a[class*='usa-link text-no-underline'][href='${href}']`).trigger('click', { followRedirect: false })
});

When('user clicks on combo box input field', () => {
    cy.get(`input#find-cancer-type`).trigger('click', { followRedirect: false })
});

When('user selects {int} item in dropdown', (index) => {
    cy.get(`li[aria-posinset='${index}'`).click()
});

When('user clears combobox', () => {
    cy.get(`.usa-combo-box__clear-input`).click()
});
