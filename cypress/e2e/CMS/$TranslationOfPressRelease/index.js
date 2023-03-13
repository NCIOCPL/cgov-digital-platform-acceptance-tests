/// <reference types="Cypress" />
import { And, When } from 'cypress-cucumber-preprocessor/steps';
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

/* -------- Scenario: Add a translation ------- */
Then('user selects {string} option from Operations dropdown for content with title {string}', (translateOption, title) => {
    cy.get(`td:contains('${title}')`).siblings('td').find(`ul.dropbutton >li> a:contains("${translateOption}")`).click({ force: true });
    });

When('user clicks on {string} button to add translation',(button)=>{
    cy.get(`li[class='add dropbutton-action'] a:contains("${button}")`).click({force: true})
})

Then('page title is {string}',(title)=>{
    cy.get(`h1:contains("${title}")`).should('be.visible')
})

And('the following fields are displayed',(dataTable)=>{
    for (const {fieldLabel, field_name} of dataTable.hashes()){
     cy.get(`div[class='layout-region layout-region-node-main'] label:contains("${fieldLabel}")`).should('be.visible')
    }
})

And('body was translated as {string}',(title)=>{
    cy.get(`label:contains("${title}")`).should('be.visible')   
})

And('Remove button for image was translated as {string}',(deletButton)=>{
    cy.get(`input[value="${deletButton}"]`).eq(0).click({force: true})
})

And('Related Resources section was translated as {string}',(dropdownLabel)=>{
    cy.get("strong[data-drupal-selector='edit-field-related-resources-title']").should('include.text', dropdownLabel)
})

And('dropdown to add link under related resources was translated to start with {string}',(label2) =>{
    cy.get("input[id*='cgov-internal-link']").contains(label2)
})

And('button to add citation was translated as {string}',(label)=>{
    cy.get(`input[value='${label}']`).should('be.visible')
})

And('current state was translated as {string} Borrador',(label)=>{
    cy.get(`div[id*='edit-moderation-state-0-'] label:contains('${label}')`).should('be.visible')
})

And('Save button was translated as {string}',(button)=>{
    cy.get("div[id='edit-actions']").parent().find(`input[value="${button}"]`).should('be.visible')
})

And('preview button was translated as {string}',(lable1)=>{
    cy.get(`input[value="${lable1}"]`).should('be.visible')
})

/* -------- Scenario: Verify translated content ------- */
And('page title is {string}',(title)=>{
    cy.get(`h1:contains("${title}")`).should('be.visible')
})

And('dates were translated as follows',(dataTable)=>{
    for (const {date} of dataTable.hashes()){
    cy.get(`div[class='document-dates horizontal'] li>strong:contains("${date}")`).should('be.visible')
    }
})