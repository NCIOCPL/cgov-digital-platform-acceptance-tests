// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';

Then('correct status code {int} is received for the {string}', (code, path) => {
    cy.request({
        url: path,
      }).then((resp) => {
        expect(resp.status).to.eq(code);      })

});