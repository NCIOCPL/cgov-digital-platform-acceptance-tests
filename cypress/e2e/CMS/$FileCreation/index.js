/// <reference types="Cypress" />
import { And, Then } from 'cypress-cucumber-preprocessor/steps';

const siteSection = Cypress.env('test_site_section');

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

Then('Related Resources section contains the following links', (dataTable) => {
    for (let { title, link } of dataTable.hashes()) {
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace("{TEST_SITE_SECTION}", siteSection)
        }
        cy.get(`a[href="${link}-${randomNum}"]`).first().should('have.text', title);
    }
});

And('each file has a file type in the Related Resources section displayed as follows', (dataTable) => {
    for (let { link, fileType } of dataTable.hashes()) {
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace("{TEST_SITE_SECTION}", siteSection)
        }
        if (fileType === 'csv') {
            cy.get(`a[href="${link}-${randomNum}"]`).parent().find(".filetype").should('include.text', fileType)    
        }
        else {
            cy.get(`a[href="${link}-${randomNum}"]`).parent().find(".filetype").should('have.class', `filetype ${fileType}`)
        }
    }
})

And('user clicks on {string} button to link to a media', (link) => {
    cy.get(`tbody summary[role='button'] span:contains('${link}')`).eq(0).parent().click({ force: true });
});

And('user selects {string} item from the media list', (title) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_media_browser').find(`td:contains(${title})`).each(($el)=> {
        const text = $el[0].innerText;
        if(text === title) {
            cy.wrap($el).parent().find('input').click({ force: true });
        }
    })
});

Then('Selected Research pages list contains the following links', (dataTable) => {
    for (let { title, link } of dataTable.hashes()) {
        const replacedTestSiteSection = link.replace("{TEST_SITE_SECTION}", siteSection);
        cy.get(`.managed.list div a:contains("${title}")`).each(($el)=> {
            const text = $el[0].innerText;
            if(text === title) {
                cy.wrap($el).should('be.visible').and('have.attr', 'href', `${replacedTestSiteSection}-${randomNum}`)
            }
        })
    }
})

And('each file has a file type in the section displayed as follows', (dataTable) => {
    for (let { title, fileType } of dataTable.hashes()) {
        cy.get(`.managed.list div a:contains("${title}")`).each(($el)=> {
            const text = $el[0].innerText;
            if(text === title) {
                if (fileType === 'csv') {
                    cy.wrap($el).parent().find(".filetype").should('include.text', fileType)    
                }
                else {
                    cy.wrap($el).parent().find(".filetype").should('have.class', `filetype ${fileType}`)
                }
            }
        })
    }
})

And('each file has a size class', () => {
    cy.get(`.managed.list div a:contains("Test File")`).each(($el)=> {
        cy.wrap($el).parent().find(".filesize").should('include.text', 'B)')    
    })
})