/// <reference types="Cypress" />
import { And, When } from 'cypress-cucumber-preprocessor/steps';

const frontEndBaseUrl = Cypress.env('front_end_base_url');
const siteSection = Cypress.env('test_site_section');

And('user clicks on {string} sub tab', (contentSubTab) => {
    cy.get(`ul.admin-list li a:contains("${contentSubTab}")`).click({ force: true });
});

And('user selects {string} option from Operations for {string}', (option, label) => {
    cy.get(`.dropbutton >.list > a:contains("${option}")`).last().click({ force: true });
});

And('user types {string} into Landing Page field', (articleName) => {
    cy.get(`[class*='form-item-field-landing-page-0-target-id']`).find('input#edit-field-landing-page-0-target-id').type(articleName);
});

And('user selects {string} from landing page dropdown', (item) => {
    cy.get(`a:contains('${item}')`).first().should('be.visible').click({ force: true });
});

And('user expands RELATIONS dropdown', () => {
    cy.get('details#edit-relations').find('span').first().click({ force: true });
});

And('user selects {string} from RELATIONS dropdown', (selectSiteSection) => {
    cy.get('#edit-parent').should('be.visible').select(selectSiteSection);
});

And('user removes site section', () => {
    cy.get('#edit-field-site-section-current-items-0-remove-button').click();
});

When('user selects {string} site section', (selectSiteSection) => {
    cy.get("input[value='Select Site Section']").click({ force: true });
    cy.getIframeBody('iframe.entity-browser-modal-iframe')
        .find('input[name="computed_path_value"]').type(selectSiteSection);
    cy.getIframeBody('iframe.entity-browser-modal-iframe')
        .find('input#edit-submit-site-section-browser').click({ force: true });
    cy.getIframeBody('iframe.entity-browser-modal-iframe')
        .find(`td:contains('${selectSiteSection}')`).first().parent()
        .find('td.views-field.views-field-entity-browser-select input').check();
    cy.getIframeBody('iframe.entity-browser-modal-iframe')
        .find("input[id='edit-submit'][value='Select Site Section']").click();
});

Given('user is navigating to the front end site with path {string}', (purl) => {
    cy.on('uncaught:exception', (err, runnable) => {
        if (err.message.includes('Failed to load script https://assets.adobedtm.com')) {
            return false;
        }
        return true;
    })
    cy.visit(`${frontEndBaseUrl}${purl}`, { retryOnStatusCodeFailure: true });
});

Then('the current page is {string} in left nav', (title) => {
    cy.get(`li.usa-sidenav__item a:contains("${title}")`).should('have.attr', 'aria-current', 'page');
});

And('the following nav children are displayed', (dataTable) => {
    for (const { label } of dataTable.hashes()) {
        cy.get('a[class="usa-current"]').siblings('ul').find(`a:contains("${label}")`).should('be.visible')
    }
});

And('{string} has been selected', (titleText) => {
    cy.get(`div[id*='edit-field-site-section-current-items-0']`).should('be.visible').and('contain.text', titleText);
});

And('{int} level up section is {string}', (level, label) => {
    let ancestors;
    cy.document().then(doc => {
        ancestors = doc.querySelectorAll('.usa-current.usa-current--nci-ancestor').length;
        cy.get('.usa-current.usa-current--nci-ancestor').eq(ancestors - level).should('have.text', label);
    })

});

And('user selects a checkbox next to title {string} with url {string} from the list of content', (title, lastPartUrl) => {
    cy.get(`a:contains("${title}")`).parent().parent().find('input.form-checkbox').check();
});

And('user clicks on the {string} action button', (buttonLabel) => {
    cy.get(`input[value='${buttonLabel}']`).first().click();
});

And('user selects {string} link under {string}', (children, parentName) => {
    cy.get(`a.menu-item__link:contains("${parentName}")`).parent().parent().find(`a:contains("${children}")`).click();
});

And('user selects {string} operation for {string}', (editBtn, termName) => {
    cy.get(`ul.dropbutton a:contains("${editBtn}")`).first().click({ force: true });
});

And('user checks {string} checkbox to set as a nav root', (setNavRoot) => {
    cy.get(`label:contains("${setNavRoot}")`).parent().find('input').check();
});

Then('left navigation does not display {string}', (leftNavItem) => {
    cy.get(`nav[aria-label='Secondary navigation']`).find('a').contains(`${leftNavItem}$`).should('not.exist');
});

And('user checks {string} checkbox to set display option', (hideSectionNav) => {
    cy.get(`label:contains("${hideSectionNav}")`).parent().find('input').check();
});

And('user unchecks {string} checkbox', (checkboxLbl) => {
    cy.get(`label:contains("${checkboxLbl}")`).parent().find('input').uncheck();
});