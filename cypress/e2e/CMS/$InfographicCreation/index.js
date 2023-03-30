/// <reference types="Cypress" />
import { And, When } from 'cypress-cucumber-preprocessor/steps';
import { extractImgName } from "../../../utils/extractImgName.js";


const siteSection = Cypress.env('test_site_section');
const randomStr = Cypress.env('randomStr');

And('user fills out the following fields', (dataTable) => {
    for (let { fieldLabel, value, field_name } of dataTable.hashes()) {
        if (fieldLabel === 'Pretty URL') {
            value = `${value}-${randomStr}`;
        }
        cy.get(`input[name^='${field_name}']`).as('inputField').parent().find('label').should('include.text', fieldLabel);
        cy.get('@inputField').type(value);
    }
});

And('user types {string} into Caption text field', (value) => {
    cy.getNthIframe("iframe[class='cke_wysiwyg_frame cke_reset']", 1).find('p').type(value);
});

And('user uploads test file {string}', (fileName) => {
    cy.fixture(fileName, { encoding: null }).as('fixture')
    cy.get('input[type="file"]').first().selectFile('@fixture');
});

And('user enters {string} into the {string} text field', (value, textFieldLabel) => {
    cy.get(`[class*='form-item-field-infographic-0-alt']:contains("${textFieldLabel}")`).find('input.form-text').type(value);
});

let imageSrc1;
And('user selects {int} Promotional Image from the list of images to be displayed in home and landing pages', (num) => {
    cy.get('span:contains("Promotional Image")').parent().first().click()
    cy.get('input[name="field_image_promotional_entity_browser_entity_browser"]').click()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click()
});

And('user remembers the source of selected promotional image to be displayed in home and landing pages for further verification', () => {
    cy.get('div[id*="edit-field-image-promotional"] img').then($el => {
        imageSrc1 = $el[0].getAttribute('src');
    });
});

And('user selects {string} checkbox', (dateDisplay) => {
    cy.get(`[class='fieldset-wrapper'] label:contains("${dateDisplay}")`).parent().find('input.form-checkbox').check({ force: true });
});

And('the radio button {string} is selected by default under {string}', (btnType, field) => {
    cy.get(`div[id*="edit-attributes-data-align"]`).first().find(`input[id*="edit-attributes-data-align"]`).should('be.checked');
});

And('user removes the {string} item from the list', (link) => {
    cy.get(`input[id*="edit-field-landing-contents-1-subform-field-list-items-0-top-links-remove-button"]`).click({ force: true });
});

And('description reads {string}', (contentText) => {
    cy.get(`p:contains('${contentText}')`).should('be.visible');
});

And('the image has the name {string}', (imageName) => {
    cy.get('div.centered-element source[media="(min-width: 769px)"]').should('have.attr', 'srcset').and('include', imageName);
});

And('the caption appears as {string}', (captionText) => {
    cy.get(`div.caption-container.no-resize`).find(`p:contains("${captionText}")`);
});

And('the infographic link {string} appears with href {string}', (linkText, linkHref) => {
    cy.get(`div.infographic-link-container:contains("${linkText}")`).find(`a[href*='${linkHref}']`).should('be.visible');
});

And(`{string} date is displaying today's date`, (dateToday) => {
    const months = [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December'
    ];
    const date = new Date();
    const year = date.getFullYear();
    const month = months[date.getMonth()];
    const day = date.getDate();
    const expectedDate = `${month} ${day}, ${year}`;
    cy.get('div.document-dates li').as('dateStamp').find('strong').should('have.text', dateToday);
    cy.get('@dateStamp').find('time').should('include.text', expectedDate);
});

And('the infographic link {string} does not appear', (linkText) => {
    cy.get(`div.infographic-link-container:contains("${linkText}")`).find('a.infographic-link').should('not.be.visible');
});

And('the image has name {string}', (imageName) => {
    cy.get('div.centered-element source[media="(max-width: 768px)"]').should('have.attr', 'srcset').and('include', imageName);
});

And('user enters {string} as intro text', (introTxt) => {
    cy.getIframeBody("iframe[title='Rich Text Editor, Intro Text field']").find('p').type(introTxt);
});

