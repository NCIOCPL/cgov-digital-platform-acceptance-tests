/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';
import { extractImgName } from "../../../utils/extractImgName.js";
import { enrichUrl } from "../../../utils/enrichUrl";

const siteSection = Cypress.env('test_site_section');
const frontEndBaseUrl = Cypress.env('front_end_base_url');
const randomStr = Cypress.env('randomStr')


And('user selects {string} from {string} dropdown', (dropDown, cartOption) => {
    cy.get(`.placeholder:contains("${cartOption}")`).parent().find(`input[value="${dropDown}"]`).click({ force: true });
})

And('user clicks on {string} link in the {string} text area', (title, cartOption) => {
    cy.get(`div.paragraph-type-title:contains('${cartOption}')`).parent().parent().find(`span:contains('${title}')`).parent().click({ force: true });
})

And('user clicks on {string} link in the {string} text area within {string} section', (title, cartOption, multimediaRow) => {
    cy.get(`div:contains("${multimediaRow}")`).parent().parent().find(`div:contains("${cartOption}")`).parent().find(`span:contains('${title}')`).eq(0).click({ force: true })
})

And('user clicks on {string} link in the {string} text area within {string} section for {string}', (link, textArea, subSection, section) => {
    cy.get(`div[class*="paragraph-type-title"]:contains("${section}")`).parent().parent().find(`div:contains("${subSection}")`).parent().parent().find(`div:contains("${textArea}")`).parent().find(`span:contains('${link}')`).eq(0).click({ force: true })
})

And('user clicks on {string} link in the {string} text area within {string} section for {string}', (title, cartOption, subSection, section) => {
    cy.get(`div:contains("${subSection}")`).parent().parent().find(`div:contains("${cartOption}")`).parent().find(`span:contains('${title}')`).eq(0).click({ force: true })
})

And('user selects {string} from {string} dropdown {string} section for {string}', (dropDValue, dropdownLbl, subSection, section) => {
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

And('user clicks on {string} button', (content) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`input[value='${content}']`).eq(0).click({ force: true });
});

And('user selects {int} item from the media list', (num) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find('input.form-checkbox').eq(num - 1).check();
});

let mediaTextBack;
And('user remembers the name of media card item for future verification', () => {
    cy.get('div[id*="mm-media-item"] div[class*="field--name"] div.field__item').eq(0).then($el => {
        mediaTextBack = $el[0].innerText;
    });
});

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
    cy.get("input[name*='[field_source_view][0][options][limit]").clear()
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

let imageSrc2;
And('user selects {int} Promotional Image from the list of images to be displayed in mini landing pages', (num) => {
    cy.get('span:contains("Promotional Image")').parent().first().click()
    cy.get('input[name="field_image_promotional_entity_browser_entity_browser"]').click({ force: true })
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true })
});

And('user remembers the source of selected promotional image to be displayed in mini landing pages for further verification', () => {
    cy.get('div[id*="edit-field-image-promotional"] img').then($el => {
        imageSrc2 = $el[0].getAttribute('src')
    });
});

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
    for (let { fieldLabel, value, field_name } of dataTable.hashes()) {
        cy.get(`div:contains("${option}")`).should('be.visible')
        cy.get(`input[name^='${field_name}']`).as('inputField').parent().find('label').should('include.text', fieldLabel);
        cy.get('@inputField').type(value);

    }
});
And('user clicks on {string} button item in the {string} text area', (selectContentBtn, section) => {
    cy.get(`div[id*="top-paragraph-type-title"]:contains("${section}")`).parent().parent().find(`input[value="${selectContentBtn}"]`).click()
});

And('primary feature card row displays the following cards', (dataTable) => {
    for (let { title, link } of dataTable.hashes()) {
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace('{TEST_SITE_SECTION}', siteSection)
            cy.get(`div.row.feature-primary a:contains("${title}")`).should('be.visible').and('have.attr', 'href').then(href => {
                expect(href).to.include(link)
            })
        }
    }
});

