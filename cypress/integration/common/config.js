import { Then } from "cypress-cucumber-preprocessor/steps";

Then('page title is {string}', (pageTitle) => {
    cy.get('h1').first().should('include.text', pageTitle);
  });

  Then('page displays left navigation', () => {
    cy.get('#nvcgSlSectionNav').should('be.visible');
  });

  Given('user is navigating to bad url {string}', (badUrl) => {
    cy.request({
      url: badUrl,
      failOnStatusCode: false
    }).then((resp) => {
      Cypress.statuscode = resp.status;
    })
  });
  
  Then('status code is 404',()=>{
    expect(Cypress.statuscode).to.be.eq(404);
  });