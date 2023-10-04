/// <reference types="Cypress" />
import { And, Given } from 'cypress-cucumber-preprocessor/steps';
import { extractImgName } from "../../utils/extractImgName.js";

const siteSection = Cypress.env('test_site_section');
const randomStr = Cypress.env('randomStr');
const frontEndBaseUrl = Cypress.env('front_end_base_url');

And('user clicks on sub tab {string}', (contentSubTab) => {
    cy.get(`a.admin-item__link:contains("${contentSubTab}")`).click({ force: true });
});

And('user clicks on {string} sub sub tab', (contentSubTab) => {
    cy.get(`a.tabs__link.js-tabs-link:contains("${contentSubTab}")`).click({ force: true });
});

And('{string} dropdown displays {string}', (labelText, displayOption) => {
    cy.get(`select[id*="edit-langcode-0-value"] option:contains("${displayOption}")`).should('have.attr', 'selected', 'selected');
});

And('user clicks on Source button in the WYSIWYG editor', () => {
    cy.get("button[data-cke-tooltip-text='Source']").click({ force: true });
});

And('user enters {string} into source text field', (value) => {
    cy.get('div.ck-source-editing-area').type(value);
});


And('user fills out {int} {string} text area with {string}', (position, sectionName, value) => {
    cy.wait(1500);
    cy.window().then(win => {
        win.Drupal.CKEditor5Instances.forEach(editor => {
            if (editor.sourceElement.id?.includes(`${position-1}-subform-field-body-section-content`)) {
                editor.setData(`<p>${value}</p>`)
            }
        })
    })
})
And('the content item with title {string} exists in the list of content', (titleText) => {
    cy.get('div.view-content tr').find(`a:contains('${titleText}')`).should('be.visible');
});

And('{string} dropdown displays {string}', (drodownName, option) => {
    cy.get(`select[id='edit-langcode-0-value']`).find(`option:contains('${option}')`).should('be.visible');
});

let imageSrc1;
And('user selects {int} Promotional Image from the list of images', (num) => {
    cy.get('summary:contains("Promotional Image")').first().click()
    cy.get('input[name="field_override_image_promotional_entity_browser_entity_browser"]').click({ force: true });
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check();
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true });
});

And('user remembers the source of selected promo image for further verification', () => {
    cy.get('div[id*="edit-field-override-image-promotional-current-items"] img').then($el => {
        imageSrc1 = $el[0].getAttribute('src');
    });
});


And('user clicks on {string} button to select image', (imgButton) => {
    cy.get(`summary[class*="claro-details__summary"]:contains('${imgButton}')`).click();
});

And('user clicks on {string} button {int} to select an image', (selectImgButton, position) => {
    cy.get(`input[value='${selectImgButton}']`).click();
});

And('user enters {string} into media title search box to search image and clicks {string}', (nameToSearch, applyBtn) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_image_carousel_image_browser').find(`input[id*="edit-name"]`).type(nameToSearch);
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_image_carousel_image_browser').find(`input[id*="edit-submit-cgov-image-media-browser"][value=${applyBtn}]`).click({ force: true });
});

And('user selects {string} item from the media list to select image', (imgTitle) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_image_carousel_image_browser').find(`input[name^="entity_browser_select"][type="checkbox"]`).check();
});

And('user clicks on {string} button to select an image', (selectImage) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_image_carousel_image_browser').find(`input[id="edit-submit"][value='${selectImage}']`).click({ force: true });
});

And('user enters {string} as {int} body section heading', (value, position) => {
    cy.wait(1500);
    cy.window().then(win => {
        win.Drupal.CKEditor5Instances.forEach(editor => {
            if (editor.sourceElement.id?.includes(`${position-1}-subform-field-body-section-heading`)) {
                editor.setData(`<p>${value}</p>`)
            }
        })
    })
})

And('user clicks {string} button {int} in the WYSIWYG editor', (featuredContentButton, position) => {
    cy.get(`button[data-cke-tooltip-text*="${featuredContentButton}"]`).eq(position - 1).click({ force: true });
});

And('user fills out {int} {string} text area with {string}', (position, sectionName, value) => {
    cy.getNthIframe("iframe[title='Rich Text Editor, Content field']", position - 1).find('p').type(value);
});

