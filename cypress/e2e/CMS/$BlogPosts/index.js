/// <reference types="Cypress" />
import { And, Given } from 'cypress-cucumber-preprocessor/steps';
import { extractImgName } from "../../../utils/extractImgName.js";
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

const siteSection = Cypress.env('test_site_section');
const randomStr = Cypress.env('randomStr');
const date = new Date();
const currYear = date.getFullYear();
const month = months[date.getMonth()];
const day = date.getDate();
const frontEndBaseUrl = Cypress.env('front_end_base_url');



And('user enters {string} as intro text', (introText) => {
    cy.getIframeBody("iframe[title='Rich Text Editor, Intro Text field']").find('p').type(introText);
});

And('user fills out {string} text area with {string}', (textFieldLabel, value) => {
    cy.getIframeBody("iframe[title='Rich Text Editor, Body field']").find('p').type(value);
});

let imageSrc;
And('user selects {int} Lead Image from the list of images', (num) => {
    cy.get('summary:contains("Lead Image")').click();
    cy.wait(1000);
    cy.get('input[name="field_image_article_entity_browser_entity_browser"]').click()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click()
});

let imageSrc1;
And('user selects {int} Promotional Image from the list of images', (num) => {
    cy.get('summary:contains("Promotional Image")').first().click()
    cy.get('input[name="field_image_promotional_entity_browser_entity_browser"]').click()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click()
});

And('user remembers the source of selected lead image for further verification', () => {
    cy.get('details img').then($el => {
        imageSrc = $el[0].getAttribute('src').replace('.webp','')
    });
});

And('user remembers the source of selected promo image for further verification', () => {
    cy.get('details img').eq(1).then($el => {
        imageSrc1 = $el[0].getAttribute('src').replace('.webp','')
    });
});

And('user selects {string} from {string}', (includeSearchText, fieldLabel) => {
    cy.get(`label:contains('${fieldLabel}')`).parent().find('select').select(includeSearchText);
});

Given('user is navigating to the blog {string} under {string}', (blogPost, blogSeries) => {

    cy.visit(`${frontEndBaseUrl}/${blogSeries}/${currYear}/${blogPost}-${randomStr}`, { retryOnStatusCodeFailure: true });
    cy.wait(200);
});


And(`blog's posted date is today's date`, () => {

    const expectedDate = `${month} ${day}, ${currYear}`;
    cy.get('p>time').should('include.text', expectedDate);
});

And('the {string} button appears', (subscribeLink) => {
    cy.get('div.subscribeRSS').find('span').should('be.visible').and('contain.text', subscribeLink);
});

And('the {string} managed list appears', (featuredPosts) => {
    cy.get('div.managed.list.with-date').find('h2').should('be.visible').and('include.text', featuredPosts);
});

And('the {string} managed list appears without a date', (categories) => {
    const expectedDate = `${month} ${day}, ${currYear}`;
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
    cy.get(`a[href='${blogSeries}/${currYear}/${blogPost}-${randomStr}']`).click();
});

And('user clicks on dropdown button toggle {int} to view all Related Resources types', (pos) => {
    cy.get('.dropbutton-toggle button').eq(pos - 1).click({ force: true });
});


And('user clicks on dropdown button toggle {int} to view all Recommended Content types', (pos) => {
    cy.get('.dropbutton-toggle button').eq(pos - 1).click({ force: true });
});

And('user selects {string} from Recommended Content dropdwon', (resourceType) => {
    cy.get(`input[value='${resourceType}']`).click({ force: true });
});

And('user clicks on {string} button to link to Recommended Content types', (link) => {
    cy.get(`summary[role='button']:contains('${link}')`).click({ force: true });
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
        const replacedTestSiteSection = link1.replace("{TEST_SITE_SECTION}", siteSection);
        cy.get(`a[href*="${replacedTestSiteSection}"]`).first().should('have.text', title1);
    }
});

Then('Recommended Content section contains the following links', (dataTable) => {
    for (let { title, link } of dataTable.hashes()) {
        link = link.replace("{TEST_SITE_SECTION}", siteSection);
        cy.get(`a[href*="${link}"]`).should('include.text', title)
    }
});