And('user enters {string} as {int} body section heading', (value, position) => {
    cy.getNthIframe("iframe[title='Rich Text Editor, Heading field']", position - 1).find('p').type(value);
})

And('user fills out {int} {string} text area with {string}', (position, sectionName, value) => {
    cy.getNthIframe("iframe[title='Rich Text Editor, Content field']", position - 1).find('p').type(value);
});

And('user clicks the {string} button {int} in the WYSIWYG editor', (infographicButton, position) => {
    cy.get('span.cke_button__cgov_infographic_button_icon').eq(position - 1).click({ force: true });
});

And('user enters {string} into media title search box and clicks {string}', (nameToSearch, applyBtn) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_embedded_infographic_browser').find(`input[id*="edit-name"]`).type(nameToSearch);
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_embedded_infographic_browser').find(`input[id*="edit-submit-cgov-infographic-media-browser"][value=${applyBtn}]`).click({ force: true });
});

And('user selects {string} item from the media list', (title) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_embedded_infographic_browser').find(`input[name*="entity_browser_select"][type='checkbox']`).eq(0).check();
});

And('user clicks on {string} button to select media', (selectInfograhic) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_embedded_infographic_browser').find(`input[id='edit-submit'][value='${selectInfograhic}']`).click({ force: true });
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

And('{string} dropdown displays {string}', (labelText, displayOption) => {
    cy.get(`select[id*="edit-attributes-data-entity-embed-display"] option:contains("${displayOption}")`).should('have.attr', 'selected', 'selected');
});

And('{string} label has the following options', (labelText, dataTable) => {
    cy.get(`legend span:contains("${labelText}")`).should('be.visible');
    for (const { options } of dataTable.hashes()) {
        cy.get(`div.fieldset-wrapper label:contains("${options}")`).should('be.visible');
    }
});

And('user selects {string} radio button under {string}', (alignPosition, labelText) => {
    cy.get(`div.fieldset-wrapper input[value='${alignPosition}']`).click({ force: true });
});

And('user clicks on {string} button to select infographic', (embedButton) => {
    cy.get(`div.ui-dialog-buttonset.form-actions button:contains("${embedButton}")`).click({ force: true });
});

And('user select {string} from the {string} dropdown', (selectItem, labelText) => {
    cy.get(`label[class="js-form-required form-required"]:contains("${labelText}")`).should('be.visible');
    cy.get(`select[id*="edit-attributes-data-entity-embed-display"]`).select(selectItem);
});

And('user clicks on {string} to add a body section', (option) => {
    cy.get(`input[value='${option}']`).click();
    cy.get("div[data-drupal-selector='edit-field-article-body-1-top-paragraph-type-title']").should('exist');
});

And('user selects {string} from {string} dropdown in home and landing page', (dropDown, cardOption) => {
    cy.get(`.placeholder:contains("${cardOption}")`).parent().find(`input[value="${dropDown}"]`).click({ force: true });
});

And('user clicks on {string} link in the {string} text area in home and landing page', (title, cardOption) => {
    cy.get(`div.paragraph-type-title:contains('${cardOption}')`).parent().parent().find(`span:contains('${title}')`).parent().click({ force: true });
});

And('user clicks on {string} button item', (content) => {
    cy.get(`input[value='${content}']`).eq(0).click({ force: true });
});


And('user selects {string} item from the list', (title) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_content_browser').find(`td:contains(${title})`).first().parent().find('input').click({ force: true });
});

And('user selects {string} item from media list', (title) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_media_browser').find(`input[name*="entity_browser_select"][type='checkbox']`).eq(0).check();
});

And('user enters {string} into media search box and clicks {string}', (nameToSearch, applyBtn) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_media_browser').find(`input[id*="edit-name"]`).type(nameToSearch);
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_media_browser').find('input#edit-submit-cgov-media-browser').click({ force: true });
});

And('user clicks on {string} button to select media item', (selectMedia) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_media_browser').find(`input[id*='edit-submit'][value='${selectMedia}']`).click({ force: true });
});

