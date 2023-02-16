/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';
import { extractImgName } from "../../../utils/extractImgName.js";

const siteSection = Cypress.env('test_site_section');

And('user enters {string} as intro text', (introText) => {
    cy.getIframeBody("iframe[title='Rich Text Editor, Intro Text field']").find('p').type(introText);
});

And('user fills out {string} text area with {string}', (textFieldLabel, value) => {
    cy.getIframeBody("iframe[title='Rich Text Editor, Body field']").find('p').type(value);
});

let imageSrc;
And('user selects {int} Lead Image from the list of images', (num) => {
    cy.get('span:contains("Lead Image")').parent().click();
    cy.wait(1000);
    cy.get('input[name="field_image_article_entity_browser_entity_browser"]').click()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click()
});

let imageSrc1;
And('user selects {int} Promotional Image from the list of images', (num) => {
    cy.get('span:contains("Promotional Image")').parent().first().click()
    cy.get('input[name="field_image_promotional_entity_browser_entity_browser"]').click()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click()
});

And('user remembers the source of selected lead image for further verification', () => {
    cy.get('details img').then($el => {
        imageSrc = $el[0].getAttribute('src')
    });
});

And('user remembers the source of selected promo image for further verification', () => {
    cy.get('details img').eq(1).then($el => {
        imageSrc1 = $el[0].getAttribute('src')
    });
});

And('user selects {string} from {string}', (includeSearchText, fieldLabel) => {
    cy.get(`label:contains('${fieldLabel}')`).parent().find('select').select(includeSearchText);
});

Given('user is navigating to the blog {string} under {string}', (blogPost, blogSeries) => {
    const date = new Date();
    const currYear = date.getFullYear();
    const frontEndBaseUrl = Cypress.env('front_end_base_url');
    cy.visit(`${frontEndBaseUrl}/${blogSeries}/${currYear}/${blogPost}`, { retryOnStatusCodeFailure: true });
});

And(`blog's posted date is today's date`, () => {
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
    cy.get('p>time').should('include.text', expectedDate);
});

And('the {string} button appears', (subscribeLink) => {
    cy.get('div.subscribeRSS').find('span').should('be.visible').and('contain.text', subscribeLink);
});

And('the {string} managed list appears', (featuredPosts) => {
    cy.get('div.managed.list.with-date').find('h2').should('be.visible').and('include.text', featuredPosts);
});

And('the {string} managed list appears without a date', (categories) => {
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
    cy.get('div.managed.list.without-date').should('be.visible').and('contain.text', categories);
    cy.get('div.managed.list.without-date').should('not.include.text', expectedDate);
});

And('the {string} accordion is displayed', (archiveAccor) => {
    cy.get('div#blog-archive-accordion').should('be.visible').and('contain.text', archiveAccor);
});

And('{string} accordion is collapsed', (archive) => {
    cy.get('div#blog-archive-accordion').contains(archive).should('have.attr', 'aria-expanded', 'false');
});

And('blog posts list doesnot appear in the archive', () => {
    cy.get('#blog-archive-accordion-year').invoke('css', 'display', 'none').should('have.css', 'display', 'none');
});

And('{string} link appears', (paginationBtn) => {
    cy.get(`a:contains("${paginationBtn}")`).should('be.visible').and('have.attr', 'href');
});

When('user clicks on {string} link', (paginationBtn) => {
    cy.get('div.clearfix').contains(paginationBtn).click();
});

And('the author name {string} is displayed', (authorName) => {
    cy.get('p.blog-post-publishing-info').should('contain.text', authorName)
});

And('intro text reads {string}', (introText) => {
    cy.get(`div[class='blog-intro-text'] p:contains("${introText}")`).should('be.visible');
});

And('description reads {string}', (desc) => {
    cy.get(`p:contains('${desc}')`).should('be.visible');
});

And('the lead image is matching the earlier selected image', () => {
    cy.get('.centered-element > img').then($el => {
        const source = $el[0].getAttribute('src');
        const actSrc = source.replace(/\?itok=[\S]+/, '').replace(/^(.*?)\/public/, '')
        const expectedSrc = (imageSrc.replace(/\?itok=[\S]+/, '')).replace(/^(.*?)\/public/, '')
        expect(actSrc).to.include(expectedSrc);
    })
});

