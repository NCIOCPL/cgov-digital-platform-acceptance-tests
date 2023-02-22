/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';

And('card titled {string} has a link {string} with href {string}', (cardTitle, linkTitle, href) => {
    cy.get(`div[class*="cthp-treatment"]`).contains(`${cardTitle}`).parent().find('a').should('have.text', linkTitle).and('have.attr', 'href', href)
})

And('main content area does not have any links', () => {
    cy.get(`div[class="cthp-content"] a`).should('not.exist')
})