And('user selects {string} from {string} dropdown {string} section', (dropDown, option, section) => {
    cy.get(`div:contains("${section}")`).parent().parent().find(`.placeholder:contains("${option}")`).parent().find(`input[value="${dropDown}"]`).eq(0).click({ force: true });
});

And('user clicks on {string} link in the {string} text area within {string} section', (title, cartOption, multimediaRow) => {
    cy.get(`div:contains("${multimediaRow}")`).parent().parent().find(`div:contains("${cartOption}")`).parent().find(`span:contains('${title}')`).eq(0).click({ force: true });
});

And('user clicks on {string} button item', (content) => {
    cy.get(`input[value='${content}']`).eq(0).click({ force: true });
});

And('user selects {string} from List Item Style dropdown under list', (option) => {
    cy.get("select[name*='field_list_item_style']").eq(0).select(option);
});

And('user clicks on {string} link in the List Items text area under List', (linkBtn) => {
    cy.get(`tbody summary[role='button'] span:contains('${linkBtn}')`).parent().click({ force: true });
});

And('user selects {string} item from media list', (title) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_media_browser').find(`input[name*="entity_browser_select"][type='checkbox']`).eq(0).check();
});


And('the intro text reads {string}', (titlText) => {
    cy.get(`div[class='blog-intro-text'] p:contains("${titlText}")`).should('be.visible');
});

And('{int} description reads {string}', (contentText) => {
    cy.get(`p:contains('${contentText}')`).should('be.visible');
});

And('the infographic displayed has the following attributes', (dataTable) => {
    for (const { index, position, imageSource, imageAlt, descText } of dataTable.hashes()) {
        const regex = new RegExp(imageSource);
        cy.get('div.centered-element').eq(index).find('img').as('image')
            .should('have.attr', 'alt').and('eq', imageAlt);
        cy.get('@image').parent().parent().parent().parent().should('have.attr', 'class').and('include', position);
        cy.get('@image').should('have.attr', 'src').and('match', regex);
        cy.get(`p:contains('${descText}')`).should('be.visible');
    }
});


And('multimedia card row displays an image which matches the earlier selected promo image of Infographic', () => {
    const expectedSrc = (imageSrc1.replace(/\?itok=[\S]+/, '')).replace(/^(.*?)\/public/, '');
    const extractedImageName = extractImgName(expectedSrc).replace(/\.jpg|\.jpeg|\.png/, '')

    cy.get('div.multimedia-feature-card.cgvInfographic.non-playable').find('img').then($el => {
        const source = $el[0].getAttribute('src');
        const actSrc = source.replace(/\?itok=[\S]+/, '').replace(/^(.*?)\/public/, '')
        expect(actSrc).to.include(extractedImageName.replaceAll('_', '-').replace('article', ''))
    });
});

And('multimedia card row displays the following cards', (dataTable) => {
    for (let { title, link } of dataTable.hashes()) {
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace("{TEST_SITE_SECTION}", siteSection);
            cy.get(`div.multimedia-slot a[href*='${link}']`).should('be.visible').and('include.text', title);
        }
    }
});

And('list card row title is {string}', (cardTitle) => {
    cy.get('div.managed.list').find(`h2:contains("${cardTitle}")`).should('be.visible');
});

And('list row displays the following links', (dataTable) => {
    for (let { title, link, description } of dataTable.hashes()) {
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace("{TEST_SITE_SECTION}", siteSection);
            cy.get(`div.managed.list a[href*='${link}']`).should('be.visible').and('include.text', title);
            cy.get('div.managed.list').find('div.description').should('be.visible').and('include.text', description);
        }
    }
});

And('the thumbnail image has an image which matches the earlier selected promo image of Infographic', () => {
    const expectedSrc = (imageSrc1.replace(/\?itok=[\S]+/, '')).replace(/^(.*?)\/public/, '');
    const extractedImageName = extractImgName(expectedSrc).replace(/\.jpg|\.jpeg|\.png/, '')

    cy.get('div.managed.list').find('img').then($el => {
        const source = $el[0].getAttribute('src');
        const actSrc = source.replace(/\?itok=[\S]+/, '').replace(/^(.*?)\/public/, '')
        expect(actSrc).to.include(extractedImageName.replaceAll('_', '-').replace('article', ''))
    });
});