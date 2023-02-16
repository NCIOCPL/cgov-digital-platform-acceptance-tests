/// <reference types="Cypress" />
import { And, Then, Given, When } from 'cypress-cucumber-preprocessor/steps';
import { extractImgName } from "../../../utils/extractImgName.js";
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

Given('user is navigating to the front end site with the path site section plus {string}', (purl) => {
    cy.visit(`${frontEndBaseUrl}${siteSection}/${purl}`, { retryOnStatusCodeFailure: true });
});

And('the content item with url {string} does not exist in the list of content', (url) => {
    cy.get(`a[href='${siteSection}/${url}-${randomNum}']`).should('not.exist');
});

And('user clicks on dropdown button toggle to view all Selected Research Pages types', () => {
    cy.get("li[class='dropbutton-toggle'] button[type='button']").click({ force: true })
})

let imageSrc
And('user selects {int} Promotional Image from the list of images', (num) => {
    cy.get('span:contains("Promotional Image")').parent().first().as('imageUpload').click()
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
    cy.get(`[class='fieldset-wrapper'] label:contains("${visible}")`).parent().find('input.form-checkbox').check({ force: true })
})

And('description reads {string}', (title) => {
    cy.get(`p:contains('${title}')`).should('be.visible')
})

Then('Selected Research pages list contains the following links', (dataTable) => {
    for (let { title, link, description } of dataTable.hashes()) {
        const replacedTestSiteSection = link.replace("{TEST_SITE_SECTION}", siteSection);
        cy.get(`.managed.list div a:contains("${title}")`).should('be.visible').and('have.attr', 'href', replacedTestSiteSection)
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