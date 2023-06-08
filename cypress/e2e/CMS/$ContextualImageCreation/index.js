/// <reference types="Cypress" />
import { Given, And } from 'cypress-cucumber-preprocessor/steps';

const siteSection = Cypress.env('test_site_section');
const frontEndBaseUrl = Cypress.env('front_end_base_url');
const randomStr = Cypress.env('randomStr')

And('user types {string} into Caption text field', (captionText) => {
    cy.getIframeBody("iframe[title='Rich Text Editor, Caption field']").find('p').type(captionText);
})

And('user clicks on CROP IMAGE button', () => {
    cy.get(`span:contains('Crop image')`).click()
})

And('user sets the following crops', (dataTable) => {
    for (let { crop, locator } of dataTable.hashes()) {
        cy.get(locator).should('contain.text', crop).click();
        cy.wait(500);
        cy.get('div[class*="crop-preview-wrapper"][id="freeform"]').trigger("mouseover", { force: true }).find('span.cropper-face').click();

    }
});

And('user enters {string} as {int} body section heading', (value, position) => {
    cy.getNthIframe("iframe[title='Rich Text Editor, Heading field']", position - 1).find('p').type(value);
})

And('user clicks the {string} button {int} in the WYSIWYG editor', (infographicButton, position) => {
    cy.get('span.cke_button__cgov_image_button_icon').eq(position - 1).click({ force: true });
});

And('user enters {string} into media title search box and clicks {string}', (nameToSearch, applyBtn) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_embedded_image_browser').find(`input[id*="edit-name"]`).type(nameToSearch);
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_embedded_image_browser').find('input#edit-submit-cgov-image-media-browser').click({ force: true });
});

And('user selects {string} item from the media list', (title) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_embedded_image_browser').find(`input[name*="entity_browser_select"][type='checkbox']`).eq(0).check();
});

And('user clicks on {string} button to select media', (selectInfograhic) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_embedded_image_browser').find(`input[id='edit-submit'][value='${selectInfograhic}']`).click({ force: true });
});

And('{string} dropdown has the following options', (labelText, dataTable) => {
    cy.get(`label[class="js-form-required form-required"]:contains("${labelText}")`).should('be.visible');
    for (const { options } of dataTable.hashes()) {
        cy.get(`select[id*="edit-attributes-data-entity-embed-display"] option:contains("${options}")`).should('exist');
    }
});

And('user selects a checkbox next to title with url {string} from the list of content', (url) => {
    cy.get(`a[href='${siteSection}/${url}-${randomStr}']`).parent().parent().find('input.form-checkbox').check();
});

And('{string} dropdown defaults to {string}', (labelText, displayOption) => {
    cy.get(`select[id*="edit-attributes-data-entity-embed-display"] option:contains("${displayOption}")`).should('have.attr', 'selected', 'selected');
});

And('{string} label defaults to {string}', (labelTitle, option) => {
    cy.get(`label:contains("${option}")`).parent().find('input[checked="checked"]').should('be.visible');
})

And('{string} label has the following options', (labelText, dataTable) => {
    cy.get(`legend span:contains("${labelText}")`).should('be.visible');
    for (const { options } of dataTable.hashes()) {
        cy.get(`div.fieldset-wrapper label:contains("${options}")`).should('be.visible');
    }
});

And('user selects {string} alignment', (alignPosition) => {
    cy.get(`div.fieldset-wrapper input[value='${alignPosition}']`).click({ force: true });
});

And('user selects none alignment', () => {
    cy.get('div.fieldset-wrapper input[checked="checked"]').click({ force: true });
});

And('user clicks on {string} button to select image', (embedButton) => {
    cy.get(`div.ui-dialog-buttonset.form-actions button:contains("${embedButton}")`).click({ force: true });
});

And('user selects size {string}', (selectItem) => {
    cy.get(`label[class="js-form-required form-required"]:contains("Display as")`).should('be.visible');
    cy.get(`select[id*="edit-attributes-data-entity-embed-display"]`).select(selectItem);
});

And('user clicks on {string} to add a body section', (option) => {
    cy.get(`input[value='${option}']`).click();
    cy.get("div[data-drupal-selector='edit-field-article-body-1-top-paragraph-type-title']").should('exist');
});

And('user clicks {string} button for adding banner', (bannerBtn) => {
    cy.get(`input[id*="edit-field-hero-banner-add-more"]`).click({ force: true });
});

And('user enters {string} into {string} text field in home and landing page', (textTagLine, TagLineField) => {
    cy.get(`label[for*="subform-field-tagline-0-value"]:contains("${TagLineField}")`).should('be.visible');
    cy.get(`input[id*= "subform-field-tagline-0-value"]`).type(textTagLine);
});

Given('user is navigating to the CUSTOM front end site with path site section plus {string}', (purl) => {
    cy.visit(`${frontEndBaseUrl}${siteSection}/${purl}`, { retryOnStatusCodeFailure: true }, { failOnStatusCode: false });
});

And('the following images are displayed', (dataTable) => {
    for (let { size, alignment } of dataTable.hashes()) {
        var alignmentVar = 'align-' + alignment
        if (alignment == 'none') {
            alignmentVar = 'embedded-entity'
        }
        if (size != 'inline') {
            cy.get(`div[data-entity-embed-display="view_mode:media.image_display_article_${size}"]`).should('have.class', alignmentVar)
        }
        else {
            cy.get(`h2[id*="contextual-image-display-article-${size}${alignment}"]`).parent().find('img').should('be.visible')
        }
    }
});

And('user deletes {string} image', (imageTitle) => {
    cy.get(`a:contains('${imageTitle}')`).parent().parent().find('input.form-checkbox').check();
});

And('the image {string} does not exist in the list of content', (imageTitle) => {
    cy.get(`a:contains('${imageTitle}')`).should('not.exist');
});