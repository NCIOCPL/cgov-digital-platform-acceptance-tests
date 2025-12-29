/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';


And('user enters {string} into content title search box and clicks {string}', (nameToSearch, applyBtn) => {
    cy.getIframeBody('iframe#entity_browser_iframe_embedded_external_link_browser').find(`input[id*="edit-info"]`).type(nameToSearch);
    cy.getIframeBody('iframe#entity_browser_iframe_embedded_external_link_browser').find(`input[id*="edit-submit-external-link-content-browser"][value=${applyBtn}]`).click({ force: true });
    cy.wait(2000)
});

And('user selects {string} item from the content list', (contentTitle) => {
    cy.getIframeBody('iframe#entity_browser_iframe_embedded_external_link_browser').find('input[name^="entity_browser_select"][type="checkbox"]').check();
});

And('user clicks on {string} button to select the media', (selectImage) => {
    cy.getIframeBody('iframe#entity_browser_iframe_embedded_external_link_browser').find(`input[id="edit-submit"][value='${selectImage}']`).click({ force: true });
});