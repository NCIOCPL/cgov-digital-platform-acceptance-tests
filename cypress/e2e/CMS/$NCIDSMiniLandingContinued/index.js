/// <reference types="Cypress" />

import { And, Then, When } from 'cypress-cucumber-preprocessor/steps';


import { getBaseDirectory } from '../../../utils';
const baseUrl = Cypress.config('baseUrl');
const randomStr = Cypress.env('randomStr')
const siteSection = Cypress.env('test_site_section');

And('user selects {string} from style dropdown', (option) => {
    cy.get('select[id="edit-field-mlp-page-style"]').select(option);
});


And('user selects {string} from {string} dropdown', (dropDown, cartOption) => {
    cy.get(`.placeholder:contains("${cartOption}")`).parent().find(`input[value="${dropDown}"]`).click({ force: true });
})

And('user clicks on {string} in {int} {string} section', (featItemLink, index, section) => {
    cy.get(`summary[aria-expanded="false"]:contains("${featItemLink}")`).click();
});


And('user clicks on Select content button item', () => {
    cy.get(`input[value="Select content"]`).trigger("click")
})

And('user clicks on {string} button for {string}', (edit, section) => {
    cy.get(`span.paragraph-type-label:contains('${section}')`).parent().parent().find(`input[value="${edit}"]`).click();
});

And('user enters {string} into {int} HTML Content', (htmlContent, index) => {
    cy.getNthIframe("iframe[title='Rich Text Editor, HTML Content field']", index - 1).find('p').type(htmlContent)
})

And('user selects {string} to add to column Right Content', (dropdown) => {
    cy.get(`input[value='${dropdown}']`).eq(0).click({ force: true })
})

And('user selects {string} to add to column Left Content', (dropdown) => {
    cy.get(`input[value='${dropdown}']`).eq(0).click({ force: true })
})
And('user fills out {string} text area with {string}', (textFieldLabel, value) => {
    cy.getIframeBody("iframe[title='Rich Text Editor, Body field']").find('p').type(value);
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

And('user selects {string} as {int} column Layout display', (value, index) => {
    cy.get('select[id*="field-two-column-layout-display').eq(index - 1).select(value)
})

And('user removes the following section', (dataTable) => {
    for (let { fieldLabel, field_name } of dataTable.hashes()) {
        cy.get(`input[name^='${field_name}']`).as('inputField').parent().parent().find('div[class*="paragraph-type-title"]').should('include.text', fieldLabel);
        cy.get('@inputField').click({ force: true });
        cy.get('input[value="Confirm removal"]').click({ force: true });
    }
})

And('user clicks on {string} button to link to a media', (link) => {
    cy.get(`summary[aria-controls^="edit-field-media-link"]`).click({ force: true });
});

And('user enters {string} into Raw HTML Content text field', (value) => {
    cy.get('textarea[id*="raw-html"]').type(value);
})

And('there are {int} two column layout sections', (num) => {
    cy.get("div[class*='cgdp-two-column-layout']").should('have.length', num)
})
And('the sections have the following', (dataTable) => {
    for (let { sectionIndex, splitRatio, columnIndex, type, link } of dataTable.hashes()) {
        cy.get("div[class*='cgdp-two-column-layout']>div").eq(sectionIndex).should('have.attr', 'data-eddl-landing-row-variant', `TwoColumn${splitRatio}`)
        cy.get("div[class*='cgdp-two-column-layout']").eq(sectionIndex).find('div[class*="cgdp-column"]')
            .eq(columnIndex).as('column')
        if (type !== 'rawHtml') {
            cy.get('@column').find(`div[class*='${type}']`).should('be.visible')
            if (link !== 'none') {
                cy.get('@column').find('a').should('have.attr', 'data-eddl-landing-item-link-type', link)
            }
        } else {
            cy.get('@column').find('div').should('have.text', link)
        }


    }
})

And('user clicks on {string} link', (href) => {
    cy.get("div[class*='cgdp-two-column-layout']").find(`a[href*='${href}']`).then(link$ => {
        link$.on('click', e => {
            e.preventDefault();
        });
    })
        .click({ followRedirect: false });
});

And('user uploads {string} as wide guide card image', (fileName) => {
    cy.fixture(fileName, { encoding: null }).as('fixture')
    cy.get('input[id*="edit-field-landing-contents-4-subform-field-image-guide-card-0-upload').eq(0).selectFile('@fixture');
});


And('user fills out WGC description field with {string}', (descr) => {
    cy.getIframeBody('iframe[title="Rich Text Editor, Description field"]').find('p').type(descr);
});

And('user selects {string} to add to WGC', (linkType) => {
    cy.get(`input[value='${linkType}']`).click({ force: true })
});

And('there are the following wide guide cards', (dataTable) => {
    for (let { index, title, description, numberOfLinks, source } of dataTable.hashes()) {
        cy.get(`div[class="nci-guide-card nci-guide-card--cgdp-wide"]`).eq(index).as('wideCard');
        cy.get('@wideCard').find('h2').should('have.text',title)
        cy.get('@wideCard').find('.nci-guide-card__description.usa-prose p').should('have.text',description)
        
        cy.get('@wideCard').find('li').should('have.length', numberOfLinks);

        if (baseUrl.includes('dev-acsf')) {
            source = source.replace('\\/sites\\/default', '\/sites\/g\/files\/xnrzdm\\d+dev')

        } else if (baseUrl.includes('test-acsf')) {
            source = source.replace('\\/sites\\/default', '\/sites\/g\/files\/xnrzdm\\d+test')
        }
        cy.get('@wideCard').should('have.attr', 'style').then(img => {
            const imgSrc = img.replace('background-image: url', '').replace(/\?.*/, '')
            expect(imgSrc).to.match(new RegExp(source))
        })
    }
});