/// <reference types="Cypress" />
import { And, When, Then } from 'cypress-cucumber-preprocessor/steps';

And('browser title name is set to {string} by default', (defaultValue) => {
    cy.get('select#edit-browser-display-type >option:contains("NCI")').should('have.attr', 'selected', 'selected');
});

When('user selects {string} option', (option) => {
    cy.get('select#edit-browser-display-type').select(option)

});

And('user clicks on {string} sub tab', (contentSubTab) => {
    cy.get(`dt.admin-item__title a:contains("${contentSubTab}")`).click({ force: true });
});

Then('the title tag should be {string}', (expectedTitle) => {
    cy.reload(true);
    cy.get('head>title').invoke('text').should('be.eq', expectedTitle);
});


And('user types {string} in the custom title field', (siteName) => {
    cy.get('#edit-custom-site-title-value').type(siteName)
})

And('user clears custom title field', () => {
    cy.get('#edit-custom-site-title-value').clear()
})

And('text {string} is shown on the page', (textVal) => {
    cy.get('#block-cgov-admin-content').should('include.text',textVal)
})

