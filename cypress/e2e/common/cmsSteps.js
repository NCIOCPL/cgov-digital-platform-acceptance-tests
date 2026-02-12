/// <reference types="Cypress" />
import { And, Then, Given, When } from 'cypress-cucumber-preprocessor/steps';


const username = Cypress.env('admin_username');
const password = Cypress.env('admin_password');
const siteSection = Cypress.env('test_site_section');
const randomStr = Cypress.env('randomStr');
const frontEndBaseUrl = Cypress.env('front_end_base_url');

When('user enters credentials of {string}', (username) => {
    // the password value should not be shown
    if (typeof password !== 'string' || !password || password === '') {
        throw new Error('Missing password value, set using CYPRESS_admin_password=...')
    }
    cy.get('input#edit-name').type(username, { log: false });
    cy.get('input#edit-pass').type(password, { log: false });
});

And('user clicks {string} button', (loginButton) => {
    cy.get('input#edit-submit').contains(loginButton).click();
});

When('user is logged in and the user name {string} is displayed in the toolbar', (admin) => {
    cy.get('#toolbar-item-user').should('have.text', admin).and('be.visible');
});

Then('the tool bar appears at the top', () => {
    cy.get('nav#toolbar-bar[data-offset-top]').should('be.visible');
});

When('user clicks on {string} tab', (option) => {
    cy.get('ul.toolbar-menu>li>a:visible').contains(option).click({ force: true });
});

And('user clicks on {string} action button', (buttonLabel) => {
    cy.get(`ul.local-actions a:contains(${buttonLabel})`).click({ force: true });
});
And('user clicks on {string} content type', (contentType) => {
    cy.get(`a.admin-item__link:contains('${contentType}')`).click({ force: true });
});
When('user selects test site section', () => {
    cy.get("input[value='Select Site Section']").click({ force: true });
    cy.getIframeBody('iframe.entity-browser-modal-iframe')
        .find('input[name="computed_path_value"]').type(siteSection);
    cy.getIframeBody('iframe.entity-browser-modal-iframe')
        .find('input#edit-submit-site-section-browser').click({ force: true });
        cy.wait(500)
    cy.getIframeBody('iframe.entity-browser-modal-iframe')
        .find(`td:contains('${siteSection}')`).first().parent()
        .find('td.views-field.views-field-entity-browser-select input').check();
    cy.getIframeBody('iframe.entity-browser-modal-iframe')
        .find("input[id='edit-submit'][value='Select Site Section']").click({ force: true });
});

And('user selects {string} from {string} dropdown', (option, dropdown) => {
    cy.get(`label:contains('${dropdown}')`).parent().find('select').select(option)
});

And('user fills out {string} text area with {string}', (textFieldLabel, value) => {
    cy.get('.ck-content[contenteditable=true]').then(el => {
        const editor = el[0].ckeditorInstance
        editor.data.set(value)
    });
})

When('user saves the content page', () => {
    cy.get("input[id='edit-submit']").click({ force: true });
});

And('user clicks on the tool bar status button {string}', (status) => {
    cy.get(`a[data-label='${status}']`).click();
});
And('user clicks {string} button from other actions', (action) => {
    cy.get(`a:contains('${action}')`).click();
});

And('user clicks {string} button from Moderation sidebar', (action) => {
    cy.get(`input[value='${action}']`).click();
});
And('user clears out {string} field', (fieldLabel) => {
    cy.get(`label:contains('${fieldLabel}')`).parent().find('input').clear();
});
And('user selects {string} from workflow actions', (action) => {
    cy.get(`input[value='${action}']`).click();
})

And('user clicks on {string} content action button', (actionButtonLabel) => {
    cy.get(`input[value='${actionButtonLabel}']`).first().click();
});

When('user clicks on {string} button', (deleteBtn) => {
    cy.get(`input[value='${deleteBtn}']`).click();
});
Then('the confirmation text {string} appears on a screen', (text) => {
    cy.get("div[role='contentinfo']").should('include.text', text);
});

And('the content item with url {string} does not exist in the list of content', (url) => {
    cy.get(`a[href='${siteSection}/${url}-${randomStr}']`).should('not.exist');
});