And('user enters {string} into content title search box and clicks {string}', (nameToSearch, applyBtn) => {
    cy.getIframeBody('iframe#entity_browser_iframe_block_content_browser').find(`input[id*="edit-info"]`).type(nameToSearch);
    cy.getIframeBody('iframe#entity_browser_iframe_block_content_browser').find(`input[id*="edit-submit-block-content-browser"][value=${applyBtn}]`).click({ force: true });
    cy.wait(2000)
});

And('user selects {string} item from the content list', (contentTitle) => {
    cy.getIframeBody('iframe#entity_browser_iframe_block_content_browser').find('input[name^="entity_browser_select"][type="checkbox"]').check();
});

And('user clicks on {string} button to select the media', (selectImage) => {
    cy.getIframeBody('iframe#entity_browser_iframe_block_content_browser').find(`input[id="edit-submit"][value='${selectImage}']`).click({ force: true });
});


And('{string} dropdown has the following options', (labelText, dataTable) => {
    cy.get(`label[class*="js-form-required form-required"]:contains("${labelText}")`).should('be.visible');
    for (const { options } of dataTable.hashes()) {
        cy.get(`select[id*="edit-attributes-data-entity-embed-display"] option:contains("${options}")`).should('exist');
    }
});

And('{string} dropdown is displayed {string}', (labelText, displayOption) => {
    cy.get(`select[id*="edit-attributes-data-entity-embed-display"] option:contains("${displayOption}")`).should('have.attr', 'selected', 'selected');
});

And('{string} label has the following options', (labelText, dataTable) => {
    cy.get(`legend span:contains("${labelText}")`).should('be.visible');
    for (const { options } of dataTable.hashes()) {
        cy.get(`div[class*="fieldset__wrapper"] label:contains("${options}")`).should('be.visible');
    }
});

And('the radio button {string} is selected by default under {string}', (btnType, field) => {
    cy.get(`div[id*="edit-attributes-data-align"]`).first().find(`input[id*="edit-attributes-data-align"]`).should('be.checked');
});

And('user clicks on {string} button to select the block', (embedButton) => {
    cy.get(`div.ui-dialog-buttonset.form-actions button:contains("${embedButton}")`).click({ force: true });
});

And('user clicks on {string} to add a body section', (option) => {
    cy.get('span.paragraph-type-label').first().click()
    cy.get(`input[value='${option}']`).click();
});

And('user select {string} from the {string} dropdown', (selectItem, labelText) => {
    cy.get(`label[class*="js-form-required form-required"]:contains("${labelText}")`).should('be.visible');
    cy.get(`select[id*="edit-attributes-data-entity-embed-display"]`).select(selectItem);
});

And('user selects {string} radio button under {string}', (alignPosition, labelText) => {
    cy.get(`div[class*="fieldset__wrapper"] input[value='${alignPosition}']`).click({ force: true });
});

Given('user is navigating to the front end site with path site section plus {string}', (purl) => {
    cy.visit(`${frontEndBaseUrl}${siteSection}/${purl}-${randomStr}`, { retryOnStatusCodeFailure: true }, { failOnStatusCode: false });
});

And('{int} section heading reads {string}', (num, title) => {
    cy.get(`h2[id^='article-heading'] p:contains('${title}')`).should('be.visible');
});

And('{int} description reads {string}', (contentText) => {
    cy.get(`p:contains('${contentText}')`).should('be.visible');
});

And('{int} feature card displays the following features in the content block', (position, dataTable) => {
    for (let { alignment, linkText, link, description } of dataTable.hashes()) {
        cy.get(`div#cgvBody section`).eq(position - 1).as('card');
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace('{TEST_SITE_SECTION}', siteSection)
        }
        cy.get('@card').find(`a:contains("${linkText}")`).should('be.visible').and('have.attr', 'href').then(href => {
            expect(href).to.include(link);
        });
        cy.get('@card').find(`p:contains("${description}")`).should('be.visible');
        cy.get('div#cgvBody section div').eq(position - 1).should('have.attr', 'class', alignment);
    }
});

