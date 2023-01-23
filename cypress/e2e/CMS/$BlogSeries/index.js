/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';

const siteSection = Cypress.env('test_site_section');

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

And('user clicks on title with url {string} under {string} from the list of content', (blogPost, blogSeries) => {
    const date = new Date();
    const currYear = date.getFullYear();
    cy.get(`a[href='${blogSeries}-${randomNum}/${currYear}/${blogPost}-${randomNum}']`).click();
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

Given('user is navigating to the blog {string} under {string}', (blogPost, blogSeries) => {
    const date = new Date();
    const currYear = date.getFullYear();
    const frontEndBaseUrl = Cypress.env('front_end_base_url');
    cy.visit(`${frontEndBaseUrl}/${blogSeries}-${randomNum}/${currYear}/${blogPost}-${randomNum}`, { retryOnStatusCodeFailure: true });
});

And('the content item with url {string} does not exist in the list of content', (url) => {
    cy.get(`a[href='${siteSection}/${url}-${randomNum}']`).should('not.exist');
});

And('user enters {string} as intro text', (introText) => {
    cy.getIframeBody("iframe[title='Rich Text Editor, Intro Text field']").find('p').type(introText);
});

And('user fills out {string} text area with {string}', (textFieldLabel, value) => {
    cy.getIframeBody("iframe[title^='Rich Text Editor, Body field']").find('p').type(value);
});

And('user enters {string} into the {string} text field', (value, textFieldLabel) => {
    cy.get(`[class*='form-item-field-banner-image-0-alt']:contains("${textFieldLabel}")`).find('input.form-text').type(value);
    cy.wait(2000);
});

And('user fills out {string} text area with {string} in the blog series', (textFieldLabel, value) => {
    cy.getIframeBody("iframe[title^='Rich Text Editor, About Blog field']").find('p').type(value);
});

And('user clicks on dropdown button toggle to view Featured Posts', () => {
    cy.get('details#edit-field-featured-posts').click({ force: true });
});

And('user clicks on {string} button to link to the Featured Post', (selectBtn) => {
    cy.get(`input[value='${selectBtn}']`).click({ force: true });
});

And('the banner image is displayed', () => {
    cy.get('div.blog.body-banner').find('img').should('be.visible');
});

Then('{string} section appears', (selectEntitiesSection) => {
    cy.get('div.ui-dialog-titlebar.ui-helper-clearfix').should('be.visible');
    cy.get('div.ui-dialog-titlebar.ui-helper-clearfix').find('span').should('include.text', selectEntitiesSection);
});

And('user selects {string} item from the list', (title) => {
    cy.getIframeBody("iframe.entity-browser-modal-iframe").find(`td:contains(${title})`).parent().find('input').check();
});

And('user clicks on {string} button to select item', (selectContent) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_blog_browser').find(`input[id='edit-submit']`).should('be.visible');
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_blog_browser').find(`input[id='edit-submit'][value='${selectContent}']`).click({ force: true });
});

let imageSrc1;
And('user selects {int} Promotional Image from the list of images for blog series', (num) => {
    cy.get('span:contains("Promotional Image")').parent().first().click()
    cy.get('input[name="field_image_promotional_entity_browser_entity_browser"]').click({ force: true })
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true })
});

And('user remembers the source of selected promo image for blog series for further verification', () => {
    cy.get('div[id*="edit-field-image-promotional"] img').then($el => {
        imageSrc1 = $el[0].getAttribute('src')
    })
})

And('user selects {string} from Blog Series dropdown', (blogSeries) => {
    cy.get('select[name="field_blog_series"] option').each($opt => {
        if (($opt[0].textContent).includes(blogSeries)) {
            cy.get('select[name="field_blog_series"]').select($opt[0].textContent);
            return;
        }
    })
});

And('blog series description reads {string}', (desc) => {
    cy.get(`p:contains('${desc}')`).should('be.visible');
});

And('user clicks on {string} sub tab', (contentSubTab) => {
    cy.get(`ul.admin-list li a:contains("${contentSubTab}")`).click({ force: true });
});

And('user selects {string} option from Operations for {string}', (option, label) => {
    cy.get(`td:contains("${label}")`).parent().find(`a:contains("${option}")`).click();
});

And('user selects {string} radio button under {string}', (option, label) => {
    cy.get(`#edit-field-owner-blog label:contains("${option}")`).first().click();
});

And('user checks {string} checkbox', (checkboxLbl) => {
    cy.get('fieldset#edit-field-blog-topics--wrapper input').parent().find(`label:contains("${checkboxLbl}")`).as('checkbox');
    cy.get('@checkbox').parent().find('input').check();
});

And('user enters {string} into Description field', (description) => {
    cy.getIframeBody("iframe[title='Rich Text Editor, Description field']").find('p').type(description);
});

And('the {string} link appears with url {string}', (subscribeLinkText, linkUrl) => {
    cy.get(`a:contains("${subscribeLinkText}")`).should('be.visible').and('have.attr', 'href', linkUrl);
});

And('the {string} managed list appears', (featuredPosts) => {
    cy.get('div.managed.list.with-date').find('h2').should('be.visible').and('include.text', featuredPosts);
});

And('the {string} accordion is displayed', (archiveAccor) => {
    cy.get('div#blog-archive-accordion').should('be.visible').and('contain.text', archiveAccor);
});

