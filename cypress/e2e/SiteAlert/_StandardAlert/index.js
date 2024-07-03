/// <reference types="Cypress" />
import { And, Then } from 'cypress-cucumber-preprocessor/steps';

const username = Cypress.env('admin_username');
const password = Cypress.env('admin_password');

When('user enters credentials of {string}', (username) => {
    // the password value should not be shown
    if (typeof password !== 'string' || !password || password === '') {
        throw new Error('Missing password value, set using CYPRESS_admin_password=...')
    }
    cy.get('input#edit-name').type(username, { log: false });
    cy.get('input#edit-pass').type(password, { log: false });
});

And('user clicks {string} button', (loginButton) => {
    cy.get('input#edit-submit').contains(loginButton).click();
});

When('user is logged in and the user name {string} is displayed in the toolbar', (username) => {
    cy.get('#toolbar-item-user').should('include.text', username).and('be.visible');
});

And('user clicks on {string} button', (block) => {
    cy.get('div#block-cgov-admin-local-actions li a').as('addBlock').should('include.text', block);
    cy.get('@addBlock').click();
});
Then('the list of block contents appears', () => {
    cy.get('dl.admin-list dt').should('have.length.above', 0);
})
When('user clicks on {string} content', (rawHtml) => {
    cy.get(`dt a:contains("${rawHtml}")`).click();
});

And('user enters {string} into the block description field', (descr) => {
    cy.get('#edit-info-0-value').type(descr);
});

And('user enters raw html in the body', (dataTable) => {
    for (const { rows } of dataTable.hashes()) {
        cy.get('div.form-textarea-wrapper').first().type(rows);
        cy.get('div.form-textarea-wrapper').first().type(' ');
    }
});

And('user hits {string} button', (save) => {
    cy.get('#edit-submit').click();
});

When('user clicks {string} tab', (str) => {
    cy.get(`li>a:contains("${str}")`).eq(1).click();
})

And('user places the {string} block', (siteAlertArea) => {
    cy.get('#edit-blocks-region-ncids-site-alerts-title a').click();
});

And('user filters by {string}', (str) => {
    cy.get('input.block-filter-text.form-search').type(str);
    cy.wait(2000);
    cy.get(`div.block-filter-text-source:contains('${str}')`).parent().parent().find('li a').click();
});

And('user unchecks show title and clicks save', () => {
    cy.get("input[id^='edit-settings-label-display']").check();
    cy.get('div.ui-dialog-buttonset.form-actions button').click();
});

Then('standard site alert is displayed', () => {
    cy.get("section[class*='usa-site-alert usa-site-alert--info']").should('be.visible');
});
And('alert has {string} button', (btnLbl) => {
    cy.get('button[class*="usa-alert__nci-button--close"]').should('be.visible').and('have.attr', 'aria-label', btnLbl);
});
When('user clicks on {string} arrow button', (expandCollapseBtn) => {
    cy.get('button[class*="usa-alert__nci-button--toggle"]').click();
});
Then('alert is {string}', (isExpanded) => {
    let state = isExpanded === 'expanded' ? 'true' : 'false';
    cy.get('button[class*="usa-alert__nci-button--toggle"]').should('have.attr', 'aria-expanded', state);
});
And('the following links are exposed', (dataTable) => {
    for (const { linkText, href } of dataTable.hashes()) {
        cy.get(`section[class*='usa-site-alert usa-site-alert--info'] li a:contains("${linkText}")`).should('be.visible').and('have.attr','href').and('include',href);
    }
});

And('alert links are hidden', () => {
    cy.get(`section[class*='usa-site-alert usa-site-alert--info'] li a`).should('not.be.visible');
});

When('user clicks on {string} alert link', (linkText) => {
    cy.get(`section[class*='usa-site-alert usa-site-alert--info'] li a:contains("${linkText}")`).click();
});

When('user dismisses alert', () => {
    cy.get('button[class*="usa-alert__nci-button--close"]').click();
});

Then('standard site alert is not displayed', () => {
    cy.get("section[class*='usa-site-alert usa-site-alert--info']").should('not.be.visible');
});



