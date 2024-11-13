/// <reference types="Cypress" />
import { And, Given } from 'cypress-cucumber-preprocessor/steps';
import { extractImgName } from "../../../../utils/extractImgName.js";

const siteSection = Cypress.env('test_site_section');
const randomStr = Cypress.env('randomStr');
const date = new Date();
const currYear = date.getFullYear();


And('user fills out {int} {string} text area with {string}', (position, sectionName, value) => {
    cy.get(`div[id*='field-article-body-${position-1}-item-wrapper']`).find('.ck-content[contenteditable=true]').eq(1).then(el => {
    const editor = el[0].ckeditorInstance
    editor.data.set(value)
});
})

And('the intro text reads {string}', (titlText) => {
    cy.get(`div[class='blog-intro-text'] p:contains("${titlText}")`).should('be.visible');
});

And('{int} section heading reads {string}', (num, title) => {
    cy.get(`h2[id^='article-heading'] p:contains('${title}')`).should('be.visible');
});

And('{int} description reads {string}', (contentText) => {
    cy.get(`p:contains('${contentText}')`).should('be.visible');
});

let imageSrc1;
And('user selects {int} Promotional Image from the list of images for featured content article', (num) => {
    cy.get('summary:contains("Promotional Image")').first().click()
    cy.get('input[name*="image_promotional_entity_browser_entity_browser"]').click({ force: true });
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check();
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true });
});

And('user remembers the source of selected promo image for further verification in the featured content article', () => {
    cy.get('div[id*="edit-field-image-promotional"] img').then($el => {
        imageSrc1 = $el[0].getAttribute('src').replace('.webp','')
    });
});

let imageSrc2;
And('user selects {int} Lead Image from the list of images', (num) => {
    cy.get('summary:contains("Lead Image")').click();
    cy.wait(1000);
    cy.get('input[name="field_image_article_entity_browser_entity_browser"]').click()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click()
});

And('user remembers the source of selected lead image for further verification in the featured content blog post', () => {
    cy.get('details img').then($el => {
        imageSrc2 = $el[0].getAttribute('src').replace('.webp','');
    });
});

And('user selects {string} from Blog Series dropdown', (blogSeries) => {
    cy.get('select[name="field_blog_series"] option').each($opt => {
        if (($opt[0].textContent).includes(blogSeries)) {
            cy.get('select[name="field_blog_series"]').select($opt[0].textContent);
            return;
        }
    })
});

And('the radio button {string} is selected by default under {string}', (btnType, field) => {
    cy.get(`div[id*="edit-attributes-data-align"]`).first().find(`input[id*="edit-attributes-data-align"]`).should('be.checked');
});


And('user enters {string} into content title search box and clicks {string}', (nameToSearch, applyBtn) => {
    cy.wait(2000)
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_embedded_content_browser').find(`input[id*="edit-title"]`).type(nameToSearch);
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_embedded_content_browser').find(`input[id*="edit-submit-cgov-content-browser"][value=${applyBtn}]`).click({ force: true });
    cy.wait(2000)
});

And('user selects {string} item from the content list', (title) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_embedded_content_browser').find(`input[name^="entity_browser_select"][type="checkbox"]`).check();
});

And('user clicks on {string} button to select content', (selectContent) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_embedded_content_browser').find(`input[id='edit-submit'][value='${selectContent}']`).click({ force: true });
});

And('user clicks on {string} button to select featured content', (embedButton) => {
    cy.get(`div.ui-dialog-buttonset.form-actions button:contains("${embedButton}")`).click({ force: true });
});

And('{string} dropdown has the following options', (labelText, dataTable) => {
    cy.get(`label[class*="js-form-required form-required"]:contains("${labelText}")`).should('be.visible');
    for (const { options } of dataTable.hashes()) {
        cy.get(`select[id*="edit-attributes-data-entity-embed-display"] option:contains("${options}")`).should('exist');
    }
});

And('{string} dropdown displays {string}', (labelText, displayOption) => {
    cy.get(`select[id*="edit-attributes-data-entity-embed-display"] option:contains("${displayOption}")`).should('have.attr', 'selected', 'selected');
});

