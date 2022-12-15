/// <reference types="Cypress" />
import { And, Then, Given, When } from 'cypress-cucumber-preprocessor/steps';


const username = Cypress.env('admin_username');
const password = Cypress.env('admin_password');
const siteSection = Cypress.env('test_site_section');
const frontEndBaseUrl = Cypress.env('front_end_base_url');

When('user enters credentials', () => {
    expect(username, 'username was set').to.be.a('string').and.not.be.empty
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
    cy.get(`ul.action-links a:contains(${buttonLabel})`).click({ force: true });
});
And('user clicks on {string} content type', (contentType) => {
    cy.get(`ul.admin-list span.label:contains('${contentType}')`).parent().click({ force: true });
});
When('user selects test site section', () => {
    cy.get("input[value='Select Site Section']").click({ force: true });
    cy.getIframeBody('iframe.entity-browser-modal-iframe')
        .find('input[name="computed_path_value"]').type(siteSection);
    cy.getIframeBody('iframe.entity-browser-modal-iframe')
        .find('input#edit-submit-site-section-browser').click({ force: true });
    cy.getIframeBody('iframe.entity-browser-modal-iframe')
        .find(`td:contains('${siteSection}')`).first().parent()
        .find('td.views-field.views-field-entity-browser-select input').check();
    cy.getIframeBody('iframe.entity-browser-modal-iframe')
        .find("input[id='edit-submit'][value='Select Site Section']").click({ force: true });
});

And('user fills out the following fields', (dataTable) => {
    for (const { fieldLabel, value, field_name } of dataTable.hashes()) {
        cy.get(`input[name^='${field_name}']`).as('inputField').parent().find('label').should('include.text', fieldLabel);
        cy.get('@inputField').type(value);
    }
});

And('user selects {string} from {string} dropdown', (option, dropdown) => {
    cy.get(`label:contains('${dropdown}')`).parent().find('select').select(option)
});

And('user fills out {string} text area with {string}', (textFieldLabel, value) => {
    cy.getIframeBody('iframe.cke_wysiwyg_frame.cke_reset')
        .find('p').type(value);
})

When('user saves the content page', () => {
    cy.get("input[id='edit-submit']").click({ force: true });
});

And('user clicks on title with url {string} from the list of content', (contentHref) => {
    cy.get(`a[href='${siteSection}/${contentHref}']`).click();
});
And('user clicks on the tool bar status green button {string}', (status) => {
    cy.get(`a[data-label='${status}']`).click();
});
And('user clicks {string} button from other actions', (action) => {
    cy.get(`a:contains('${action}')`).click();
});
And('user clears out {string} field', (fieldLabel) => {
    cy.get(`label:contains('${fieldLabel}')`).parent().find('input').clear();
});
And('user selects {string} from workflow actions', (action) => {
    cy.get(`input[value='${action}']`).click();
})

And('user selects a checkbox next to title with url {string} from the list of content', (url) => {
    cy.get(`a[href='${siteSection}/${url}']`).parent().parent().find('input.form-checkbox').check();
});
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
    cy.get(`a[href='${siteSection}/${url}']`).should('not.exist');
});

Given('user is navigating to the front end site with path site section plus {string}', (purl) => {
    cy.on('uncaught:exception', (err, runnable) => {
        if (err.message.includes('Failed to load script https://assets.adobedtm.com')) {
            return false;
        }
        return true
    })

    cy.visit(`${frontEndBaseUrl}${siteSection}/${purl}`, { retryOnStatusCodeFailure: true });
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
    cy.get('div.document-dates li').as('dateStamp').find('strong').should('have.text', stampLbl);
    cy.get('@dateStamp').find('time').should('include.text', expectedDate);
});

And('user enters {string} into {string} text field', (value, fieldLabel) => {
    cy.get(`div[class*="form-type-textarea"] label:contains("${fieldLabel}")`).parent().find('div>textarea').type(value);
});

And('user selects {string} from contents dropdown', (contentsList) => {
    cy.get("li[class='dropbutton-toggle'] button[type='button']").should('be.visible').click({ force: true })
    cy.get(`input[value="${contentsList}"]`).click({ force: true })
});

And('user selects {string} from {string} dropdown', (title, dropdown) => {
    cy.get(`label:contains('${dropdown}')`).parent().find('select').select(title)
});

And('user clicks on {string} button to add list item', (linkBtn) => {
    cy.get(`tbody summary[role='button'] span:contains('${linkBtn}')`).parent().click({ force: true });
});

And('user clicks on {string} button', (contentBtn) => {
    cy.get(`[class*='form-submit '][value='${contentBtn}']`).click({ force: true })
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
    cy.get(`tbody summary[role='button'] span:contains('${link}')`).parent().click({ force: true });
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
    cy.get(`tbody summary[role='button'] span:contains('${link}')`).eq(1).parent().click({ force: true });
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
    for (const { title, link } of dataTable.hashes()) {
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace("{TEST_SITE_SECTION}", siteSection)
        }
        cy.get(`a[href="${link}"]`).should('have.text', title);
    }
});

And('user deletes test article with url {string}', (url) => {
    cy.get(`form[id^="views-form-content-page"]`).then(($content) => {
        if ($content.find(`a[href='${siteSection}/${url}']`).length) {
            cy.get(`a[href='${siteSection}/${url}']`).parent().parent().find('input.form-checkbox').check();
            cy.get(`input[value='Apply to selected items']`).first().click();
            cy.get('h1:contains("Are you sure you want to delete this content item?")').should('be.visible');
            cy.get(`input[value='Delete']`).click();
            cy.get("div[role='contentinfo']").should('include.text', 'Deleted 1 content item.');
        }
    });

})

And('user deletes test file with url {string}', (url) => {
    cy.get(`form[id^="views-form-media-media-page-list"]`).then(($content) => {
        if ($content.find(`a[href='${siteSection}/${url}']`).length) {
            cy.get(`a[href='${siteSection}/${url}']`).parent().parent().find('input.form-checkbox').check();
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
    cy.getNthIframe("iframe[title='Rich Text Editor, Citation Content field']", num - 1).find('p').type(value)
})

And('user clicks on icon to add a link to {int} citation', (num) => {
    cy.get("div[id^='field-citation'] a[title^='Link']").eq(num - 1).click()
})

And('user types {string} in the citation url field and saves it', (link) => {
    cy.get('div#editor-link-dialog-form input').first().type(link)
    cy.get('div.ui-dialog-buttonset.form-actions button').click()
    cy.wait(3000)
})

And('{string} titled citation paragraph is displayed', (title) => {
    cy.get(`#cgvCitationSl`).should('include.text', title)
})

And('citation number {int} titled {string} is a {string} link with an url {string}', (num, citationText, pubMed, link) => {
    cy.get(`ol[class='article-citation'] li`).eq(num - 1).as('cit').find('p').should('have.text', citationText);
    cy.get('@cit').find('a').should('include.text', pubMed).and('have.attr', 'href', link);
})
// this step does not exist in the front end 
And('citation number {int} titled {string} links to {string} and exit disclaimer is displayed', (num, citText, linkUrl) => {
    cy.get(`ol[class='article-citation'] li`).eq(num - 1).as('cit').find('p').should('include.text', citText);
    cy.get('@cit').find('a').should('have.attr', 'href', linkUrl);
})

And('citation number {int} titled {string} has no link', (num, citText) => {
    cy.get(`ol[class='article-citation'] li`).eq(num - 1).as('cit').find('p').should('have.text', citText);
    cy.get('@cit').find('a').should('not.exist')
})