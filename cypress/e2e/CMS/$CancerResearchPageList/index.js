/// <reference types="Cypress" />
import { And, Then, Given, When } from 'cypress-cucumber-preprocessor/steps';
import { extractImgName } from "../../../utils/extractImgName.js";

const siteSection = Cypress.env('test_site_section');
const frontEndBaseUrl = Cypress.env('front_end_base_url');
const randomStr = Cypress.env('randomStr')

And('user clicks on dropdown button toggle to view all Selected Research Pages types', () => {
    cy.get("li[class='dropbutton-toggle'] button[type='button']").click({ force: true })
})

let imageSrc
And('user selects {int} Promotional Image from the list of images', (num) => {
    cy.get('summary:contains("Promotional Image")').first().click()
    cy.get('input[name="field_image_promotional_entity_browser_entity_browser"]').click({ force: true })
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true })
})
And('user remembers the source of selected promo image for further verification', () => {
    cy.get('details img').then($el => {
        imageSrc = $el[0].getAttribute('src')
    })
})

And('user selects {string} checkbox', (visible) => {
    cy.get(`div#edit-field-date-display-mode label:contains("${visible}")`).parent().find('input.form-checkbox').check({ force: true })
})

And('description reads {string}', (title) => {
    cy.get(`p:contains('${title}')`).should('be.visible')
})

Then('Selected Research pages list contains the following links', (dataTable) => {
    for (let { title, link, description } of dataTable.hashes()) {
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace("{TEST_SITE_SECTION}", siteSection);
        }
        cy.get(`.managed.list div a:contains("${title}")`).should('be.visible').and('have.attr', 'href').then(href => {
            expect(href).to.include(link)
        })
        if (description !== 'N/A') {
            cy.get(`.managed.list div a:contains("${title}")`).parent().find('.description p').should('have.text', description)

        }
    }
})

And('list item number {int} has an exit Disclaimer displayed', (num) => {
    cy.get("a[title='Exit Disclaimer']").should('be.visible', num - 1)
})

And('list item number {int} has pdf icon displayed', (num) => {
    cy.get('.filetype.txt').should('be.visible', num - 1)
})

And('user enters {string} into {int} {string} text field', (value, num, fieldLabel) => {
    cy.get(`div[class*="form-type-textarea"] label:contains("${fieldLabel}")`).eq(num - 1).parent().find('div>textarea').type(value)
})

Then('the promo image is matching the earlier selected image', () => {
    const expectedSrc = (imageSrc.replace(/\?itok=[\S]+/, '')).replace(/^(.*?)\/public/, '');
    const extractedImageName = extractImgName(expectedSrc).replace(/\.jpg|\.jpeg|\.png/, '')

    cy.get('div.feature-card').find('img').then($el => {
        const source = $el[0].getAttribute('src');
        const actSrc = source.replace(/\?itok=[\S]+/, '').replace(/^(.*?)\/public/, '')
        expect(actSrc).to.include(extractedImageName.replaceAll('_', '-').replace('article', ''))
    })
});
/* ----- Translation of Cancer Research Page List -----*/
And('body was translated as {string}', (bodyTranslated) => {
    cy.get(`label[for*="edit-body"]`).should('have.text',bodyTranslated)
})

And('Remove button for media was translated as {string}', (RemoveBtn) => {
    cy.get(`input[value="${RemoveBtn}"]`).should('be.visible')
})

And('Link section under related resources was translated as {string}', (linkTranslated) => {
    cy.get(`summary[class*='summary']:contains("${linkTranslated}")`).should('be.visible')
})

And('user clicks on title with url spanish path {string} site section plus {string}', (spPath, purl) => {
    cy.get(`a[href='${spPath}${siteSection}/${purl}-${randomStr}']`).click();
})

And('user clicks on Edit button for {string}',(section)=>{
    cy.get(`span.paragraph-type-label:contains('${section}')`).parent().parent().find('input[value="Edit"]').click();
    });