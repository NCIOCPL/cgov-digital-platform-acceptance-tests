/// <reference types="Cypress" />

import { And, Then, Given, When } from 'cypress-cucumber-preprocessor/steps';
const frontEndBaseUrl = Cypress.env('front_end_base_url');

And('user clicks on {string} sub tab', (contentSubTab) => {
    cy.get(`a.admin-item__link:contains("${contentSubTab}")`).click({ force: true });
});

When('user clicks on {string} in {string} region', (placeBlock, region) => {
    cy.get(`td:contains("${region}")`).find(`a:contains("${placeBlock}")`).click({ force: true });
})

And('user clicks on {string} for {string} block', (action, blockType) => {
    cy.get(`.block-filter-text-source:contains("${blockType}")`).parent().parent().find('a').click({ force: true });
    cy.wait(2000)
});

And('user types {string} in the block title field', (value) => {
    cy.get('label[for^="edit-settings-label"]:contains("Title")').parent().find('input').type(value);
})

And('user checks {string} checkbox', (titleChkbx) => {
    cy.get(`label.option:contains('${titleChkbx}')`).parent().find('input').check();
})

And('user types {string} in the {string} field', (text, lbl) => {
    cy.get(`label:contains("${lbl}")`).parent().find('input').type(text);
});

When('user uploads {string} in {string} logo image', (fileName, breakpoint) => {
    cy.fixture(fileName, { encoding: null }).as('fixture')
    cy.get(`label[id^="edit-settings-logo-logos-${breakpoint}-logo-upload"]`).parent()
        .find('input[type=file]').selectFile('@fixture');
    cy.wait(2000);
})

And('user clicks on {string} option in Visibility section', (option) => {
    cy.get(`strong:contains("${option}")`).parent().click({ force: true });
});

And('user types {string} in the {string} text field', (path, txtField) => {
    cy.get(`label[for^="edit-visibility-request-path-pages"]:contains("${txtField}")`).parent().find('textarea').type(path)
});

And('user saves block', () => {
    cy.get('button:contains("Save block")').click({ force: true })
})

And('user saves editing block', () => {
    cy.get('input[value="Save block"]').click({ force: true })
})

When('user clicks on {string} button for {string} block', (action, blockName) => {
    cy.get(`td:contains("${blockName}")`).parent().find(`a:contains("${action}")`).click({ force: true })
})

And('user selects {string} radio button', (option) => {
    cy.get(`label.option:contains("${option}")`).parent().find('input').check();
});

Given('user is navigating to the front end site with path {string}', (path) => {
    cy.visit(`${frontEndBaseUrl}${path}`, { retryOnStatusCodeFailure: true });
})

And('site logo is displayed with image src {string}', (src) => {
    cy.get('.nci-logo picture source').should('have.attr', 'srcset').then((attrSrc) => {
        expect(attrSrc.replace('.svg', '')).to.include(src.replace('.svg', ''))
    })
})

And('mobile site logo is displayed with image src {string}', (src) => {
    cy.get('.nci-logo picture img').should('have.attr', 'src').then((attrSrc) => {
        expect(attrSrc.replace('.svg', '')).to.include(src.replace('.svg', ''))
    })
});

And('{string} logo attribute has a value {string}', (attr, value) => {
    cy.get('.nci-logo a').should('have.attr', attr, value);
});

And('search box does not exist', () => {
    cy.get('.nci-header-search').should('not.exist')
});

And('search box is displayed', () => {
    cy.get('.nci-header-search').should('be.visible')
});

And('user selects {int} item from Search Results Page dropdown', () => {
    cy.get('a.ui-menu-item-wrapper').click({ force: true });
});

Then('error {string} is displayed', (errMsg) => {
    cy.get('div[role="alert"]').should('include.text', errMsg);
})

When('user clicks on Remove logo for {string}', (breakpoint) => {
    cy.get(`div[id^="edit-settings-logo-logos-${breakpoint}-logo-upload"] input[value="Remove"]`).click({ force: true })
    cy.wait(3000)
});

And('user confirms removal of block',()=>{
cy.get('input[value="Remove"]').click({force:true});
});

And('user clears out {string} text field',(txtField)=>{
    cy.get(`label[for^="edit-visibility-request-path-pages"]:contains("${txtField}")`).parent().find('textarea').clear();
})

And('user fills out Search Results Page field with {string}',(text)=>{
cy.get("input[name^='settings[header_config][search_results_page]']").type(text);
})       
