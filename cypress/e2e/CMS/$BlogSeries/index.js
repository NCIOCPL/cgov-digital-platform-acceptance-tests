/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';
import { extractImgName } from "../../../utils/extractImgName.js";

const siteSection = Cypress.env('test_site_section');
const randomStr = Cypress.env('randomStr')
const frontEndBaseUrl = Cypress.env('front_end_base_url');

And('user clicks on title with url {string} under {string} from the list of content', (blogPost, blogSeries) => {
    const date = new Date();
    const currYear = date.getFullYear();
    cy.get(`a[href='${blogSeries}-${randomStr}/${currYear}/${blogPost}-${randomStr}']`).click();
});

Given('user is navigating to the blog {string} under {string}', (blogPost, blogSeries) => {
    const date = new Date();
    const currYear = date.getFullYear();
    cy.visit(`${frontEndBaseUrl}/${blogSeries}-${randomStr}/${currYear}/${blogPost}-${randomStr}`, { retryOnStatusCodeFailure: true });
});

And('the content item with url {string} does not exist in the list of content', (url) => {
    cy.get(`a[href='${siteSection}/${url}-${randomStr}']`).should('not.exist');
});


And('user enters {string} into the {string} text field', (value, textFieldLabel) => {
    cy.get(`[class*='form-item-field-banner-image-0-alt']:contains("${textFieldLabel}")`).find('input.form-text').type(value);
    cy.wait(2000);
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
    cy.get('summary:contains("Promotional Image")').first().click()
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
    cy.get(`div.admin-item a:contains("${contentSubTab}")`).click({ force: true });
});

And('user selects {string} option from Operations for {string}', (option, label) => {
    cy.get(`td:contains("${label}")`).parent().find(`a:contains("${option}")`).click({ force: true });
});

And('user selects {string} radio button under {string}', (option, label) => {
    cy.get(`#edit-field-owner-blog label:contains("${option}")`).first().click();
});

And('user checks {string} checkbox', (checkboxLbl) => {
    cy.get('fieldset#edit-field-blog-topics--wrapper input').parent().find(`label:contains("${checkboxLbl}")`).as('checkbox');
    cy.get('@checkbox').parent().find('input').check();
});

And('user enters {string} into {string} field', (description, descriptionTitle) => {
    cy.wait(1500);
    cy.window().then(win => {
        win.Drupal.CKEditor5Instances.forEach(editor => {
            if (editor.sourceElement.id?.includes(`edit-${descriptionTitle.toLowerCase()}`)) {
                editor.setData(`<p>${description}</p>`)
            }
        })
      })
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
    cy.get('summary:contains("Lead Image")').click();
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

const monthsEnglish = [
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

const monthsSpanish = [
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
    'deciembre'
];

And('the {string} section is displayed with the following cards', (featuredPostsSection, dataTable) => {
    for (const { title, linkEnding, expectedDate, author } of dataTable.hashes()) {
        cy.get(`a:contains("${title}")`).should('be.visible').and('have.attr', 'href');
        cy.get(`a:contains("${title}")`).invoke('attr', 'href').then(href => {
            expect(href).to.include(linkEnding);
        });
        let months = [];
        if (featuredPostsSection == 'Featured Posts') {
            months = monthsEnglish
        }
        else if (featuredPostsSection == 'Spanish Featured Posts') {
            months = monthsSpanish
        }
        const date = new Date();
        const year = date.getFullYear();
        const month = months[date.getMonth()];
        const day = date.getDate();
        const todayDate = `${month} ${day}, ${year}`;
        cy.get(`div.byline p:contains("${todayDate}")`).should('be.visible');
        cy.get(`p:contains("${author}")`).should('be.visible');
    }
});

Then('list of {string} has the following posts', (blogPost, dataTable) => {
    for (let { title, url, expectedDate, author } of dataTable.hashes()) {
        cy.get(`a:contains("${title}")`).should('be.visible').and('have.attr', 'href');
        if (url.includes("{TEST_SITE_SECTION}")) {
            url = url.replace("{TEST_SITE_SECTION}", siteSection)
        }
        if (url.includes("{RANDOM}")) {
            url = url.replaceAll("{RANDOM}", randomStr);
        }
        const date1 = new Date();
        const currYear = date1.getFullYear();
        if (url.includes("{YEAR}")) {
            url = url.replace("{YEAR}", currYear);
        }
        cy.get(`a:contains("${title}")`).should('be.visible').and('have.attr', 'href', url);
        let months = [];
        let todayDate;
        if (blogPost == 'blog post') {
            months = monthsEnglish
        }
        else if (blogPost == 'Spanish blog post') {
            months = monthsSpanish
        }
        const date = new Date();
        const year = date.getFullYear();
        const month = months[date.getMonth()];
        const day = date.getDate();
        if (blogPost == 'blog post') {
            todayDate = `${month} ${day}, ${year}`
        }
        else if (blogPost == 'Spanish blog post') {
            todayDate = `${day} de ${month} de ${year}`;
        }
        cy.get(`div.date-author time:contains("${todayDate}")`).should('be.visible');
        cy.get('div.date-author').should('include.text', author);
    }
});

And('the promotional image is matching the earlier selected image', () => {
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
            linkHref = linkHref.replaceAll("{RANDOM}", randomStr);
        }
        cy.get(`p a[href='${linkHref}']`).should('be.visible').and('have.text', linkName);
    }
});

And('the {string} link appears with the following href', (testBlogTopic, dataTable) => {
    for (let { linkName, linkHref } of dataTable.hashes()) {
        if (linkHref.includes("{TEST_SITE_SECTION}")) {
            linkHref = linkHref.replace("{TEST_SITE_SECTION}", siteSection);
        }
        if (linkHref.includes("{RANDOM}")) {
            linkHref = linkHref.replaceAll("{RANDOM}", randomStr);
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
    cy.get(`a.menu-item__link:contains("${termName}")`).parent().parent().parent().parent().find(`li.delete.dropbutton-action a:contains("${deleteBtn}")`).click({ force: true });
});

And('user clicks on {string} button to select the item', (selectContent) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_content_browser').find(`input[id='edit-submit'][value='${selectContent}']`).click({ force: true });
});

let imageSrc2;
And('user selects {int} Promotional Image from the list of images to be displayed in mini landing pages', (num) => {
    cy.get('summary:contains("Promotional Image")').first().click()
    cy.get('input[name="field_image_promotional_entity_browser_entity_browser"]').click({ force: true })
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true })
});

