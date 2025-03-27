// ***********************************************************
// This example support/index.js is processed and
// loaded automatically before your test files.
//
// This is a great place to put global configuration and
// behavior that modifies Cypress.
//
// You can change the location of this file or turn off
// automatically serving support files with the
// 'supportFile' configuration option.
//
// You can read more here:
// https://on.cypress.io/configuration
// ***********************************************************

// Import commands.js using ES2015 syntax:
import './commands'
import "cypress-real-events";
// Alternatively you can use CommonJS syntax:
// require('./commands')


Cypress.Commands.add('getIframeBody', (locator) => {
  // get the iframe > document > body
  // and retry until the body element is not empty
  return cy
    .get(locator)
    .its('0.contentDocument.body').should('not.be.empty')
    // wraps "body" DOM element to allow
    // chaining more Cypress commands, like ".find(...)"
    // https://on.cypress.io/wrap
    .then(cy.wrap)
})

Cypress.Commands.add('getNthIframe', (locator, position) => {
  // get the iframe > document > body
  // and retry until the body element is not empty
  return cy
    .get(locator).eq(position)
    .its('0.contentDocument.body').should('not.be.empty')
    // wraps "body" DOM element to allow
    // chaining more Cypress commands, like ".find(...)"
    // https://on.cypress.io/wrap
    .then(cy.wrap)
})

Cypress.Commands.add('hasPseudoElement', {prevSubject:true}, (subject, pseudo) => {
  return window.getComputedStyle(subject[0], pseudo).content !== 'none'
})