/// <reference types="Cypress" />
import { When } from 'cypress-cucumber-preprocessor/steps';
const frontEndBaseUrl = Cypress.env('front_end_base_url');

When('the server sends a {int} response to {string}', (statusCode, requestUrl) => {
    cy.intercept(requestUrl, {
        statusCode: statusCode
    })
});

When('user is navigating to the front end site with path {string}', (purl) => {
    cy.visit(`${frontEndBaseUrl}${purl}`, { retryOnStatusCodeFailure: true });
});