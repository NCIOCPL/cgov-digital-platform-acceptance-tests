/// <reference types="Cypress" />

import { Given, Then } from "cypress-cucumber-preprocessor/steps";
const baseUrl = Cypress.config('baseUrl');

Given('user makes html request to {string}', (url) => {
  cy.request(url).as('html_response');

});

const currentFeature = Cypress.spec.relative;
const featurePath = currentFeature.replace('.feature', '');


Then('the html response matches the contents of {string}', (fileName) => {
  // Test data should always live in a folder with the same name as the
  // feature. (Just like any step definitions.)
  //
  // The filepath is relative to cypress.json, which lives in the root
  // of the repo. This path is also going to be turned into a URL, so
  // we can't let it try and use back slashes on windows. (So skip
  // using the node path module.)

  const fullPath = featurePath + '/' + fileName;
  let expectedStr;
  let actualStr;
  cy.get('@html_response').then((response) => {
    cy.writeFile(`${featurePath}/response/response.txt`, response.body)
  });

  cy.readFile(fullPath).then((fileData) => {
    expectedStr = JSON.stringify(fileData.replaceAll('{BASE_URL}',baseUrl))
 
  });
  cy.readFile(`${featurePath}/response/response.txt`).then((fileData) => {
    actualStr = JSON.stringify(fileData)
    expect(actualStr).to.deep.eq(expectedStr)
  });

  cy.task('deleteFolder', `${featurePath}/response`)
})
