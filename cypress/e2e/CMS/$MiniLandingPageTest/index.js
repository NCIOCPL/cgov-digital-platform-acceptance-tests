/// <reference types="Cypress" />
import { And, Then, Given, When } from 'cypress-cucumber-preprocessor/steps';


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
    cy.get('#edit-field-list-description-0-value').type(value)
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

And('user selects {string} from Display dropdown',(dropdown) => {
    cy.get("select[name='field_landing_contents[5][subform][field_source_view][0][display_id]']").select(dropdown)
})

And('user clicks on {string} button to link to a media', (link) => {
    cy.get(`summary[aria-controls^="edit-field-media-link"]`).click({ force: true });
});