And('the following drupal fields are present', (dataTable) => {
    for (const { fieldLabel, field_name } of dataTable.hashes()) {
        cy.get(`input[name^='${field_name}']`).as('inputField').parent().find('label')
            .should('include.text', fieldLabel).and('be.visible');
    }
});

And('today date is displayed for the following fields', (dataTable) => {
    const date = new Date();
    const year = date.getFullYear();
    const month = date.getMonth() + 1;
    const adjMonth = month < 10 ? `0${month}` : month;
    const day = date.getDate();
    const adjDay = day < 10 ? `0${day}` : day;
    const expectedDate = `${year}-${adjMonth}-${adjDay}`;
    for (const { date } of dataTable.hashes()) {
        cy.get(`h4:contains('${date}')`).parent().find('input').should('have.attr', 'value', expectedDate);
    }
});

And('Date Display Mode has the following checkboxes', (dataTable) => {
    let i = 0;
    for (const { checkbox } of dataTable.hashes()) {
        cy.get('fieldset#edit-field-date-display-mode--wrapper input').parent().find('label').eq(i)
            .should("have.text", checkbox);
        i++;
    }
});

And('Related Resources dropdown is displayed with the following options', (dataTable) => {
    for (const { option } of dataTable.hashes()) {
        cy.get('div[id^="field-related-resources"]').find(`input[value="${option}"]`).should('exist');
    }
});

And('Search Engine Restrictions dropdown has default value {string}', (value) => {
    cy.get('div#edit-field-search-engine-restrictions-wrapper').find('select').should('have.value', value)
});

And('List Description text area is displayed', () => {
    cy.get('textarea[name^="field_list_description"]').should('be.visible')
});

And('user checks {string} checkbox', (checkboxLbl) => {
    cy.get('fieldset#edit-field-date-display-mode--wrapper input').parent().find(`label:contains("${checkboxLbl}")`).as('checkbox');
    cy.get('@checkbox').parent().find('input').check();
});

And('{string} date stamp displays todays date', (stampLbl) => {
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
    cy.get('.cgdp-document-dates li').as('dateStamp').find('strong').should('have.text', stampLbl);
    cy.get('@dateStamp').find('time').should('include.text', expectedDate);
});

And('user enters {string} into {string} text field', (value, fieldLabel) => {
    cy.get(`div[class*="form-type-textarea"] label:contains("${fieldLabel}")`).parent().find('div>textarea').type(value);
});

And('user selects {string} from contents dropdown', (contentsList) => {
    cy.get("li[class='dropbutton-toggle'] button[type='button']").should('be.visible').click({ force: true })
    cy.get(`input[value="${contentsList}"]`).click({ force: true })
});

And('user clicks on {string} button to add list item', (linkBtn) => {
    cy.get(`summary[role='button']:contains('${linkBtn}')`).click({ force: true });
});

And('user clicks on hidden {string} button', (contentBtn) => {
    cy.get(`[value='${contentBtn}']`).click({ force: true })
});

And('user selects {string} from content list', (title) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_content_browser').find(`td:contains(${title})`).parent().find('input').click({ force: true })
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_content_browser').find('#edit-submit').click({ force: true });
});

And('{string} had been selected', (title) => {
    cy.get(`div:contains("${title}")`).should('be.visible');
});

When('user saves the content page', () => {
    cy.get('edit-submit').click
});

And('list item title is {string}', (title) => {
    cy.get(`a:contains("${title}")`).should('be.visible').and('have.text', title)
});

And('list item description is {string}', (title) => {
    cy.get(`div.description p`).should('be.visible').and('have.text', title)
});

And('user clicks on {string} sub tab', (contentSubTab) => {
    cy.get(`li.tabs__tab a:contains("${contentSubTab}")`).click({ force: true });
});

And('user uploads test file {string}', (fileName) => {
    cy.fixture(fileName, { encoding: null }).as('fixture')
    cy.get('input[type=file]').selectFile('@fixture');
    cy.wait(2000);
});