And('{int} primary feature card has text {string}', (cardNum, cardText) => {
    cy.get('div.row.feature-primary').find('div.slot-item').eq(cardNum - 1).should('include.text', cardText);
});

And('guide card row title is {string}', (cardTitle) => {
    cy.get(`div.guide-title`).find(`h2:contains("${cardTitle}")`).should('be.visible');
});

And('guide card row displays the following cards', (dataTable) => {
    for (let { title, link } of dataTable.hashes()) {
        cy.get(`div.row.guide-card h2:contains("${title}")`).should('be.visible');
        cy.get('div.row.guide-card ul').find(`a[href='${link}']`).should('be.visible');
    }
});

And('{int} guide card has text {string}', (cardNum, cardText) => {
    cy.get('div.row.guide-card').find('div.slot-item').eq(cardNum - 1).should('include.text', cardText);
});

And('secondary feature card row displays the following cards', (dataTable) => {
    for (let { title, link } of dataTable.hashes()) {
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace('{TEST_SITE_SECTION}', siteSection)
            cy.get(`div.row.feature-secondary a[href*='${link}']`).should('be.visible').and('include.text', title);
        }
    }
});

And('multimedia card row has a video which name matches selected multimedia card item', () => {
    cy.get('div.multimedia-feature-card figure').then($el => {
        const mediaTextFront = $el[0].innerText;
        expect(mediaTextFront).to.equal(mediaTextBack);
    });
});

And('multimedia card row displays the following cards', (dataTable) => {
    for (let { title, link } of dataTable.hashes()) {
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace('{TEST_SITE_SECTION}', siteSection)
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
            link = link.replace('{TEST_SITE_SECTION}', siteSection)
            cy.get(`div.managed.list a[href*='${link}']`).should('be.visible').and('include.text', title);
            cy.get('div.managed.list').find('div.description').should('be.visible').and('include.text', description);
        }
    }
});

And('one-column card row title is {string}', (cardTitle) => {
    cy.get(`div.row.paragraph-col-one`).find(`h3:contains("${cardTitle}")`).should('be.visible');
});

And('one-column content displays text {string}', (contentText) => {
    cy.get(`div.row.paragraph-col-one`).find(`p:contains("${contentText}")`).should('be.visible');
});

And('one-column list has the following links', (dataTable) => {
    for (let { title, link, description } of dataTable.hashes()) {
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace('{TEST_SITE_SECTION}', siteSection)
            cy.get(`div.row.paragraph-col-one a[href*='${link}']`).should('be.visible').and('include.text', title);
            cy.get('div.row.paragraph-col-one').find('div.description').should('be.visible').and('include.text', description);
        }
    }
});

And('one-column list has raw html displaying {string}', (contentText) => {
    cy.get('div.row.paragraph-col-one').find(`p:contains("${contentText}")`).should('be.visible');
});

And('two-column list has raw html displaying {string}', (contentText) => {
    cy.get('div.rawHtml').find(`p:contains("${contentText}")`).should('be.visible');
});

And('two-column content heading reads {string}', (contentHeading) => {
    cy.get('div.row.news').should('include.text', contentHeading);
});

And('two-column html content reads {string}', (contentText) => {
    cy.get('div.row.news').find(`p:contains("${contentText}")`).should('be.visible');
});

And('two-column dynamic list shows {string}', (pressReleases) => {
    cy.get('div.dynamic.list').find(`div:contains("${pressReleases}")`).should('be.visible');
});

And('dynamic lists shows {int} items', (itemCount) => {
    cy.get('div.dynamic.list').find('li.list-item').should('have.length', itemCount);
});

And('borderless card title is {string}', (title) => {
    cy.get('div.borderless-text-container').find(`h2:contains("${title}")`).should('be.visible');
});

And('borderless card long description is {string}', (longDesc) => {
    cy.get('div.borderless-text-container').find(`p:contains("${longDesc}")`).should('be.visible');
});

And('borderless card button has title text {string} and links to {string}', (title, link) => {
    if (link.includes("{TEST_SITE_SECTION}")) {
        link = link.replace("{TEST_SITE_SECTION}", siteSection);
        cy.get(`div.centered-container a[href*='${link}']`).should('be.visible').and('include.text', title);
    }
});

