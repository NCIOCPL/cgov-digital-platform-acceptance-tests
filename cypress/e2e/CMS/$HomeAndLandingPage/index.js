// <reference types="Cypress" />
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
    for (const { fieldLabel, value, field_name } of dataTable.hashes()) {
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

And('user selects {string} from {string} dropdown', (dropDown, cartOption) => {
    cy.get(`.placeholder:contains("${cartOption}")`).parent().find(`input[value="${dropDown}"]`).click({ force: true })
})

And('user clicks on {string} link in the {string} text area', (title, cartOption) => {
    cy.get(`div.paragraph-type-title:contains('${cartOption}')`).parent().parent().find(`span:contains('${title}')`).parent().click()
})

And('user clicks on {string} link in the {string} text area within {string} section', (title, cartOption, multimediaRow) => {
    cy.get(`div:contains("${multimediaRow}")`).parent().parent().find(`div:contains("${cartOption}")`).parent().find(`span:contains('${title}')`).eq(0).click({ force: true })
})

And('user clicks on {string} link in the {string} text area within {string} section for {string}',(link, textArea, subSection, section)=>{
    cy.get(`div[class*="paragraph-type-title"]:contains("${section}")`).parent().parent().find(`div:contains("${subSection}")`).parent().parent().find(`div:contains("${textArea}")`).parent().find(`span:contains('${link}')`).eq(0).click({ force: true })
    })

And('user clicks on {string} link in the {string} text area within {string} section for {string}', (title, cartOption, subSection, section) => {
    cy.get(`div:contains("${subSection}")`).parent().parent().find(`div:contains("${cartOption}")`).parent().find(`span:contains('${title}')`).eq(0).click({ force: true })
})

And('user selects {string} from {string} dropdown {string} section for {string}',(dropDValue,dropdownLbl,subSection, section)=>{
    cy.get(`div[class*="paragraph-type-title"]:contains("${section}")`).parent().parent().find(`div:contains("${subSection}")`).parent().parent().find(`.placeholder:contains("${dropdownLbl}")`).parent().find(`input[value="${dropDValue}"]`).eq(0).click({ force: true })
    })

And('user clicks on {string} button item', (content) => {
    cy.get(`input[value='${content}']`).eq(0).click({ force: true })
})

And('user selects {string} from {string} dropdown {string} section', (dropDown, option, section) => {
    cy.get(`div:contains("${section}")`).parent().parent().find(`.placeholder:contains("${option}")`).parent().find(`input[value="${dropDown}"]`).eq(0).click({ force: true })
})

And('user enters {string} into Raw HTML Content text field under Primary Feature Card Row', (value) => {
    cy.get("textarea[id^=edit-field-landing-contents-0-subform-field-row-cards-2-subform-field-raw-html-0-value").type(value)
})

And('user clicks on Source tool icon in the html content tool bar', () => {
    cy.get("span.cke_button_label.cke_button__source_label").click()
})

And('user enters {string} into source text field', (value) => {
    cy.get("textarea[title='Rich Text Editor, HTML Content field']").type(value)
})

And('user enters {string} into Raw HTML Content text field under Guide Card Row', (value) => {
    cy.get("textarea[id^=edit-field-landing-contents-1-subform-field-guide-cards-1-subform-field-raw-html").type(value)
})

And('user clicks on {string} link in the List Items text area under List', (linkBtn) => {
    cy.get(`tbody summary[role='button'] span:contains('${linkBtn}')`).parent().click({ force: true });
})

And('user clicks on {string} button in the Multimedia row text area', (multimediaBtn) => {
    cy.get(`span:contains("${multimediaBtn}")`).click({ force: true })
})

And('user clicks on {string} to choose a media to link', (mediaBtn) => {
    cy.get(`tbody input[value="${mediaBtn}"]`).click({ force: true })
})
And('user filters results by Type {string}', (option) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("select[name='bundle']").select(option)
})

And('user filters results by {string} {string}', (title, option) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').parent().find(`label:contains("${title}")`).parent().find("select[name='status']").select(option)
})

And('user selects {int} item from the media list', (num) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input.form-checkbox").eq(num - 1).check()
})

And('user remembers the name of media card item for future verification', () => {
    cy.get('details img').then($el => {
        imageSrc1 = $el[0].getAttribute('src')
    })
})

And('user selects {string} item from the media list', (title) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[name='name']").type(title)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-submit-cgov-media-browser']").click()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`td:contains(${title})`).parent().find('input').click();
})

And('user clicks on {string} item button', (mediaBtn) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`input[value="${mediaBtn}"]`).click({ force: true })
})

