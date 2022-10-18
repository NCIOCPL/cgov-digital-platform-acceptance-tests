/// <reference types="Cypress" />
import { Given, Then } from "cypress-cucumber-preprocessor/steps";

/**
 * cy.request('https://jsonplaceholder.cypress.io/comments').as('comments')

cy.get('@comments').should((response) => {
  expect(response.body).to.have.length(500)
  expect(response).to.have.property('headers')
  expect(response).to.have.property('duration')
})
 */

Given('user makes json request to {string}', (url) => {
  cy.request(url).as('json_response');
});

Given('user makes bad json request to {string}', (url) => {
  cy.request({
    url: url,
    failOnStatusCode: false
  }).as('json_response');
});

Then('the json response matches the contents of {string}', (fileName) => {
  // Test data should always live in a folder with the same name as the
  // feature. (Just like any step definitions.)
  //
  // The filepath is relative to cypress.json, which lives in the root
  // of the repo. This path is also going to be turned into a URL, so
  // we can't let it try and use back slashes on windows. (So skip
  // using the node path module.)
  const currentFeature = Cypress.spec.relative;
  const featurePath = currentFeature.replace('.feature', '');
  const fullPath = featurePath + '/' + fileName;

  cy.readFile(fullPath).then((fileData) => {
    cy.get('@json_response').should((response) => {
      expect(response.body).to.deep.equal(fileData);
    });
  });
})

Then('the json response matches the contents of {string} and status code is {int}', (fileName, statusCode) => {
  const currentFeature = Cypress.spec.relative;
  const featurePath = currentFeature.replace('.feature', '');
  const fullPath = featurePath + '/' + fileName;

  cy.readFile(fullPath).then((fileData) => {
    cy.get('@json_response').should((response) => {
      expect(response.body).to.deep.equal(fileData);
      expect(response.status).to.eq(statusCode);
    });
  });
})
