/// <reference types="Cypress" />
import { Given, And, Then, When } from 'cypress-cucumber-preprocessor/steps';

And('user selects {string} from {string} CTHP dropdown', (dropdown, cartOption) => {
    cy.get(`.placeholder:contains("${cartOption}")`).parent().parent().find(`input[value="${dropdown}"]`).eq(0).click({ force: true })
})

And('user selects {string} from CTHP Card Theme dropdown number {int}', (option, index) => {
    cy.get('select[id*="cthp-card-theme"]').eq(index - 1).select(option)
})

And('user clicks on {string} link in the {string} text area', (link, linkOption) => {
    cy.get(`div:contains("${linkOption}")`).parent().parent().find(`span:contains("${link}")`).eq(0).click({ force: true })
})

And('user clicks on {string} button from {string} text area', (title, option) => {
    cy.get(`div.paragraph-type-title:contains("${option}")`).parent().parent().find(`input[value="${title}"]`).click({ force: true })
})

And('user filters summaries list by {string} language', (dropdown) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("select[name='langcode']").select(dropdown)
})

And('user filters summaries by text {string}', (filterText) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[name='title']").type(filterText)
})

And('user clicks on {string} button', (contentBtn) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`input[value="${contentBtn}"]`).click({ force: true })
    cy.wait(2000)
})

And('user selects {int} PDQ Summary from the list of summaries', (num) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find('input.form-checkbox').first().click({ force: true })
})

And('user clicks on {string} button to select item', (listBtn) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`input[value="${listBtn}"]`).click({ force: true })
})

Then('pdq link displaying link as {string}', (displayLink) => {
    cy.get('a[href="/about-cancer/treatment/cam/hp/acupuncture-pdq"]').should('have.text', displayLink)
})

When('user clicks on {string} link', (linkTitle) => {
    cy.get('a[href="/about-cancer/treatment/cam/hp/acupuncture-pdq"]').should('have.text', linkTitle).click({ force: true })
})