And('title first feature card row has the following cards', (dataTable) => {
    for (let { title, link } of dataTable.hashes()) {
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace("{TEST_SITE_SECTION}", siteSection);
            cy.get(`div.title-first-feature-card-container a[href*='${link}']`).should('be.visible').and('include.text', title);
        }
    }
});

And('user removes multimedia card', () => {
    cy.get('#edit-field-landing-contents-3-subform-field-mm-media-item-current-items-0-remove-button').click({ force: true });
});

let imageSrc;
And('user selects {int} Promotional Image from the list of images for mini landing page', (num) => {
    cy.get('span:contains("Promotional Image")').parent().as('imageUpload').click()
    cy.get('input[name="field_image_promotional_entity_browser_entity_browser"]').click({ force: true })
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true })
});
And('user remembers the source of selected promo image for further verification for mini landing page', () => {
    cy.get('details img').then($el => {
        imageSrc = $el[0].getAttribute('src');
    });
});

And('user selects {string} content item', (dropDown) => {
    cy.get(`input[value='${dropDown}']`).click({ force: true });
});

And('user clicks on {string} link in the Internal Feature Card text area under Primary Feature Card Row', (featuredLink) => {
    cy.get(`div[id*="edit-field-landing-contents-9-subform-field-row-cards-0-subform-field-featured-item"] span:contains('${featuredLink}')`).click({ force: true });
});

And('user enters {string} into Content Heading text field', (value) => {
    cy.get("input[name^='field_landing_contents[0][subform][field_content_heading]']").type(value);
});

And('last feature card row displays the following cards', (dataTable) => {
    for (let { title, link, featureCardDescription } of dataTable.hashes()) {
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace('{TEST_SITE_SECTION}', siteSection)
            cy.get(`div.feature-card a:contains("${title}")`).should('be.visible').and('have.attr', 'href').then(href => {
                expect(href).to.include(link)
            })
        }
        cy.get(`div.feature-card p:contains("${featureCardDescription}")`).should('be.visible');
    }
});

When('user clicks on the {string} button', (deleteBtn) => {
    cy.get(`input[id='edit-submit'][value='${deleteBtn}']`).click({ force: true });
});

And('user clicks on the {string} button to select item', (title) => {
    cy.getIframeBody('iframe[name="entity_browser_iframe_cgov_content_browser"]').find(`input[value="${title}"]`).click({ force: true });
});

And('the {string} had been selected', (title) => {
    cy.get(`div.seven-details__wrapper`).find(`div[id*=edit-field-landing-contents-9-subform-field-row-cards-0-subform-field-featured-item-current-item]:contains('${title}')`).should('be.visible');
});

And('user clicks on the {string} link in {string} text area', (title, cardOption) => {
    cy.get(`div[id*="field-landing-contents-9-subform-field-row-cards-0-item"]`).find(`summary.seven-details__summary span:contains('${title}')`).click({ force: true });
});

And('user clicks on {string} button item {int}', (content, index) => {
    cy.get(`input[value='${content}']`).eq(index - 1).click({ force: true })
});

And('user selects {string} item from the list', (title) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_content_browser').find(`td:contains(${title})`).first().parent().find('input').click({ force: true });
})

Then('the promo image is matching the earlier selected image', () => {
    const expectedSrc = (imageSrc2.replace(/\?itok=[\S]+/, '')).replace(/^(.*?)\/public/, '');
    const extractedImageName = extractImgName(expectedSrc).replace(/\.jpg|\.jpeg|\.png/, '')

    cy.get('div.feature-card').find('img').then($el => {
        const source = $el[0].getAttribute('src');
        const actSrc = source.replace(/\?itok=[\S]+/, '').replace(/^(.*?)\/public/, '')
        expect(actSrc).to.include(extractedImageName.replaceAll('_', '-').replace('article', ''))
    })
});
//-- Translation of Home and Landing Page -- //

