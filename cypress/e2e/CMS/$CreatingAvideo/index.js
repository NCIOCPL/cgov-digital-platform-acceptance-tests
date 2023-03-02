/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';

And('user types {string} into Caption text field', (value) => {
    cy.getNthIframe("iframe[class='cke_wysiwyg_frame cke_reset']", 1).find('p').type(value)
})

And('user selects {string} option from {string} dropdown', (dropdwon, section) => {
    cy.get(`.placeholder:contains("${section}")`).parent().find(`input[value="${dropdwon}"]`).click({ force: true })
})

And('user clicks on {string} link in the {string} text area', (link, linkOption) => {
    cy.get(`div:contains("${linkOption}")`).parent().parent().find(`span:contains("${link}")`).click({ force: true })
})

And('user clicks on {string} button item', (title) => {
    cy.get(`input[value="${title}"]`).click({ force: true })
})

And('user selects {string} from the list of media', (titleVideo) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[name='name']").type(titleVideo)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-submit-cgov-media-browser']").click()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`td:contains(${titleVideo})`).parent().find('input').eq(0).click({ foce: true })
})

And('user clicks on {string} button to select media', (listBtn) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`input[value="${listBtn}"]`).click({ force: true })
})

And('the {string} titles video is displayed', (title) => {
    cy.get(`p:contains("${title}")`).should('be.visible')
})

