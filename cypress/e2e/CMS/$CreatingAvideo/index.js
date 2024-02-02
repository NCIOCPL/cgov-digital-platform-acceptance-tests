/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';

const siteSection = Cypress.env('test_site_section');
const frontEndBaseUrl = Cypress.env('front_end_base_url');
const randomStr = Cypress.env('randomStr');

And('user types {string} into Caption text field', (value) => {
    cy.getNthIframe("iframe[class='cke_wysiwyg_frame cke_reset']", 1).find('p').type(value)
})

And('user selects {string} option from {string} dropdown', (dropdwon, section) => {
    cy.get(`.placeholder:contains("${section}")`).parent().find(`input[value="${dropdwon}"]`).click({ force: true })
})

And('user clicks on {string} link in the {string} text area', (link, linkOption) => {
    cy.get(`div:contains("${linkOption}")`).parent().parent().find(`summary:contains("${link}")`).click({ force: true })
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

Then('user selects {string} option from Operations dropdown for media with title {string}', (translateOption, title) => {
    cy.get(`td:contains('${title}')`).siblings('td').find(`ul.dropbutton >li> a:contains("${translateOption}")`).click({ force: true });
});

Given('user is navigating to the front end site with spanish path {string} site section plus {string}', (spPath, purl) => {
    cy.visit(`${frontEndBaseUrl}${spPath}${siteSection}/${purl}-${randomStr}`, { retryOnStatusCodeFailure: true });
});

And('user selects a checkbox next to the title with spanish path {string} with url {string} from the list of content', (spPath, purl) => {
    cy.get(`a[href='${spPath}${siteSection}/${purl}-${randomStr}']`).parent().parent().find('input.form-checkbox').check();
});

And('user clicks on title with url spanish path {string} site section plus {string}', (spPath, purl) => {
    cy.get(`a[href='${spPath}${siteSection}/${purl}-${randomStr}']`).click();
});