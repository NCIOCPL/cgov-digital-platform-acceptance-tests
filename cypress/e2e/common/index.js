import { And, Then } from "cypress-cucumber-preprocessor/steps";
const baseUrl = Cypress.config('baseUrl');

Given('user is navigating to {string}', (a) => {
  cy.visit(a);
});

Then("browser title is {string}", (title) => {
  cy.title().should('eq', title);
});

Given('user is navigating to {string} with a 404 status', (a) => {
  Cypress.on('uncaught:exception', (err, runnable) => {
    // returning false here to Cypress from
    // failing the test
    return false;
  });
  cy.visit(a, { failOnStatusCode: false });
});

And('browser waits', () => {
  cy.wait(2000);
});

And('page title is {string}', (title) => {
  cy.get(`h1:contains('${title}')`).should('be.visible');
});

And('system waits for file upload process', () => {
  cy.get('.throbber', { timeout: 40000 }).should('not.exist')
});

And('browser waits for {int}', (time) => {
  cy.wait(time);
})

And('user refreshes the page', () => {
  cy.reload()
})

Then('correct status code {int} is received for the {string}', (code, path) => {
  cy.request({
    url: path,
  }).then((resp) => {
    expect(resp.status).to.eq(code);
  })

});

Then('the following favicons links are present', (dataTable) => {
  for (const { rel, href, sizes, type } of dataTable.hashes()) {
    cy.get(`link[rel='${rel}'][href='${href}']`).as('link').should('exist');
    if (sizes !== 'none')
      cy.get('@link').should('have.attr', 'sizes', sizes)
    if (type !== 'none')
      cy.get('@link').should('have.attr', 'type', type)
  }
});