And('public use text has a link {string} with href {string}', (linkText, linkUrl) => {
    cy.get(`div[class='public-use'] a:contains('${linkText}')`).should('be.visible').and('have.attr', 'href', linkUrl)
})

And('user clicks on title with url {string} under {string} from the list of content', (blogPost, blogSeries) => {
    const date = new Date();
    const currYear = date.getFullYear();
    cy.get(`a[href='${blogSeries}/${currYear}/${blogPost}']`).click();
});

And('user clicks on dropdown button toggle {int} to view all Related Resources types', (pos) => {
    cy.get('.dropbutton-toggle button').eq(pos - 1).click({ force: true });
});

And('user clicks on the tool bar status yellow button {string}', (status) => {
    cy.get(`a[data-label='${status}']`).click();
});

And('user clicks on dropdown button toggle {int} to view all Recommended Content types', (pos) => {
    cy.get('.dropbutton-toggle button').eq(pos - 1).click({ force: true });
});

And('user selects {string} from Recommended Content dropdwon', (resourceType) => {
    cy.get(`input[value='${resourceType}']`).click({ force: true });
});

And('user clicks on {string} button to link to Recommended Content types', (link) => {
    cy.get(`tbody summary[role='button'] span:contains('${link}')`).parent().click({ force: true });
});

And('user clicks on {string} to choose a Recommended Content type to link', (selectContentLbl) => {
    cy.get(`input[value='${selectContentLbl}']`).click({ force: true });
});

And('user fills out the following Recommended Content fields', (dataTable) => {
    for (const { fieldLabel, value, field_name } of dataTable.hashes()) {
        cy.get(`input[name^='${field_name}']`).as('inputField').parent().find('label').should('include.text', fieldLabel);
        cy.log(fieldLabel);
        cy.get('@inputField').click({ force: true });
        cy.get('@inputField').type(value);
    }
});

And('{string} had been selected', (title) => {
    cy.get(`div:contains("${title}")`).should('be.visible');
});

And('user removes the Lead Image', () => {
    cy.get('#edit-field-image-article-current-items-0-remove-button').click({ force: true })
});

And('user clicks on the tool bar status red button {string}', (status) => {
    cy.get(`a[data-label='${status}']`).click();
});

And('public use text is not displayed', () => {
    cy.get("div[class='public-use']").should('not.exist');
});

Then('Related Resources section contains the following links', (dataTable) => {
    for (let { title1, link1 } of dataTable.hashes()) {
        if (link1.includes("{TEST_SITE_SECTION}")) {
            link1 = link1.replace("{TEST_SITE_SECTION}", siteSection)
        }
        cy.get(`a[href="${link1}"]`).first().should('have.text', title1);
    }
});

Then('Recommended Content section contains the following links', (dataTable) => {
    for (let { title, link } of dataTable.hashes()) {
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace("{TEST_SITE_SECTION}", siteSection)
        }
        cy.get(`a[href="${link}"]`).should('include.text', title)
    }
});

And('user selects a checkbox next to title with url {string} under {string} from the list of content', (url, blogSeries) => {
    const date = new Date();
    const currYear = date.getFullYear();
    cy.get(`a[href='${blogSeries}/${currYear}/${url}']`).parent().parent().find('input.form-checkbox').check();
});

And('user selects {string} from Blog Series dropdown', (blogSeries) => {
    cy.get('select[name="field_blog_series"] option').each($opt => {
        if (($opt[0].textContent).includes(blogSeries)) {
            cy.get('select[name="field_blog_series"]').select($opt[0].textContent);
            return;
        }
    })
});

Then('the promo image is matching the earlier selected image', () => {
    const expectedSrc = (imageSrc1.replace(/\?itok=[\S]+/, '')).replace(/^(.*?)\/public/, '');
    const extractedImageName = extractImgName(expectedSrc).replace(/\.jpg|\.jpeg|\.png/, '')

    cy.get('div.feature-card').find('img').then($el => {
        const source = $el[0].getAttribute('src');
        const actSrc = source.replace(/\?itok=[\S]+/, '').replace(/^(.*?)\/public/, '')
        expect(actSrc).to.include(extractedImageName.replaceAll('_', '-').replace('article', ''))
    })
});