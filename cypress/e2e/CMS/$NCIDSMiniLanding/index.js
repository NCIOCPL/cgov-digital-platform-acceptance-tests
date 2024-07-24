/// <reference types="Cypress" />

import { And, Then, When } from 'cypress-cucumber-preprocessor/steps';


import { getBaseDirectory } from '../../../utils';
const baseUrl = Cypress.config('baseUrl');
const randomStr = Cypress.env('randomStr')
const siteSection = Cypress.env('test_site_section');

And('user selects {string} from style dropdown', (option) => {
    cy.get('select[id="edit-field-mlp-page-style"]').select(option);
});

And('user uploads slim hero {string}', (fileName) => {
    cy.fixture(fileName, { encoding: null }).as('fixture')
    cy.get('input[id*="field-slim-hero-image"]').first().selectFile('@fixture');
    cy.wait(2000);
});

And('user clicks on Source tool icon in the html content tool bar', () => {
    cy.get("span.cke_button_label.cke_button__source_label").click({ force: true })
    cy.wait(2000)
})

And('user enters {string} into source text field', (value) => {
    cy.get("textarea[title='Rich Text Editor, HTML Content field']").type(value)
})
And('NCIDS Slim Hero is displayed with alt text {string}', (altText) => {
    cy.get("div[class='usa-section cgdp-slim-hero']").as('slimHero').should('be.visible');
    cy.get('@slimHero').find('img').should('have.attr', 'alt', altText)
})

And('content block has a title {string}', (title) => {
    cy.get('div.usa-prose.cgdp-landing-content-block h2').should('be.visible').and('have.text', title)
})
And('content block has the following links', (dataTable) => {
    for (const { title, href } of dataTable.hashes()) {
        cy.get('div.usa-prose.cgdp-landing-content-block').find(`a[href='${href}']`).should('have.text', title)

    }
});
 And('user removes page title block', ()=>{
    cy.get('[id*="edit-field-landing-contents-1-top-paragraph-type-title"]').parent().find('input[value="Remove"]').click();
    cy.get('input[value="Confirm removal"]').click()
 })

 And('page title does not exist',()=>{
cy.get('h1').should('not.exist')
 })

// And('user clicks on {string} from {string} area', (button, area) => {

//     cy.get(`em.placeholder:contains("${area}")`).parent().find("button.dropbutton__toggle").click();
//     cy.get(`em.placeholder:contains("${area}")`).parent().find(`input[value="${button}"]`).click();
// })

And('user selects {string} from {string} dropdown', (dropDown, cartOption) => {
    cy.get(`.placeholder:contains("${cartOption}")`).parent().find(`input[value="${dropDown}"]`).click({ force: true });
})

And('user clicks on {string} in {int} {string} section', (featItemLink, index, section) => {
    cy.get(`summary[aria-expanded="false"]:contains("${featItemLink}")`).click();
});

And('user selects {string} as promo image for {int} feature card', (name, index) => {
    cy.get(`summary[aria-controls*="edit-field-override-image-promotional"]`).eq(index - 1).click();
    cy.wait(500);
    cy.get('input[name*="override_image_promotional_entity_browser"]').eq(index - 1).click()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find('input#edit-name').type(name)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find('input[id*="edit-submit-cgov-image-media-browser"]').click()
    cy.wait(1500)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input.form-checkbox").eq(0).click()
    cy.wait(1500)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click()
})

And('NCIDS feature cards have the following attributes', (dataTable) => {

    for (let { index, title, description, link, source, file } of dataTable.hashes()) {
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace("{TEST_SITE_SECTION}", siteSection)
        }
        if (baseUrl.includes('cms-dev') || baseUrl.includes('cms-test')) {
            source = source.replace('/sites/default', '/sites/g/files/xnrzdm\\d+')

        }
        cy.get('.nci-card__body').eq(index).as('featureCard');

        cy.get('@featureCard').find('.nci-card__title').invoke('text').then((text) => {
            expect(text.trim()).equal(title);
        });

        if (description === 'N/A') {
            cy.get('@featureCard').find('p').should('not.exist');
        }
        else {
            cy.get('@featureCard').find('p').invoke('text').then((text) => {
                expect(text.trim()).equal(description);
            });
        }

        cy.get('@featureCard').parent().invoke('attr', 'href').then(href => {
            if (href.startsWith('http')) {
                expect(href).to.eq(link)
            } else {
                expect(href).to.eq(`${getBaseDirectory()}${link}-${randomStr}`)
            }
        })

        cy.get('@featureCard').parent().find('img').invoke('attr', 'src').then((fullSrc) => {

            if (baseUrl.includes('cms-dev') || baseUrl.includes('cms-test')) {
                fullSrc = fullSrc.replace(/xnrzdm\d+/g, 'xnrzdm\\d+')
            }
            expect(fullSrc.includes(`${source}`)).to.be.true;

            const src1 = fullSrc.substring(0, fullSrc.indexOf('?'));
            if (file.includes('placeholder')) {
                expect(src1).to.match(new RegExp(`.*\/${file}`))
            } else {
                expect(src1).to.match(new RegExp(`.*\\d{4}-\\d{2}\/${file}`))
            }
        });
    }
});

And('user clicks on Select content button item', () => {
    cy.get(`input[value="Select content"]`).trigger("click")
})

And('user clicks on {string} button for {string}', (edit, section) => {
    cy.get(`span.paragraph-type-label:contains('${section}')`).parent().parent().find(`input[value="${edit}"]`).click();
});

