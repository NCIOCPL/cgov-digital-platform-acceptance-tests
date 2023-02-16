/// <reference types="Cypress" />
import { should } from 'chai';
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

let imageSrc;
And('user selects {int} Promotional Image from the list of images', (num) => {
    cy.get('span:contains("Promotional Image")').parent().as('imageUpload').click()
    cy.get('input[name="field_image_promotional_entity_browser_entity_browser"]').click({ force: true })
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true })
});
And('user remembers the source of selected promo image for further verification', () => {
    cy.get('details img').then($el => {
        imageSrc = $el[0].getAttribute('src')
    })
})

And('user selects {string} content item', (dropDown) => {
    cy.get(`input[value='${dropDown}']`).click({ force: true })
})

And('user enters {string} into Content Heading text field', (value) => {
    cy.get("input[name^='field_landing_contents[0][subform][field_content_heading]']").type(value)
})

And('user selects {string} checkbox', (visible) => {
    cy.get(`[class='fieldset-wrapper']:contains("${visible}")`).parent().find('input.form-checkbox').check({ force: true })
})

And('user clicks on {string} link in the {string} text area', (title, cartOption) => {
    cy.get(`div.paragraph-type-title:contains('${cartOption}')`).parent().parent().find(`span:contains('${title}')`).parent().click()
})

And('user clicks on {string} button to select item', (title) => {
    cy.getIframeBody('iframe[name="entity_browser_iframe_cgov_content_browser"]').find(`input[value="${title}"]`).click({ force: true })
})

And('user clicks on {string} link in the Internal Link text area within List Items', (linkBtn) => {
    cy.get(`tbody summary[role='button'] span:contains('${linkBtn}')`).parent().click({ force: true });
})

And('user selects {string} from item list dropdown', (dropdown) => {
    cy.get(`input[value='${dropdown}']`).click({ force: true })
})

And('Button Display dropdown has default value {string}', (title) => {
    cy.get(`select[class='form-select required']:contains('${title}')`)
})

And('user enters {string}', (value) => {
    cy.get("textarea[name*='field_raw_html']").type(value)
})

And('user clicks {string} link in the Dynamic List area', (linkBtn) => {
    cy.get(`tbody summary[role='button'] span:contains('${linkBtn}')`).click({ force: true })
})

And('user clicks on {string} button item', (title) => {
    cy.get(`input[value="${title}"]`).click({ force: true })
})

And('user selects {string} item from the media list', (title) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[name='name']").type(title)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-submit-cgov-media-browser']").click()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`td:contains(${title})`).parent().find('input').click();
})

And('user clicks on {string} button to select media file', (selectBtn) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`input[value='${selectBtn}']`).click({ force: true })
})

And('user selects {string} from Card Theme dropdown', (CardOption) => {
    cy.get("select[name='field_landing_contents[3][subform][field_card_theme]']").select(CardOption)
})

And('user selects {string} from Image Position dropdown', (imageOption) => {
    cy.get("select[name='field_landing_contents[3][subform][field_image_position]']").select(imageOption)
})

And('user selects {string} from Source View dropdown', (sourceOption) => {
    cy.get("select[name='field_landing_contents[5][subform][field_source_view][0][target_id]']").select(sourceOption)
    cy.wait(3000)
})

And('user selects {string} from Button Display dropdown', (displayOption) => {
    cy.get("select[name='field_landing_contents[3][subform][field_button_display]").select(displayOption)
})

And('user checks Include View Title checkbox', () => {
    cy.get("input[id^='edit-field-landing-contents-5-subform-field-source-view-0-options-title']").check()
})

And('user enters {string} into Items per page dropdown', (value) => {
    cy.get("input[id^='edit-field-landing-contents-5-subform-field-source-view-0-options-limit']").type(value)
})

And('Pagination dropdown has default value {string}', (title) => {
    cy.get(`select[id^='edit-field-landing-contents-5-subform-field-source-view-0-options-pager']:contains('${title}')`)
})
And('user selects {string} from Save as dropdown', (title) => {
    cy.get("select[name='moderation_state[0][state]']").select(title)
})

And('user selects {string} item from main page content', (title) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`td:contains("${title}")`).parent().find('input').check();
})

And('user selects {string} from Display dropdown', (dropdown) => {
    cy.get("select[name='field_landing_contents[5][subform][field_source_view][0][display_id]']").select(dropdown)
})

And('user clicks on {string} button to link to a media', (link) => {
    cy.get(`summary[aria-controls^="edit-field-media-link"]`).click({ force: true });
});

And('Content Heading reads {string}', (title) => {
    cy.get(`main[id='main-content']:contains('${title}')`)
})

And('HTML Content reads {string}', (htmlContent) => {
    cy.get(`p:contains('${htmlContent}')`).should('be.visible')
})

And('feature card row displays the following cards', (dataTable) => {
    for (let { title, url, description } of dataTable.hashes()) {
        const siteSection = Cypress.env("test_site_section");
        const replacedTestSiteSection = url.replace("{TEST_SITE_SECTION}", siteSection);
        cy.get(`div.feature-card h3:contains('${title}')`).should('be.visible')
        if (description !== 'N/A') {
            cy.get(`div.feature-card p:contains('${description}')`).should('be.visible')
        }
        cy.get(`div.feature-card a[href="${replacedTestSiteSection}"]`).should('be.visible')
    }
})

And('managed list has the following links', (dataTable) => {
    for (let { title, url, description } of dataTable.hashes()) {

        const replacedTestSiteSection = url.replace("{TEST_SITE_SECTION}", siteSection);
        cy.get(`div.managed.list h3:contains('${title}')`).should('be.visible')
        if (description !== 'N/A') {
            cy.get(`div.managed.list p:contains('${description}')`).should('be.visible')
        }
        cy.get(`div.managed.list a[href="${replacedTestSiteSection}"]`).should('be.visible')
    }
})

And('borderless card with {string} accent displays the following', (accent, dataTable) => {
    cy.get(`div.${accent} .borderless-card`).should('be.visible')
    for (let { title, link } of dataTable.hashes()) {
        const replacedTestSiteSection = link.replace("{TEST_SITE_SECTION}", siteSection);
        cy.get(`div.${accent} .borderless-card h2:contains('${title}')`).should('be.visible')
        cy.get(`div.${accent} .borderless-card a[href="${replacedTestSiteSection}"]`).should('be.visible')
    }
})

And('List Item Title is displayed as {string}', (title) => {
    cy.get(`h2:contains('${title}')`).should('be.visible')
})

And('the button with text {string} appears with href {string}', (linkText, href) => {
    const replacedTestSiteSection = href.replace("{TEST_SITE_SECTION}", siteSection);
    cy.get('a.borderless-button').should('have.text', linkText)
    cy.get('a.borderless-button').should('have.attr', 'href', replacedTestSiteSection)
})

And('the Raw HTML Content reads the following {string}', (htmlContent) => {
    cy.get(`p:contains('${htmlContent}')`).should('be.visible')
})

And('{int} links are displayed under the Dynamic List Title', (num) => {
    cy.get('.dynamic.list a.title').should('have.length', num)
})

And('the Dynamic List Title reads as {string}', (title) => {
    cy.get('.dynamic.list h2').should('have.text', title)
})

And('view title displays text {string}', (title) => {
    cy.get("div[class='viewsreference--view-title']").should('be.visible').and('include.text', title)
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