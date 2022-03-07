/// <reference types="Cypress" />
import { And, Then } from 'cypress-cucumber-preprocessor/steps';

Then('the link with href {string} exists', (linkHref) => {
    cy.get(`a[href='${linkHref}']`).should('be.visible');
});

When('user expands {string}', (accordionSectionID) => {
    cy.get(`section[id='_${accordionSectionID}']`).click();
});