And('user selects a checkbox next to title with url {string} under {string} from the list of content', (url, blogSeries) => {
    cy.get(`a[href='${blogSeries}/${currYear}/${url}-${randomStr}']`).parent().parent().find('input.form-checkbox').check();
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

/*----------- Translation of Blog Post -------------*/
And('Author was translated as {string}', (authorTranslated) => {
    cy.get(`label:contains("${authorTranslated}")`).should('be.visible')
})

And('{string} label is displayed', (introTextLabel) => {
    cy.get(`label:contains("${introTextLabel}")`).should('be.visible')
})

And('body was translated as {string}', (bodyTranslated) => {
    cy.get(`div[class*='item-body'] label:contains("${bodyTranslated}")`).should('be.visible')
})

And('{string} button is displayed', (imageDisplay) => {
    cy.get(`summary[role='button']:contains("${imageDisplay}")`).should('be.visible')
})

And('the following fields are displayed under {string} label', (titleText, dataTable) => {
    const baseUrlFromConfig = Cypress.config("baseUrl");
    cy.get("legend.fieldset__legend span").should('include.text', titleText).and('be.visible')
    for (const { blogTopic } of dataTable.hashes()) {
        if (baseUrlFromConfig.includes('cms') && blogTopic.includes('')) {
            cy.get("div[id*='cgov-edit-blog-topics-wrapper'] label:contains('Exámenes de detección y la detección temprana')").should('be.visible')

        } else {
            cy.get(`div[id*='cgov-edit-blog-topics-wrapper'] label:contains('${blogTopic}')`).should('be.visible')
        }
    }
})

And('Link section under related resources was translated as {string}', (TranslatedLabel) => {
    cy.get(`span:contains("${TranslatedLabel}")`).should('be.visible')
})

And('{string} label is displayed in the page', (contentLabel) => {
    cy.get(`h4:contains("${contentLabel}")`).should('be.visible')
})

And('Link section under recommended content is displayed as {string}', (LinkSection) => {
    cy.get(`summary.claro-details__summary:contains("${LinkSection}")`).should('be.visible')
})

And('dropdown to add link under recommended content was translated to start with {string}', (dropDownTranslated) => {
    cy.get(`input[value^='${dropDownTranslated}']`).should('be.visible')
})

And('{string} dropdown has the following options', (PbText, dataTable) => {
    cy.get(`div[id*='use-wrapper'] label:contains("${PbText}")`).should('be.visible')
    for (const { options } of dataTable.hashes()) {
        cy.get(`select[id*='edit-field-public-use'] option:contains("${options}")`).should('be.visible')
    }
})

And('{string} label is displayed under search Engine', (DtDisplay) => {
    cy.get(`div[id*='posted-wrapper'] h4:contains("${DtDisplay}")`).should('be.visible')
})

Given('user is navigating to the blog {string} under {string}', (blogPost, blogSeries) => {
    cy.visit(`${frontEndBaseUrl}${blogPost}${siteSection}${blogSeries}-${randomStr}`, { retryOnStatusCodeFailure: true })
})

And(`espanol blog's posted date is today's date`, () => {
    const esMonths = [
        'enero',
        'febrero',
        'marzo',
        'abril',
        'mayo',
        'junio',
        'julio',
        'agosto',
        'septiembre',
        'octubre',
        'noviembre',
        'diciembre'
    ];
    const esMonth = esMonths[date.getMonth()];
    const expectedDate = `${day} de ${esMonth} de ${currYear}`;
    cy.get('p>time').should(($date) => {
        const text = $date.text()
        expect(text.toLowerCase()).to.include(expectedDate)
    })
})

And('user clicks on title with url spanish path {string} plus {string}', (spPath, purl) => {
    cy.get(`a[href='${spPath}/${purl}-${randomStr}']`).click();
})

Given('user is navigating to the front end site with spanish path {string} plus {string}', (spPath, title) => {
    cy.visit(`${frontEndBaseUrl}${spPath}/${title}-${randomStr}`, { retryOnStatusCodeFailure: true });
})



