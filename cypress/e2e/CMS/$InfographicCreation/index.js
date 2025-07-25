/// <reference types="Cypress" />
import { And, When } from 'cypress-cucumber-preprocessor/steps';
import { extractImgName } from "../../../utils/extractImgName.js";
import { getBaseDirectory } from '../../../utils';

const siteSection = Cypress.env('test_site_section');
const randomStr = Cypress.env('randomStr');
const frontEndBaseUrl = Cypress.env('front_end_base_url');


const baseUrl = Cypress.config('baseUrl');


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
    cy.get('.ck-content[contenteditable=true]').eq(1).then(el => {
        const editor = el[0].ckeditorInstance
        editor.data.set(value)
    });
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
    cy.get('summary:contains("Promotional Image")').first().click()
    cy.get('input[name="field_image_promotional_entity_browser_entity_browser"]').click()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click()
});

And('user remembers the source of selected promotional image to be displayed in home and landing pages for further verification', () => {
    cy.get('div[id*="edit-field-image-promotional"] img').then($el => {
        imageSrc1 = $el[0].getAttribute('src').replace('.webp','');
    });
});

And('user selects {string} checkbox', (dateDisplay) => {
    cy.get(`div#edit-field-date-display-mode label:contains("${dateDisplay}")`).parent().find('input.form-checkbox').check({ force: true })
})

And('the radio button {string} is selected by default under {string}', (btnType, field) => {
    cy.get(`div[id*="edit-attributes-data-align"]`).first().find(`input[id*="edit-attributes-data-align"]`).should('be.checked');
});

And('user removes the {string} item from the list', (link) => {
    cy.get(`input[name*="field_landing_contents_1_subform_field_list_items_0_remove"]`).click({force:true});
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
    cy.get('div.cgdp-document-dates li').as('dateStamp').find('strong').should('have.text', dateToday);
    cy.get('@dateStamp').find('time').should('include.text', expectedDate);
});

And('date label is displaying as {string}', (labelText) => {
    cy.get('div.cgdp-document-dates li').as('dateStamp').find('strong').should('have.text', labelText);
});

And('the infographic link {string} does not appear', (linkText) => {
    cy.get(`div.infographic-link-container:contains("${linkText}")`).find('a.infographic-link').should('not.be.visible');
});

And('the image has name {string}', (imageName) => {
    cy.get('div.centered-element source[media="(max-width: 768px)"]').should('have.attr', 'srcset').and('include', imageName);
});

And('user enters {string} as {int} body section heading', (value, position) => {
    cy.get(`div[id*='field-article-body-${position-1}-item-wrapper']`).find('.ck-content[contenteditable=true]').eq(0).then(el => {
        const editor = el[0].ckeditorInstance
        editor.data.set(value)
    });
})

And('user fills out {int} {string} text area with {string}', (position, sectionName, value) => {
    cy.get(`div[id*='field-article-body-${position-1}-item-wrapper']`).find('.ck-content[contenteditable=true]').eq(1).then(el => {
        const editor = el[0].ckeditorInstance
        editor.data.set(value)
    });
});

And('user fills out {string} text area with {string}', (textFieldLabel, value) => {
    cy.get('.ck-content[contenteditable=true]').then(el => {
        const editor = el[0].ckeditorInstance
        editor.data.set(value)
    });
})

And('user enters {string} into media title search box and clicks {string}', (nameToSearch, applyBtn) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_embedded_infographic_browser').find(`input[id*="edit-name"]`).type(nameToSearch);
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_embedded_infographic_browser').find(`input[id*="edit-submit-cgov-infographic-media-browser"][value=${applyBtn}]`).click({ force: true });
});

And('user selects {string} item from the media list', (title) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_embedded_infographic_browser').find(`td:contains(${title})`).each(($el) => {
        const text = $el[0].innerText;
        if (text === title) {
            cy.wrap($el).parent().find('input').click();
        }
    })
});

And('user clicks on {string} button to select media', (selectInfograhic) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_embedded_infographic_browser').find(`input[id='edit-submit'][value='${selectInfograhic}']`).click({ force: true });
    cy.wait(2000)
});

And('{string} dropdown has the following options', (labelText, dataTable) => {
    cy.get(`label[class="form-item__label js-form-required form-required"]:contains("${labelText}")`).should('be.visible');
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
        cy.get(`div.fieldset__wrapper.fieldset__wrapper--group label:contains("${options}")`).should('exist');
    }
});

And('user selects {string} radio button under {string}', (alignPosition, labelText) => {
    cy.get(`input[value='${alignPosition}']`).click({ force: true });
});

And('user clicks on {string} button to select infographic', (embedButton) => {
    cy.get(`div.ui-dialog-buttonset.form-actions button:contains("${embedButton}")`).click({ force: true });
});

