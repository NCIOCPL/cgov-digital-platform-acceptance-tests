/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';
function createRandomStr() {
    var result = '';
    var characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
    var charactersLength = characters.length;
    for (var i = 0; i < 5; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
}
let randomNum = createRandomStr();
const siteSection = Cypress.env('test_site_section');
const frontEndBaseUrl = Cypress.env('front_end_base_url');

And('user fills out the following fields', (dataTable) => {
    for (let { fieldLabel, value, field_name } of dataTable.hashes()) {
        if (fieldLabel === 'Pretty URL') {
            value = `${value}-${randomNum}`;
        }
        cy.get(`input[name^='${field_name}']`).as('inputField').parent().find('label').should('include.text', fieldLabel);
        cy.get('@inputField').type(value);
    }
});

And('user clicks on title with url {string} from the list of content', (contentHref) => {
    cy.get(`a[href='${siteSection}/${contentHref}-${randomNum}']`).click();
});

And('user selects a checkbox next to title with url {string} from the list of content', (url) => {
    cy.get(`a[href='${siteSection}/${url}-${randomNum}']`).parent().parent().find('input.form-checkbox').check();
});

Given('user is navigating to the front end site with path site section plus {string}', (purl) => {
    cy.visit(`${frontEndBaseUrl}${siteSection}/${purl}-${randomNum}`, { retryOnStatusCodeFailure: true });
});

And('the content item with url {string} does not exist in the list of content', (url) => {
    cy.get(`a[href='${siteSection}/${url}-${randomNum}']`).should('not.exist');
});

/*----------- Scenario: User is adding new Cancer Type Homepage content type------------ */
And('user selects {string} from {string} dropdown',(dropdown,cartOption)=> {
    cy.get(`.placeholder:contains("${cartOption}")`).parent().find(`input[value="${dropdown}"]`).click({ force: true })
})

And('user selects {string} from CTHP Card Theme dropdown',(dropdown)=>{
    cy.get("select[name*='[field_cthp_card_theme]']").select(dropdown)
})

And('user fills out Overview Card Text field text area with {string}',(value)=>{
    cy.getIframeBody("iframe[class='cke_wysiwyg_frame cke_reset']").find('p').type(value)
})

/* ---------- Scenario: Adding guide card ---------- */