And('user clicks on dropdown button toggle to view all Related Resources types', () => {
    cy.get('.dropbutton-toggle button').click({ force: true });
});

And('user selects {string} related resource item', (resourceType) => {
    cy.get(`input[value='${resourceType}']`).click({ force: true });
});

Then('{string} section appears', (resourceType) => {
    cy.get(`tbody div:contains("${resourceType}")`).should('be.visible');
});

And('user clicks on {string} button to link to a resource', (link) => {
    cy.get(`summary[role='button']:contains('${link}')`).click({ force: true });
});

And('user clicks on {string} to choose a resource to link', (selectContentLbl) => {
    cy.get(`input[value='${selectContentLbl}']`).click({ force: true });
})

And('user selects {string} item from the list', (title) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_content_browser').find(`td:contains(${title})`).parent().find('input').click({ force: true });
});

And('user clicks on {string} button to select item', (selectContent) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_content_browser').find(`input[id='edit-submit'][value='${selectContent}']`).click({ force: true });
});

And('user fills out {string} field with {string}', (fieldLbl, value) => {
    cy.get(`tbody label:contains("${fieldLbl}")`).parent().find('input').type(value);
});

And('user clicks on {string} button to link to a media', (link) => {
    cy.get(`summary[role='button']:contains('${link}')`).eq(1).click({ force: true });
});

And('{string} had been selected', (title) => {
    cy.get(`div:contains("${title}")`).should('be.visible');
})

And('user enters {string} into media title search box and clicks {string}', (nameToSearch, applyBtn) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_media_browser').find('input#edit-name').type(nameToSearch);
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_media_browser').find('input#edit-submit-cgov-media-browser')
        .click({ force: true });
});

And('user selects {string} item from the media list', (title) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_media_browser').find(`td:contains(${title})`).parent().find('input').click({ force: true });
});

And('user clicks on {string} button to select media', (selectContent) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_media_browser').find(`input[id='edit-submit'][value='${selectContent}']`).click({ force: true });
});

Then('Related Resources section contains the following links', (dataTable) => {
    for (let { title, link } of dataTable.hashes()) {
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace("{TEST_SITE_SECTION}", siteSection)
        }
        cy.get(`a[href*="${link}"]`).should('have.text', title);
    }
});

And('user deletes test article with url {string}', (url) => {
    cy.get(`form[id^="views-form-content-page"]`).then(($content) => {
        if ($content.find(`a[href='${siteSection}/${url}-${randomStr}']`).length) {
            cy.get(`a[href='${siteSection}/${url}-${randomStr}']`).parent().parent().find('input.form-checkbox').check();
            cy.get('select[name="action"]').select("Delete content");
            cy.get(`input[value='Apply to selected items']`).first().click();
            cy.get('h1:contains("Are you sure you want to delete this content item?")').should('be.visible');
            cy.get(`input[value='Delete']`).click();
            cy.get("div[role='contentinfo']").should('include.text', 'Deleted 1 content item.');
        }
    });

})

And('user deletes test file with url {string}', (url) => {
    cy.get(`form[id^="views-form-media-media-page-list"]`).then(($content) => {
        if ($content.find(`a[href*='${siteSection}/${url}']`).length) {
            cy.get(`a[href*='${siteSection}/${url}']`).parent().parent().find('input.form-checkbox').check();
            cy.get('select[name="action"]').select("Delete media");
            cy.get(`input[value='Apply to selected items']`).first().click();
            cy.get('h1:contains("Are you sure you want to delete this media item?")').should('be.visible');
            cy.get(`input[value='Delete']`).click();
            cy.get("div[role='contentinfo']").should('include.text', 'Deleted 1 item.');
        }
    });
});



//************************************Adding Citations***************************************************
When('user clicks on Add Citation button', () => {
    cy.get("input[value='Add Citation']").click({ force: true })
})

Then('{string} label is displayed {int} times', (contentType, num) => {
    cy.get(`.layout-region.layout-region-node-main label:contains('${contentType}')`).should('have.length', num)
})