And('the following images are displayed with remove button translated as {string}', (removeBtn, dataTable) => {
    for (let { image } of dataTable.hashes()) {
        cy.get(`div[class*="image-widget-data"] a:contains("${image}")`).each($el => {
            cy.get(`input[value = "${removeBtn}"]`).should('be.visible');
        });
    }
});

And('the {string} button is displayed beside the text {string}', (removeBtn, text) => {
    cy.get(`div#edit-field-hero-banner-0-top:contains("${text}")`).find(`input[id="edit-field-hero-banner-0-top-links-remove-button"][value="${removeBtn}"]`).should('be.visible');
});

And(`Alternative text field was translated as {string}`, (altText) => {
    cy.get(`label[for*="edit-field-hero-banner-0-subform-field-desktop-hero-0-alt"]:contains("${altText}")`).should('be.visible');
});

And('the following sections have title field translated as {string}', (spPath, dataTable) => {
    for (const { section } of dataTable.hashes()) {
        cy.get(`div[class*='main-canvas'] div:contains("${section}")`).parent().find(`div[class*='contents-9-subform-field-'] label:contains("${spPath}")`).should('be.visible')
    }
})

And('dynamic lists shows {int} items espanol link', (num) => {
    cy.get("li[class*='item general list-item t'] a").should('have.length', num)
})

And('user clicks on title with url spanish path {string} site section plus {string}', (spPath, purl) => {
    cy.get(`a[href='${spPath}${siteSection}/${purl}-${randomStr}']`).click();
});

And('list row card title is {string}', (listTitleSpPath) => {
    cy.get('div[class="dynamic list"] h2').should('be.visible').and('have.text', listTitleSpPath)
})

And('every link in dynamic list starts with {string}', (espanolPath) => {
    cy.get("div[class='dynamic list'] a").invoke('attr', 'href').then((linkHref) => {
        expect(linkHref.startsWith(espanolPath)).to.be.true;
    })
})

And('user clicks {string} button for adding hero image', (imageBtn) => {
    cy.get(`div.paragraphs-dropbutton-wrapper`).find(`input[value="${imageBtn}"]`).click({ force: true });
});

And('user uploads test file {string} as {string} version', (fileName, mode) => {
    if (mode == 'desktop') {
        cy.fixture(fileName, { encoding: null }).as('fixture')
        cy.get('input[type="file"]').first().selectFile('@fixture');
        cy.wait(2000);
        cy.get(`input[id*="edit-field-hero-banner-0-subform-field-${mode}-hero-0-alt"]`).type("Alt Text")
    }
    if (mode == 'tablet') {
        cy.fixture(fileName, { encoding: null }).as('fixture')
        cy.get('input[type="file"]').first().selectFile('@fixture');
        cy.wait(2000);
        cy.get(`input[id*="edit-field-hero-banner-0-subform-field-${mode}-hero-0-alt"]`).type("Alt Text")
    }
    if (mode == 'mobile') {
        cy.fixture(fileName, { encoding: null }).as('fixture')
        cy.get('input[type="file"]').first().selectFile('@fixture');
        cy.wait(2000);
        cy.get(`input[id*="edit-field-hero-banner-0-subform-field-${mode}-hero-0-alt"]`).type("Alt Text")
    }
});

And('user enters {string} into {string} text field in home and landing page', (tagLineText, field) => {
    cy.get(`input[id*="edit-field-hero-banner-0-subform-field-tagline-0-value"]`).type(tagLineText);
});

And('the banner image with the name {string} is displayed at {string} breakpoint', (imageName, mode) => {
    if (mode == 'tablet') {
        cy.get('div#nvcgSlHeroHeader source[media="(max-width: 1024px) and (min-width: 641px)"]').should('have.attr', 'srcset').and('include', imageName);
    }
    if (mode == 'desktop') {
        cy.get('div#nvcgSlHeroHeader img').should('have.attr', 'src').and('include', imageName);
    }
});

And('{string} text is displayed at {string} breakpoint', (fieldText, mode) => {
    cy.get('div#nvcgSlHeroHeader').find(`p:contains("${fieldText}")`).should('be.visible');
});