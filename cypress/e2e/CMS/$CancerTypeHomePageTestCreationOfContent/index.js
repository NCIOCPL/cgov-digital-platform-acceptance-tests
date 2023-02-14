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

/*----------- Scenario: User is adding new Cancer Type Homepage content type-----DONE------- */
And('user selects {string} from {string} CTHP dropdown',(dropdown,cartOption)=> {
    cy.get(`.placeholder:contains("${cartOption}")`).parent().find(`input[value="${dropdown}"]`).eq(0).click({ force: true })
})

And('user selects {string} from {int} {string} section {string} dropdown',(dropdown,num, dropdownLabel,option)=>{
    cy.get(`div:contains("${option}")`).parent().find(`label:contains("${dropdownLabel}")`).parent().find("select[name*='[field_cthp_card_theme]']").eq(num-1).select(dropdown)
})

And('user fills out Overview Card Text field text area with {string}',(value)=>{
    cy.getNthIframe("iframe[class='cke_wysiwyg_frame cke_reset']", 0).find('p').type(value)
})

/* ---------- Scenario: Adding guide card ---------- */
And('user fills out CTHP Guide Card Description field text area with {string}',(value)=>{
    cy.getNthIframe("iframe[class='cke_wysiwyg_frame cke_reset']", 1).find('p').type(value)
})

And('user clicks on {string} link in the {string} text area',(link, linkOption) =>{
    cy.get(`div:contains("${linkOption}")`).parent().find(`span:contains("${link}")`).eq(0).click({force: true})
})

And('user clicks on {string} button from {string} text area',(title, option)=>{
   cy.get(`div.paragraph-type-title:contains("${option}")`).parent().parent().find(`input[value="${title}"]`).click({force: true}) 
})

And('user filters summaries list by {string} language and clicks on {string} button',(dropdown,btn)=>{
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("select[name='langcode']").select(dropdown)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`input[value="${btn}"]`).click({force:true})   
})

And('user selects {int} PDQ Summary from the list of summaries',(num)=>{
    cy.getIframeBody('iframe.entity-browser-modal-iframe')
    //.find(`td:contains('${siteSection}')`).first().parent()
    .find('td.views-field views-field-title').first().check();
    //cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[name='entity_browser_select[node:1206]").eq(num - 1).check() 
})

And('user selects {string} from section {string} dropdown',(dropdown, option)=>{
    cy.get(`.placeholder:contains("${option}")`).parent().find(`input[value="${dropdown}"]`).click({force: true})
})

And('user selects {string} item from the media list',(title)=>{
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[name='name']").type(title)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-submit-cgov-media-browser']").click()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`td:contains(${title})`).parent().find('input').click()
})


/*---------- Scenario: Adding Internal Feature card ------ TEST Passes But Fails on CTHP Card Title ----*/


/*--------- Scenario: Adding External feature card ----- TEST Passes But Fails on CTHP Card Title ----*/
And('user selects {int} Video from the list of videos',(num)=>{
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-entity-browser-select-media36']").eq(num - 1).check()
})

And('user clicks on {string} button item list',(listBtn)=>{
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`input[value="${listBtn}"]`).click({force:true})
})

let imageSrc;
And('user remembers the title of selected video for further verification', () => {
    cy.get('details div').then($el => {
        imageSrc = $el[0].getAttribute('src')
    })
})

And('user selects {string} from {string} dropdown {string} section',(dropDown,option,section)=> {
cy.get(`div:contains("${section}")`).parent().parent().find(`.placeholder:contains("${option}")`).parent().find(`input[value="${dropDown}"]`).click({ force: true })
})

/*---------- Scenario: Adding video card -----------*/


/*---------- Scenario: Adding research card -----NEED attention on Main Page content ------*/
And('user filters research list by {string} type and clicks {string} button',(dropdown,btn)=>{
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("select[name='type']").select(dropdown)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`input[value="${btn}"]`).click({force:true})   
})

And('user selects {int} research page from the list',(num)=>{
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[name='entity_browser_select[node:1206]").eq(num - 1).check()  
})


/*---------- Scenario: Adding research card -----DONE ------*/
And('user types {string} in the autosuggest field of {string} card area',(value, option)=>{
    cy.get(`label:contains("${option}")`).parent().find("input[name*='field_cthp_cards[3][subform]']").type(value) 
})

And('user selects {int} result from the list of autosuggest',(num)=>{
    cy.get('#ui-id-3').eq(num-1).click({force:true})
})

And('user clicks on Source tool icon in the html content tool bar', () => {
    cy.get("span.cke_button_label.cke_button__source_label").eq(0).click({force:true})
})

And('user enters {string} into source text field', (value) => {
    cy.get("textarea[title='Rich Text Editor, HTML Content field']").type(value)
})

And('user selects {string} from draft {string} dropdown',(dropdown, option) =>{
    cy.get(`label:contains("${option}")`).parent().parent().find("select[name*='moderation_state']").select(dropdown)
})