And('user selects {string} from List Item Style dropdown under list', (option) => {
    cy.get("select[name*='field_list_item_style']").eq(0).select(option)
})

And('user selects {string} from List Item Style dropdown under one column container', (listItem) => {
    cy.get("select[name*='field_list_item_style']").eq(1).select(listItem)
})

And('user selects {string} from main contents dropdown', (dropdown) => {
    cy.get(`tbody input[value="${dropdown}"]`).click({ force: true })
})

And('user clicks on {string} option to {string} within {string} section', (option, containerContents, section) => {
    cy.get(`div[id*="top-paragraph-type-title"]:contains("${section}")`).parent().parent().find(`.placeholder:contains("${containerContents}")`).parent().find(`input[value="${option}"]`).click({ force: true })
})

And('user fills out HTML Content text area with', (value) => {
    cy.getNthIframe("iframe[title='Rich Text Editor, HTML Content field']", 1).find('p').type(value)
})

And('user enters {string} in Raw HTML Content under {string}', (value, section) => {
    cy.get(`div[class*="paragraph-type-title"]:contains("${section}")`).parent().parent().find('textarea[name*="field_raw_html"]').eq(0).type(value);
})

And('user fills out HTML Content text area with {string} under {string}', (value, section) => {

    cy.get(`div[class*="paragraph-type-title"]:contains("${section}")`).parent().parent().find('iframe[title="Rich Text Editor, HTML Content field"]').its('0.contentDocument.body').should('not.be.empty').then(iframe => {
        cy.wrap(iframe).find('p').type(value);
    })

})


And('user selects {string} from Source View dropdown', (sourceDropdown) => {
    cy.get("select[name*='[field_source_view][0][target_id]']").select(sourceDropdown)
})

And('user selects {string} from Display dropdown', (dropdown) => {
    cy.get("select[name*='[display_id]").select(dropdown)
})

And('user clicks {string} link in the Dynamic List area', (linkBtn) => {
    cy.get(`tbody summary[role='button'] span:contains('${linkBtn}')`).click({ force: true })
})

And('user checks Include View Title checkbox', () => {
    cy.get("input[name*='[field_source_view][0][options][title]").check()
})

And('user enters {string} into Items per page dropdown', (value) => {
    cy.get("input[name*='[field_source_view][0][options][limit]").type(value)
})

And('user selects {string} from Pagination dropdown', (option) => {
    cy.get("select[name*='[field_source_view][0][options][pager]").select(option)
})

And('user selects {string} from Card Theme dropdown', (Accent) => {
    cy.get("select[name*='[subform][field_card_theme]']").select(Accent)
})

And('user selects {string} from Image Position dropdown', (dropdown) => {
    cy.get("select[name*='[field_image_position]']").select(dropdown)
})

let imageSrc1;
And('user selects {int} Promotional Image from the list of images', (num) => {
    cy.get('span:contains("Promotional Image")').parent().first().as('imageUpload').click()
    cy.get('input[name="field_landing_contents_7_subform_field_override_image_promotional_entity_browser_entity_browser"]').click({ force: true })
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true })
})

And('user remembers the source of selected promo image for further verification', () => {
    cy.get('details img').then($el => {
        imageSrc1 = $el[0].getAttribute('src')
    })
})

And('user selects {string} from Button Display dropdown', (dropdown) => {
    cy.get("select[name*='[subform][field_button_display]']").select(dropdown)
})

And('user selects {string} checkbox', (optionsVisible) => {
    cy.get(`[class='fieldset-wrapper'] label:contains("${optionsVisible}")`).parent().find('input.form-checkbox').check({ force: true })
})

And('user selects {string} from Search Engine Restrictions dropdown', (option) => {
    cy.get("select[name='field_search_engine_restrictions']").select(option)
})

And('user selects {string} from Save as dropdown', (dropdown) => {
    cy.get("select[name='moderation_state[0][state]").select(dropdown)
})

And('user fills out the following fields under {string} section', (option, dataTable) => {
    for (const { fieldLabel, value, field_name } of dataTable.hashes()) {
        cy.get(`div:contains("${option}")`).should('be.visible')
        cy.get(`input[name^='${field_name}']`).as('inputField').parent().find('label').should('include.text', fieldLabel);
        cy.get('@inputField').type(value);

    }
});
And('user clicks on {string} button item in the {string} text area',(selectContentBtn,section)=>{
    cy.get(`div[id*="top-paragraph-type-title"]:contains("${section}")`).parent().parent().find(`input[value="${selectContentBtn}"]`).click()
})