//this needs to be pass, the iframe locators are the same.
And('user types {string} in the {int} citation body field', (value, num) => {
    
    cy.get('table[id*="field-citation-values"]').find('.ck-content[contenteditable=true]').eq(num-1).then(el => {
        const editor = el[0].ckeditorInstance
        editor.data.set(value)
    });
    
})

And('user clicks on icon to add a link to {int} citation', (num) => {
    cy.get("table[id*='field-citation-values'] button[data-cke-tooltip-text*='Link']").eq(num - 1).click()
})

And('user types {string} in the citation url field and saves it', (link) => {
    cy.get("div[class='ck ck-labeled-field-view__input-wrapper']").find('input[class*="form-linkit"]').focus().type(link)
    cy.get('button[class="ck ck-button ck-button-action ck-button-bold ck-off ck-button_with-text"]').click({force:true})
    cy.wait(3000)
})

And('{string} titled citation paragraph is displayed', (title) => {
    cy.get(`.cgdp-article-footer-citation`).should('include.text', title)
})

And('citation number {int} titled {string} is a {string} link with an url {string}', (num, citationText, pubMed, link) => {
    cy.get(`.cgdp-article-footer-citation ol li`).eq(num - 1).as('cit').find('p').should('have.text', citationText);
    cy.get('@cit').find('a').should('include.text', pubMed).and('have.attr', 'href', link);
})
// this step does not exist in the front end 
And('citation number {int} titled {string} links to {string} and exit disclaimer is displayed', (num, citText, linkUrl) => {
    cy.get(`.cgdp-article-footer-citation ol li`).eq(num - 1).as('cit').find('p').should('include.text', citText);
    cy.get('@cit').find('a').should('have.attr', 'href', linkUrl);
})

And('citation number {int} titled {string} has no link', (num, citText) => {
    cy.get(`.cgdp-article-footer-citation ol li`).eq(num - 1).as('cit').find('p').should('have.text', citText);
    cy.get('@cit').find('a').should('not.exist')
})

And('user selects the {string} content item', (dropDown) => {
    cy.get(`input[id*="edit-field-landing-contents-add-more-add-more-button-cgov-two-item-feature-row"]`).click({ force: true });
});

And('user clicks on the {string} link in the {string} text area', (title, cardOption) => {
    cy.get(`summary.claro-details__summary:contains('${title}')`).click();
});

And('user removes {string} section', (removeSection) => {
    cy.get('#edit-field-landing-contents-0-top-links-remove-button').click({ force: true });
});

And('user confirms removal', () => {
    cy.get(`li.confirm-remove.dropbutton-action input[value='Confirm removal']`).click({ force: true });
});

And('user clicks on the title with url {string} from the list of content', (contentHref) => {
    cy.get(`a[href*='${siteSection}/${contentHref}-${randomStr}']`).click();
});

And('user clicks on {string} button item', (title) => {
    cy.get(`input[value="${title}"]`).click({ force: true })
});

And('user selects {string} item from main page content', (title) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`td:contains("${title}")`).parent().find('input').check();
});

// for promo image verification

let imageSrc;
And('user selects {int} Promotional Image for the mini landing', (num) => {
    cy.get('summary:contains("Promotional Image")').parent().as('imageUpload').click()
    cy.get('input[name="field_image_promotional_entity_browser_entity_browser"]').click({ force: true })
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true })
});

And('user remembers the source of selected promo image for the mini landing', () => {
    cy.get('details img').then($el => {
        imageSrc = $el[0].getAttribute('src').replace('.webp','')
    })
});

Then('user selects {string} option from Operations dropdown for content with title {string}', (translateOption, title) => {
    cy.get(`td:contains('${title}')`).siblings('td').find(`ul.dropbutton >li> a:contains("${translateOption}")`).click({ force: true });
});

Then('the page title is {string}', (title) => {
    cy.get(`h2:contains('${title}')`).should('be.visible');
});

When('user clicks on {string} button to add translation', (addBtn) => {
    cy.get(`li.add.dropbutton-action a:contains("${addBtn}")`).click({ force: true });
});

When('user clicks on {string} button to edit translation', (editBtn) => {
    cy.get(`li.edit.dropbutton-action a:contains("${editBtn}")`).eq(1).click({ force: true });
});


