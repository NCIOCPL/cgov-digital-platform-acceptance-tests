/// <reference types="Cypress" />
import { And, Then } from 'cypress-cucumber-preprocessor/steps';
import { enrichUrl } from "../../../utils/enrichUrl";

const siteSection = Cypress.env('test_site_section');
const frontEndBaseUrl = Cypress.env('front_end_base_url');
const randomStr = Cypress.env('randomStr')

Then('Related Resources section contains the following links', (dataTable) => {
    for (let { title, link } of dataTable.hashes()) {
        link = enrichUrl(link, siteSection, randomStr)
        cy.get(`a[href="${link}"]`).first().should('have.text', title);
    }
});

And('each file has a file type in the Related Resources section displayed as follows', (dataTable) => {
    for (let { link, fileType } of dataTable.hashes()) {
        const replacedTestSiteSection = enrichUrl(link, siteSection, randomStr)
        if (fileType === 'csv') {
            cy.get(`a[href="${replacedTestSiteSection}"]`).parent().find(".filetype").should('include.text', fileType)
        }
        else {
            cy.get(`a[href="${replacedTestSiteSection}"]`).parent().find(".filetype").should('have.class', `filetype ${fileType}`)
        }
    }
})

And('user clicks on {string} button to link to a media', (link) => {
    cy.get(`tbody summary[role='button'] span:contains('${link}')`).eq(0).parent().click({ force: true });
});

And('user selects {string} item from the media list', (title) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_media_browser').find(`td:contains(${title})`).each(($el) => {
        const text = $el[0].innerText;
        if (text === title) {
            cy.wrap($el).parent().find('input').click({ force: true });
        }
    })
});

Then('Selected Research pages list contains the following links', (dataTable) => {
    for (let { title, link } of dataTable.hashes()) {
       link = link.replace("{TEST_SITE_SECTION}", siteSection);
        cy.get(`.managed.list div a:contains("${title}")`).each(($el) => {
            const text = $el[0].innerText;
            if (text === title) {
                cy.wrap($el).should('be.visible').and('have.attr', 'href').then(href=>{
                    expect(href).to.include(link)  
                })
            }
        })
    }
})

And('each file has a file type in the section displayed as follows', (dataTable) => {
    for (let { title, fileType } of dataTable.hashes()) {
        cy.get(`.managed.list div a:contains("${title}")`).each(($el) => {
            const text = $el[0].innerText;
            if (text === title) {
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
    cy.get(`.managed.list div a:contains("Test File")`).each(($el) => {
        cy.wrap($el).parent().find(".filesize").should('include.text', 'B)')
    })
})