And('{int} feature card displays the following features in external link block', (position, dataTable) => {
    for (let { alignment, linkText, link, description, descTitleText } of dataTable.hashes()) {
        cy.get(`div#cgvBody section`).eq(position - 1).as('card');
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace('{TEST_SITE_SECTION}', siteSection)
        }
        if (alignment !== 'embedded-entity align-center') {
            cy.get('@card').find(`a:contains("${linkText}")`).should('be.visible').and('have.attr', 'href').then(href => {
                expect(href).to.include(link);
            });
            cy.get('@card').find(`p:contains("${description}")`).should('be.visible');
            cy.get('div.feature-card').eq(position - 1).parent().should('have.attr', 'class').and('include', alignment);
        }
        else {
            cy.get('div#cgvBody section a').eq(position - 1).should('have.attr', 'href').then(href => {
                expect(href).to.include(link);
            });
            cy.get('div#cgvBody section').eq(position - 1).find('img').parent().should('have.attr', 'class').and('include', alignment);
        }
    }
});

And('{int} feature card does not display any image', (position) => {
    cy.get('div.feature-card').eq(position - 1).should('not.have.css', 'img');
});

And('user clicks on {string} from  dropdown button under {string}', (option, title) => {
    cy.get(`.dropbutton li a:contains("${option}")`).first().click({ force: true });
});

And('the Custom block item with title {string} does not exist in the list of Custom block library', (titleText) => {
    cy.get('div.view-content tr').find(`a:contains('${titleText}')`).should('not.exist');
});

And('the promo image in {int} feature card is matching the earlier selected promo image in the External Link Block used for embeddding', (position) => {
    const expectedSrc = (imageSrc1.replace(/\?itok=[\S]+/, '')).replace(/^(.*?)\/public/, '');
    const extractedImageName = extractImgName(expectedSrc).replace(/\.jpg|\.jpeg|\.png/, '')

    cy.get('div.feature-card').find('img').then($el => {
        const source = $el[0].getAttribute('src');
        const actSrc = source.replace(/\?itok=[\S]+/, '').replace(/^(.*?)\/public/, '')
        expect(actSrc).to.include(extractedImageName.replaceAll('_', '-').replace('article', ''))
    })
});

And('{int} image carousel displays the following features', (position, dataTable) => {
    for (let { alignment, title, caption, credit } of dataTable.hashes()) {
        cy.get('div#cgvBody div').eq(position - 1).should('have.attr', 'class', alignment);
        cy.get('div#cgvBody').find(`h4:contains("${title}")`).should('be.visible');
        cy.get('div.ic-caption').find(`p:contains("${caption}")`).should('be.visible');
        cy.get('div.ic-carousel').find(`div:contains("${credit}")`).should('be.visible');
    }
});

And('user fills out {string} text area in Raw HTML block with {string}', (field, value) => {
    cy.get('div.form-textarea-wrapper').find('textarea').first().type(value);
});

And('{int} block displays the following features', (position, dataTable) => {
    for (let { alignment, rawHTMLText } of dataTable.hashes()) {
        cy.get('div#cgvBody section').eq(position - 1).find(`div[class*='${alignment}']`).should('be.visible');
        cy.get('div#cgvBody section').eq(position - 1).find(`div:contains("${rawHTMLText}")`).should('be.visible');
    }
});

And('video carousel displays the following features', (dataTable) => {
    for (let { alignment, playListID, prevButton, nextButton, videoCarouselH4Title } of dataTable.hashes()) {
        cy.get('div#cgvBody').find(`div[class*='${alignment}']`).should('be.visible');
        cy.get(`div.yt-carousel[data-playlist-id='${playListID}']`).should('be.visible');
        cy.get(`div.row.yt-carousel-controls button[value='${prevButton}']`).should('be.visible');
        cy.get(`div.row.yt-carousel-controls button[value='${nextButton}']`).should('be.visible');
        cy.get('div.columns').find(`h4:contains("${videoCarouselH4Title}")`).should('be.visible');
    }
});

And('user enters {string} as intro text', (introTxt) => {
    cy.wait(1500);
    cy.window().then(win => {
        win.Drupal.CKEditor5Instances.forEach(editor => {
            if (editor.sourceElement.id?.includes('intro-text')) {
                editor.setData(`<p>${introTxt}</p>`)
            }
        })
    })

})

And('user focuses on paragraph header',()=>{
    cy.get('span.paragraph-type-label').first().click();
});