And('{string} label has the following options', (labelText, dataTable) => {
    cy.get(`legend span:contains("${labelText}")`).should('be.visible');
    for (const { options } of dataTable.hashes()) {
        cy.get(`div[class*="fieldset__wrapper"] label:contains("${options}")`).should('be.visible');
    }
});

And('user selects {string} radio button under {string}', (alignPosition, labelText) => {
    cy.get(`div[class*="fieldset__wrapper"] input[value='${alignPosition}']`).click({ force: true });
});

And('user select {string} from the {string} dropdown', (selectItem, labelText) => {
    cy.get(`label[class*="js-form-required form-required"]:contains("${labelText}")`).should('be.visible');
    cy.get(`select[id*="edit-attributes-data-entity-embed-display"]`).select(selectItem);
});

And('{int} feature card displays the following features', (position, dataTable) => {
    for (let { alignment, title, link, description } of dataTable.hashes()) {
        cy.get(`div.feature-card`).eq(position - 1).as('card');
        if (link.includes("{YEAR}")) {
            link = link.replaceAll("{YEAR}", currYear);
        }
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace('{TEST_SITE_SECTION}', siteSection)
        }
        cy.get('@card').find(`a:contains("${title}")`).should('be.visible').and('have.attr', 'href').then(href => {
            expect(href).to.include(link);
        });
        cy.get('@card').parent().should('have.attr', 'class').and('include', alignment);
    }
});

And('{int} feature card displays the following', (position, dataTable) => {
    for (let { alignment, title, link, description } of dataTable.hashes()) {
        cy.get(`div.feature-card`).eq(position - 1).as('card');
        if (link.includes("{YEAR}")) {
            link = link.replaceAll("{YEAR}", currYear);
        }
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace('{TEST_SITE_SECTION}', siteSection)
        }
        cy.get('@card').find(`a:contains("${title}")`).should('be.visible').and('have.attr', 'href').then(href => {
            expect(href).to.include(link);
        });
        cy.get('@card').parent().should('have.attr', 'class').and('include', alignment);
        cy.get('@card').find(`p:contains("${description}")`).should('be.visible');
    }
});


Then('the promo image is matching the earlier selected promo image in the article to be used for embeddding', () => {
    const expectedSrc = (imageSrc1.replace(/\?itok=[\S]+/, '')).replace(/^(.*?)\/public/, '');
    const extractedImageName = extractImgName(expectedSrc).replace(/\.jpg|\.jpeg|\.png/, '')

    cy.get('div.feature-card').find('img').then($el => {
        const source = $el[0].getAttribute('src');
        const actSrc = source.replace(/\?itok=[\S]+/, '').replace(/^(.*?)\/public/, '')
        expect(actSrc).to.include(extractedImageName.replaceAll('_', '-').replace('article', ''))
    })
});

Then('the lead image is matching the earlier selected lead image in the blog post to be used for embeddding', () => {
    const expectedSrc = (imageSrc2.replace(/\?itok=[\S]+/, '')).replace(/^(.*?)\/public/, '');
    const extractedImageName = extractImgName(expectedSrc).replace(/\.jpg|\.jpeg|\.png/, '')

    cy.get('div.feature-card').find('img').then($el => {
        const source = $el[1].getAttribute('src');
        const actSrc = source.replace(/\?itok=[\S]+/, '').replace(/^(.*?)\/public/, '')
        expect(actSrc).to.include(extractedImageName.replaceAll('_', '-').replace('article', ''))
    })
});

And('{int} feature card does not display any image', (position) => {
    cy.get('div.feature-card').eq(position - 1).should('not.have.css', 'img');
});

And('user selects a checkbox next to title with url {string} under {string} from the list of content', (url, blogSeries) => {
    cy.get(`a[href='${blogSeries}/${currYear}/${url}-${randomStr}']`).parent().parent().find('input.form-checkbox').check();
});

And('user clicks {string} button {int} in the WYSIWYG editor', (featuredContentButton, position) => {
    cy.get(`button[data-cke-tooltip-text='Insert ${featuredContentButton}']`).eq(position-1).click({ force: true });
});