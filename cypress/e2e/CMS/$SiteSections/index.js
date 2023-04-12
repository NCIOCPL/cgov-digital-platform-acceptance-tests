/// <reference types="Cypress" />
import { And, When } from 'cypress-cucumber-preprocessor/steps';

const frontEndBaseUrl = Cypress.env('front_end_base_url');
const siteSection = Cypress.env('test_site_section');
const randomStr = Cypress.env('randomStr');

function waitForText(attempt = 0) {

    if (attempt > 3) {   // choose cutoff point, must have this limiter
        throw 'Failed'
    }
    cy.wait(1000);
    const text = Cypress.$('ul.usa-sidenav__sublist a.usa-current').text();
    if (text.trim().startsWith('Nav')) {
        cy.reload();
        waitForText(attempt + 1)
    }
}

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

let firstSiteSection;
When('user selects first {string} site section', (selectSiteSection) => {
    cy.get("input[value='Select Site Section']").click({ force: true });
    cy.getIframeBody('iframe.entity-browser-modal-iframe')
        .find('input[name="computed_path_value"]').type(selectSiteSection);
    cy.getIframeBody('iframe.entity-browser-modal-iframe')
        .find('input#edit-submit-site-section-browser').click({ force: true });
    cy.getIframeBody('iframe.entity-browser-modal-iframe')
        .find(`td:contains('${selectSiteSection}')`).first().parent()
        .find('td.views-field.views-field-entity-browser-select input').check();
        cy.getIframeBody('iframe.entity-browser-modal-iframe')
        .find(`td:contains('${selectSiteSection}')`).first().then(($el)=>{
            firstSiteSection = $el.text().trim();
        })
        
    cy.getIframeBody('iframe.entity-browser-modal-iframe')
        .find("input[id='edit-submit'][value='Select Site Section']").click();
});

Given('user is navigating to the front end site with selected path {string}', (purl) => {
    cy.on('uncaught:exception', (err, runnable) => {
        if (err.message.includes('Failed to load script https://assets.adobedtm.com')) {
            return false;
        }
        return true;
    })
    cy.visit(`${frontEndBaseUrl}${firstSiteSection}/${purl}-${randomStr}`, { retryOnStatusCodeFailure: true });
});

Given('user is navigating to the front end site with path {string}', (purl) => {
    cy.on('uncaught:exception', (err, runnable) => {
        if (err.message.includes('Failed to load script https://assets.adobedtm.com')) {
            return false;
        }
        return true;
    })
    if (purl == '/about-cancer/coping') {
        cy.visit(`${frontEndBaseUrl}${purl}`, { retryOnStatusCodeFailure: true });
    }
    else {
        cy.visit(`${frontEndBaseUrl}${purl}-${randomStr}`, { retryOnStatusCodeFailure: true });
    }
});

Then('the current page is {string} in left nav', (title) => {
    cy.get(`li.usa-sidenav__item a:contains("${title}")`).should('have.attr', 'aria-current', 'page');
});

And('the following nav children are displayed', (dataTable) => {
    for (const { label } of dataTable.hashes()) {
        waitForText();
        cy.get('a[class="usa-current"]').siblings('ul').find(`a:contains("${label}")`).should('be.visible');
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

And('user selects {string} operation for {string}', (btn, termName) => {
    cy.get(`a.menu-item__link:contains("${termName}")`).parent().parent().find(`td li.dropbutton-action a:contains("${btn}")`).click({ force: true });
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

And('user drags {string} item one level down', (dragLink) => {
    cy.get(`a.menu-item__link:contains("${dragLink}")`).parent().find('a.tabledrag-handle').trigger('mousedown', { which: 1, pageX: 200, pageY: 50 })
        .trigger('mousemove', { which: 1, clientX: 50, clientY: 50, pageY: 100 })
        .trigger('mouseup')
});

And('{string} appears in position {int} in the side menu tree', (label, position) => {
    cy.get('ul.usa-sidenav__sublist li').eq(position - 1).find(`a:contains("${label}")`).should('be.visible');
});

And('user clicks on title with the url {string} from the list of content', (contentHref) => {
    cy.get(`a[href='${contentHref}-${randomStr}']`).click();
});

Then('the current left navigation label has url {string}', (currentHref) => {
    cy.get(`ul.usa-sidenav__sublist li a[href='${currentHref}']`).should('have.class', 'usa-current');
});

And('left navigation label {string} has selected site section url plus {string}',(label, purl)=>{
    cy.get('ul.usa-sidenav__sublist li').find(`a:contains("${label}")`).should('have.attr', 'href', `${firstSiteSection}/${purl}-${randomStr}`);
})

And('left navigation label {string} has url {string}', (label, contentHref) => {
    cy.get('ul.usa-sidenav__sublist li').find(`a:contains("${label}")`).should('have.attr', 'href', contentHref);
});