And('blog posts list does not appear in the archive', () => {
    cy.get('#blog-archive-accordion-year').invoke('css', 'display', 'none').should('have.css', 'display', 'none');
});
let imageSrc;
And('user selects {int} Lead Image from the list of images for blog series', (num) => {
    cy.get('span:contains("Lead Image")').parent().click();
    cy.wait(1000);
    cy.get('input[name="field_image_article_entity_browser_entity_browser"]').click()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click()
});

And('user remembers the source of selected lead image for blog series for further verification', () => {
    cy.get('details img').then($el => {
        imageSrc = $el[0].getAttribute('src')
    });
});

And('public use text is not displayed', () => {
    cy.get("div[class='public-use']").should('not.exist');
});

And('the Featured Posts section is displayed with the following cards', (dataTable) => {
    for (const { title, linkEnding, expectedDate, author } of dataTable.hashes()) {
        cy.get(`a:contains("${title}")`).should('be.visible').and('have.attr', 'href');
        cy.get(`a:contains("${title}")`).invoke('attr', 'href').then(href => {
            expect(href).to.include(linkEnding);
        });
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
        const todayDate = `${month} ${day}, ${year}`;
        cy.get(`div.byline p:contains("${todayDate}")`).should('be.visible');
        cy.get(`p:contains("${author}")`).should('be.visible');
    }
});

Then('list of blog post has the following posts', (dataTable) => {
    for (let { title, url, expectedDate, author } of dataTable.hashes()) {
        cy.get(`a:contains("${title}")`).should('be.visible').and('have.attr', 'href');
        if (url.includes("{TEST_SITE_SECTION}")) {
            url = url.replace("{TEST_SITE_SECTION}", siteSection)
        }
        if (url.includes("{RANDOM}")) {
            url = url.replaceAll("{RANDOM}", randomNum);
        }
        const date1 = new Date();
        const currYear = date1.getFullYear();
        if (url.includes("{YEAR}")) {
            url = url.replace("{YEAR}", currYear);
        }
        cy.get(`a:contains("${title}")`).should('be.visible').and('have.attr', 'href', url);
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
        const todayDate = `${month} ${day}, ${year}`;
        cy.get(`div.date-author time:contains("${todayDate}")`).should('be.visible');
        cy.get('div.date-author').should('include.text', author);
    }
});

And('the promotional image is matching the earlier selected image', () => {
    function extractImgName(imageFullName) {
        let str = '';
        for (let i = 0; i < imageFullName.length; i++) {
            let stringToRemove = '';
            if (imageFullName.charAt(i) === '/') {
                for (let j = i; j < imageFullName.length; j++) {
                    stringToRemove += imageFullName.charAt(j);
                    if (imageFullName.charAt(i + 1) === '/') {
                        return;
                    }
                }
                str = stringToRemove;
            }
        }
        return str;
    }
    const expectedSrc = (imageSrc1.replace(/\?itok=[\S]+/, '')).replace(/^(.*?)\/public/, '');
    const extractedImageName = extractImgName(expectedSrc).replace(/\.jpg|\.jpeg|\.png/, '')

    cy.get('.views-element-container ul li').find('img').then($el => {
        const source = $el[0].getAttribute('src');
        const actSrc = source.replace(/\?itok=[\S]+/, '').replace(/^(.*?)\/public/, '')
        expect(actSrc).to.include(extractedImageName.replaceAll('_', '-').replace('article', ''))
    })
});

And('the Continue Reading link appears with the following href', (dataTable) => {
    for (let { linkName, linkHref } of dataTable.hashes()) {
        if (linkHref.includes("{TEST_SITE_SECTION}")) {
            linkHref = linkHref.replace("{TEST_SITE_SECTION}", siteSection);
        }
        const date1 = new Date();
        const currYear = date1.getFullYear();
        if (linkHref.includes("{YEAR}")) {
            linkHref = linkHref.replace("{YEAR}", currYear);
        }
        if (linkHref.includes("{RANDOM}")) {
            linkHref = linkHref.replaceAll("{RANDOM}", randomNum);
        }
        cy.get(`p a[href='${linkHref}']`).should('be.visible').and('have.text', linkName);
    }
});

And('the Test Blog Topic link appears with the following href', (dataTable) => {
    for (let { linkName, linkHref } of dataTable.hashes()) {
        if (linkHref.includes("{TEST_SITE_SECTION}")) {
            linkHref = linkHref.replace("{TEST_SITE_SECTION}", siteSection);
        }
        if (linkHref.includes("{RANDOM}")) {
            linkHref = linkHref.replaceAll("{RANDOM}", randomNum);
        }
        cy.get(`div.managed.list.without-date a[href='${linkHref}']`).should('be.visible').and('have.text', linkName);
    }
});

And('the {string} managed list appears without the date', (categories) => {
    cy.get('div.managed.list.without-date').find('h2').should('be.visible').and('include.text', categories);
});

And('user selects a checkbox next to title {string} with url {string} from the list of content', (title, lastPartUrl) => {
    cy.get(`a:contains("${title}")`).invoke('attr', 'href').then(href => {
        cy.get(`a:contains("${title}")`).parent().parent().find('input.form-checkbox').check();
    });
});

And('user clicks on the {string} action button', (buttonLabel) => {
    cy.get(`input[value='${buttonLabel}']`).first().click();
});

And('user clicks on {string} from  dropdown button under {string}', (deleteBtn, termName) => {
    cy.get(`a.menu-item__link:contains("${termName}")`).parent().parent().find(`td li.delete.dropbutton-action a:contains("${deleteBtn}")`).click({ force: true });
});