And('Remove button for image was translated as {string}', (removeBtn) => {
    cy.get(`input[value='${removeBtn}']`).should('be.visible');
});

And('Related Resources section was translated as {string}', (relatedResources) => {
    cy.get(`div#field-related-resources-add-more-wrapper h4:contains("${relatedResources}")`).should('be.visible');
});

And('dropdown to add link under related resources was translated to start with {string}', (dropDownText) => {
    cy.get(`li[class*="-link dropbutton__item dropbutton-action"] input[value^='${dropDownText}']`).should('be.visible');
});

And('button to add citation was translated as {string}', (citationBtn) => {
    cy.get(`input[value='${citationBtn}']`).should('be.visible');
});

And('heading was translated as {string}', (headingTranslation) => {
    cy.get(`div.paragraphs-subform.js-form-wrapper.form-wrapper label:contains("${headingTranslation}")`).should('be.visible');
});

And('{string} label is displayed', (fieldLabel) => {
    cy.get(`div[class*="form-type-textarea"] label:contains("${fieldLabel}")`).should('be.visible');
});

Then('Recursos relacionados section contains the following links', (dataTable) => {
    for (let { title, link } of dataTable.hashes()) {
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace("{TEST_SITE_SECTION}", siteSection)
            link = link + '-' + randomStr
        }
        cy.get(`.cgdp-related-resources a:contains("${title}")`).should('be.visible').and('have.attr', 'href', link);
    }
});

And('{string} dropdown displays {string}', (fieldLabel, displayedText) => {
    cy.get(`label:contains("${fieldLabel}")`).siblings('select').find(`option:contains("${displayedText}")`).should('be.visible');
});

And('current state was translated as {string} {string}', (currentModerationState, state) => {
    cy.get(`div#edit-moderation-state-0-current label:contains("${currentModerationState}")`).should('be.visible');
    cy.get('div#edit-moderation-state-0-current').should('include.text', state);
});

And('Change to dropdown has the following options', (dataTable) => {
    for (let { option } of dataTable.hashes()) {
        cy.get(`div[class*="moderation-state-0-state"] option:contains("${option}")`).should('be.visible');
    }
});

And('the following fields are displayed', (dataTable) => {
    for (let { fieldLabel, field_name } of dataTable.hashes()) {
        cy.get(`input[name^='${field_name}']`).as('inputField').parent().find('label').should('include.text', fieldLabel);
    }
});

And('Save button was translated as {string}', (saveBtn) => {
    cy.get(`input[value='${saveBtn}']`).should('be.visible');
});

And('preview button was translated as {string}', (previewBtn) => {
    cy.get(`input[value='${previewBtn}']`).should('be.visible');
});

And('date published was translated as {string}', (datePublished) => {
    cy.get('.cgdp-document-dates li strong').should('be.visible').and('include.text', datePublished);
});

And('the Card Title has a link {string} with href {string}', (linkText, linkHref) => {
    const date = new Date();
    const currYear = date.getFullYear();
    if (linkHref.includes("{YEAR}")) {
        linkHref = linkHref.replaceAll("{YEAR}", currYear);
    }
    cy.get(`a[href*="${linkHref}"] h3:contains('${linkText}')`).should('be.visible');
});

And('feature card description reads {string}', (description) => {
    cy.get(`div.feature-card p:contains('${description}')`).should('be.visible');
});

And('user fills out the following fields', (dataTable) => {
    for (let { fieldLabel, value, field_name } of dataTable.hashes()) {
        if (fieldLabel === 'Pretty URL') {
            value = `${value}-${randomStr}`;
        }
        cy.get(`input[name^='${field_name}']`).as('inputField').parent().find('label').should('include.text', fieldLabel);
        cy.get('@inputField').type(value);
    }
});

And('user clicks on title with url {string} from the list of content', (contentHref) => {
    cy.get(`a[href='${siteSection}/${contentHref}-${randomStr}']`).click();
});

And('user clicks on Edit page with url {string} from the list of content', (contentHref) => {
    cy.get(`a[href='${siteSection}/${contentHref}-${randomStr}']`).parent().parent().find("li[class*='edit']").click();
});