And('user select {string} from the {string} dropdown', (selectItem, labelText) => {
    cy.get(`select[id*="edit-attributes-data-entity-embed-display"]`).select(selectItem);
});

And('user selects {string} from {string} dropdown in home and landing page', (dropDown, cardOption) => {
    cy.get(`.placeholder:contains("${cardOption}")`).parent().find(`input[value="${dropDown}"]`).click({ force: true });
});

And('user clicks on {string} link in the {string} text area in home and landing page', (title, cardOption) => {
    cy.get(`summary[aria-expanded='false']:contains('${title}')`).click({ force: true })
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
    cy.get(`summary[role='button']:contains('${linkBtn}')`).click({ force: true });
});

And('user selects {string} item from media list', (title) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_media_browser').find(`input[name*="entity_browser_select"][type='checkbox']`).eq(0).check();
});


And('the intro text reads {string}', (titlText) => {
    cy.get(`div[class*='intro-text'] p:contains("${titlText}")`).should('be.visible');
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

Then('user selects {string} option from Operations dropdown for media with title {string}', (translateOption, title) => {
    cy.get(`td:contains('${title}')`).siblings('td').find(`ul.dropbutton >li> a:contains("${translateOption}")`).click({ force: true });
});

And('the spanish infographic displayed has the following attributes', (dataTable) => {
    for (const { index, position, imageSource, imageAlt, descText, longDesc } of dataTable.hashes()) {
        const regex = new RegExp(imageSource);
        const regex1 = new RegExp(longDesc);
        cy.get('div.centered-element').eq(index).find('img').as('image')
            .should('have.attr', 'alt').and('eq', imageAlt);
        cy.get('@image').parent().parent().parent().parent().should('have.attr', 'class').and('include', position);
        cy.get('@image').should('have.attr', 'src').and('match', regex);
        cy.get(`p:contains('${descText}')`).should('be.visible');
        cy.get('@image').should('have.attr', 'longdesc').and('match', regex1);
    }
});

And('feature card description reads {string}', (description) => {
    cy.get(`div.multimedia-slot p:contains('${description}')`).should('be.visible');
});

And('user selects a checkbox next to the title with spanish path {string} with url {string} from the list of content', (spPath, purl) => {
    cy.get(`a[href='${spPath}${siteSection}/${purl}-${randomStr}']`).parent().parent().find('input.form-checkbox').check();
});

And('user selects {string} from style dropdown', (option) => {
    cy.get('select[name="field_page_style"]').select(option);
});

And('user clicks on {string} in {int} {string} section', (featItemLink, index, section) => {
    cy.get(`summary[aria-expanded="false"]:contains("${featItemLink}")`).click();
});

And('user clicks on Select content button item', () => {
    cy.get(`input[value="Select content"]`).trigger("click")
})

And('NCIDS feature cards have the following attributes', (dataTable) => {

    for (let { index, title, description, link, source, file, exitDisclaimer } of dataTable.hashes()) {
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace("{TEST_SITE_SECTION}", siteSection)
        }
        if (baseUrl.includes('cms-dev') || baseUrl.includes('cms-test')) {
            source = source.replace('/sites/default', '/sites/g/files/xnrzdm\\d+')
        }
        cy.get('.nci-card__body').eq(index).as('featureCard');

        cy.get('@featureCard').find('.nci-card__title').invoke('text').then((text) => {
            expect(text.trim()).equal(title);
        });

        if (description === 'N/A') {
            cy.get('@featureCard').find('p').should('not.exist');
        }
        else {
            cy.get('@featureCard').find('p').invoke('text').then((text) => {
                expect(text.trim()).equal(description);
            });
        }

        if (exitDisclaimer === 'N/A') {
            cy.get('@featureCard').hasPseudoElement('::after')
                .should('eq', false)
        }
        else {
            cy.get('@featureCard').hasPseudoElement('::after')
                .should('eq', true)
        }

        cy.get('@featureCard').parent().invoke('attr', 'href').then(href => {
            if (href.startsWith('http')) {
                expect(href).to.eq(link)
            } else {
                expect(href).to.eq(`${getBaseDirectory()}${link}-${randomStr}`)
            }
        })

        cy.get('@featureCard').parent().find('img').invoke('attr', 'src').then((fullSrc) => {

            if (baseUrl.includes('cms-dev') || baseUrl.includes('cms-test')) {
                fullSrc = fullSrc.replace(/xnrzdm\d+/g, 'xnrzdm\\d+')
            }
            expect(fullSrc.includes(`${source}`)).to.be.true;

            const src1 = fullSrc.substring(0, fullSrc.indexOf('?'));
            if (file.includes('placeholder')) {
                expect(src1).to.match(new RegExp(`.*\/${file}`))
            } else {
                expect(src1).to.match(new RegExp(`.*\\d{4}-\\d{2}\/${file}`))
            }
        });
    }
});