And('user remembers the source of selected promotional image to be displayed in mini landing pages for further verification', () => {
    cy.get('div[id*="edit-field-image-promotional"] img').then($el => {
        imageSrc2 = $el[0].getAttribute('src')
    });
});

Then('the promo image is matching the earlier selected image', () => {
    const expectedSrc = (imageSrc2.replace(/\?itok=[\S]+/, '')).replace(/^(.*?)\/public/, '');
    const extractedImageName = extractImgName(expectedSrc).replace(/\.jpg|\.jpeg|\.png/, '')

    cy.get('div.feature-card').find('img').then($el => {
        const source = $el[0].getAttribute('src');
        const actSrc = source.replace(/\?itok=[\S]+/, '').replace(/^(.*?)\/public/, '')
        expect(actSrc).to.include(extractedImageName.replaceAll('_', '-').replace('article', ''))
    });
});

And('{string} label is displayed with value {int}', (label, num) => {
    cy.get(`div[class*="js-form-item"] label:contains("${label}")`)
        .parent().find('input').should('have.attr', 'value', num)
});

And('{string} dropdown has the following options', (dropdown, dataTable) => {
    cy.get(`div[class*="js-form-item"] label:contains("${dropdown}")`).should('be.visible')
    for (const { options } of dataTable.hashes()) {
        cy.get(`option:contains("${options}")`).should('be.visible');
    }
});

And('{string} text field label is displayed', (fieldLabel) => {
    cy.get(`div[class*="form-type-textfield"] label:contains("${fieldLabel}")`).should('be.visible');
});

And('{string} button is displayed', (button) => {
    cy.get(`summary[role='button']:contains("${button}")`).should('be.visible')
});

And('the following posts are displayed with remove button translated as {string}', (removeBtn, dataTable) => {
    for (let { posts } of dataTable.hashes()) {
        cy.get(`div[class*='form-wrapper']:contains("${posts}")`).each($el => {
            cy.wrap($el).parent().find(`input[value = "${removeBtn}"]`).should('be.visible');
        })
    }
});

And('{string} label is displayed with the text {string}', (label, text) => {
    cy.get(`div[class*="js-form-item"] label:contains("${label}")`)
        .parent().find('input').should('have.attr', 'value', text)
});

And('the translated banner image is displayed', () => {
    cy.get('div[class*="image-preview"]').find('img').should('be.visible');
})

And('the link with the name {string} is displayed with remove button translated as {string}', (linkTitle, button) => {
    linkTitle = linkTitle.substring(0, linkTitle.length - 4)
    cy.get(`a:contains("${linkTitle}")`).parent().parent().find('input').should('have.attr', 'value', button)
})

And('{string} button is displayed with remove button translated as {string}', (promotionalButton, translatedButton) => {
    cy.get(`summary:contains(${promotionalButton})`).should('be.visible')
    cy.get('div[class*="item-container"]').find('input').should('have.attr', 'value', translatedButton)
})

And('the {string} link appears with href {string}', (link, href) => {
    cy.get(`span:contains(${link})`).parent().should('have.attr', 'href', href)
});

And('the banner image is matching the earlier selected image', () => {
    cy.get('div[class*="body-banner"').find('img').should('have.attr', 'src').then(src => {
        expect(src).to.include('heroimagenewsdesktop')
    })
});

And('description reads {string}', (desc) => {
    cy.get(`p:contains('${desc}')`).should('be.visible');
});

And('Author was translated as {string}', (text) => {
    cy.get(`div[class*="js-form-item"] label:contains("${text}")`).should('be.visible')
});

And('body was translated as {string}', (text) => {
    cy.get(`div[class*="js-form-item"] label:contains("${text}")`).should('be.visible')
});