And('user clicks on blog with url {string} from the list of content', (contentHref) => {
    cy.get(`td[class*='views-field'] >a[href*='${contentHref}-${randomStr}']`).click();
});

And('user selects a checkbox next to title with url {string} from the list of content', (url) => {
    cy.get(`a[href='${siteSection}/${url}-${randomStr}']`).parent().parent().find('input.form-checkbox').check();
});

Given('user is navigating to the front end site with path site section plus {string}', (purl) => {
    cy.visit(`${frontEndBaseUrl}${siteSection}/${purl}-${randomStr}`, { retryOnStatusCodeFailure: true }, { failOnStatusCode: false });
});

Given('user is navigating to the front end site with spanish path {string} site section plus {string}', (spPath, purl) => {
    cy.visit(`${frontEndBaseUrl}${spPath}${siteSection}/${purl}-${randomStr}`, { retryOnStatusCodeFailure: true });
})

And('user selects {string} from Change to dropdown', (option) => {
    cy.get('select#edit-moderation-state-0-state').select(option)
})

And('user deletes {string} image', (image) => {
    cy.get(`form[id^="views-form-media-media-page-list"]`).then(($content) => {
        if ($content.find(`a:contains("${image}")`)) {
            cy.get(`a:contains("${image}")`).parent().parent().find('input.form-checkbox').check();
            cy.get('select[name="action"]').select("Delete media");
            cy.get(`input[value='Apply to selected items']`).first().click();
            cy.get('h1:contains("Are you sure you want to delete this media item?")').should('be.visible');
            cy.get(`input[value='Delete']`).click();
            cy.get("div[role='contentinfo']").should('include.text', 'Deleted');
        }
    });
});


And('the image {string} does not exist in the list of content', (image) => {
    cy.get(`form[id^="views-form-media-media-page-list"]`).find(`a:contains("${image}")`).should('not.exist');
});

And('user selects {string} action', (action) => {
    cy.get('select[name="action"]').select(action);
});

And('user selects {string} from Display dropdown', (dropdown) => {
    cy.get("select[name*='[display_id]").select(dropdown)
})

And('user selects {string} from Source View dropdown', (sourceDropdown) => {
    cy.get("select[name*='[field_source_view][0][target_id]']").select(sourceDropdown)
});

And('user enters {string} in Raw HTML Content under Secondary Contents', (value) => {
    cy.get('table[id*="field-secondary-contents"]').find('textarea[name*="field_raw_html"]').type(value);
})

When('user clicks on {string} option button', (btnText) => {
    cy.get(`[id*='edit-${btnText.toLowerCase()}']`).click();
});

When('user confirms {string} action', (btnText) => {
    //conditional here is to differentiate between ESP and ENG content
    //because Drupal renders it differently based on lang
    if (btnText.includes('Delete')) {
        cy.get(`div[class*='ui-dialog-buttonset form-actions'] button:contains('${btnText}')`).click();
    } else {
        cy.get(`input[value='${btnText}']`).click()
    }

});


And('user clicks on title with url spanish path {string} site section plus {string}', (spPath, purl) => {
    cy.get(`a[href='${spPath}${siteSection}/${purl}-${randomStr}']`).click();
});

And('user clicks on title with url spanish path {string} plus {string}', (spPath, purl) => {
    cy.get(`a[href='${spPath}/${purl}-${randomStr}']`).click();
})

And('user clicks on title with url spanish path {string} plus {string} plus {string}', (spPath, series, blog) => {
    cy.get(`a[href='${spPath}/${series}-${randomStr}/${blog}-${randomStr}']`).click();
})

Given('user is navigating to the front end site with path {string}', (path) => {
    cy.reload(true);
    cy.visit(`${frontEndBaseUrl}${path}`, { retryOnStatusCodeFailure: true });
})

And('user types {string} into Caption text field', (value) => {
    cy.get('.ck-content[contenteditable=true]').then(el => {
        const editor = el[0].ckeditorInstance
        editor.data.set(value)
    });
})