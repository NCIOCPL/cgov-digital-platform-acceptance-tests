/// <reference types="Cypress" />
import { And, Then, When } from 'cypress-cucumber-preprocessor/steps';
import { extractImgName } from "../../../utils/extractImgName.js";
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
const siteSection = Cypress.env('test_site_section');
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

And('user clicks on title with url {string} from the list of content', (contentHref) => {
    cy.get(`a[href='${siteSection}/${contentHref}-${randomNum}']`).click();
});

And('user selects a checkbox next to title with url {string} from the list of content', (url) => {
    cy.get(`a[href='${siteSection}/${url}-${randomNum}']`).parent().parent().find('input.form-checkbox').check();
});

Given('user is navigating to the front end site with path site section plus {string}', (purl) => {
    cy.visit(`${frontEndBaseUrl}${siteSection}/${purl}-${randomNum}`, { retryOnStatusCodeFailure: true });
});

Given('user is navigating to the front end site with the path site section plus {string}', (purl) => {
    cy.visit(`${frontEndBaseUrl}${siteSection}/${purl}`, { retryOnStatusCodeFailure: true });
});

And('the content item with url {string} does not exist in the list of content', (url) => {
    cy.get(`a[href='${siteSection}/${url}-${randomNum}']`).should('not.exist');
});

And('user selects {string} from {string} CTHP dropdown', (dropdown, cartOption) => {
    cy.get(`.placeholder:contains("${cartOption}")`).parent().parent().find(`input[value="${dropdown}"]`).eq(0).click({ force: true })
})

And('user selects {string} from CTHP Card Theme dropdown number {int}', (option, index) => {
    cy.get('select[id*="cthp-card-theme"]').eq(index - 1).select(option)
})

And('user fills out Overview Card Text field text area with {string}', (value) => {
    cy.getNthIframe("iframe[class='cke_wysiwyg_frame cke_reset']", 0).find('p').type(value)
})

And('user fills out the following fields under {string} section', (option, dataTable) => {
    for (const { fieldLabel, value, field_name } of dataTable.hashes()) {
        cy.get(`label:contains("${option}")`).should('be.visible')
        cy.get(`input[name^='${field_name}']`).as('inputField').parent().find('label').should('include.text', fieldLabel);
        cy.get('@inputField').type(value);
    }
})

And('user fills out CTHP Guide Card Description field text area with {string}', (value) => {
    cy.getNthIframe("iframe[class='cke_wysiwyg_frame cke_reset']", 1).find('p').type(value)
})

And('user clicks on {string} link in the {string} text area', (link, linkOption) => {
    cy.get(`div:contains("${linkOption}")`).parent().parent().find(`span:contains("${link}")`).eq(0).click({ force: true })
})

And('user clicks on {string} button from {string} text area', (title, option) => {
    cy.get(`div.paragraph-type-title:contains("${option}")`).parent().parent().find(`input[value="${title}"]`).click({ force: true })
})

And('user filters summaries list by {string} language and clicks on {string} button', (dropdown, btn) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("select[name='langcode']").select(dropdown)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`input[value="${btn}"]`).click({ force: true })
})

And('user selects {int} PDQ Summary from the list of summaries', (num) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find('input.form-checkbox').first().click({ force: true })
})

And('user clicks on {string} button to select item', (listBtn) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`input[value="${listBtn}"]`).click({ force: true })
})

And('user selects {string} from {string} dropdown', (dropdown, section) => {
    cy.get(`.placeholder:contains("${section}")`).parent().find(`input[value="${dropdown}"]`).click({ force: true })
})

And('user clicks on {string} link in the Internal Link text area', (link) => {
    cy.get(`tbody summary[role='button'] span:contains("${link}")`).eq(1).click({ force: true })
})

And('user selects {string} item from the media list', (title) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[name='name']").type(title)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-submit-cgov-media-browser']").click()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`td:contains(${title})`).parent().find('input').click()
})

And('user selects {string} from {string} dropdown {string} section', (dropDown, option, section) => {
    cy.get(`div:contains("${section}")`).parent().parent().find(`.placeholder:contains("${option}")`).parent().find(`input[value="${dropDown}"]`).click({ force: true })
})

And('user types {string} into title field search area', (title) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[name='title']").type(title)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-submit-cgov-content-browser']").click()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`td:contains(${title})`).parent().find('input').eq(0).click();
})

And('user selects {int} research page from the list', (num) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find('input.form-checkbox').first().click({ force: true })
})

And('user selects {string} from CTHP Card Theme dropdown', (dropdown) => {
    cy.get("select[name*='field_cthp_cards[5][subform][field_cthp_card_theme]']").select(dropdown)
})

And('user types {string} in the autosuggest field of {string} card area', (value, option) => {
    cy.get(`label:contains("${option}")`).parent().find("input[name*='field_cthp_cards[6][subform]']").type(value)
})

And('user selects {int} result from the list of autosuggest', (num) => {
    cy.get("a[class='ui-menu-item-wrapper']").eq(num - 1).click({ force: true })
})

And('user clicks on Source tool icon in the html content tool bar', () => {
    cy.get("span.cke_button_label.cke_button__source_label").eq(2).click({ force: true })
})

And('user enters {string} into source text field', (value) => {
    cy.get("textarea[title='Rich Text Editor, HTML Content field']").type(value)
})

And('user selects {string} from Search Engine Restrictions dropdown', (dropdown) => {
    cy.get("select[name='field_search_engine_restrictions']").select(dropdown)
})

And('user selects {string} from draft {string} dropdown', (dropdown, option) => {
    cy.get(`label:contains("${option}")`).parent().parent().find("select[name*='moderation_state']").select(dropdown)
})

/*------- Cancer Type Home Page front end verification Starts from below below --------*/

And('the following cards are displayed', (dataTable) => {
    for (const { title, cardType } of dataTable.hashes()) {
        cy.get(`div[class*="${cardType}"] h2`).should('include.text', title)
    }
})

And('cthp overview card has description {string}', (description) => {
    cy.get("div[class*='cthp-overview'] p").should('include.text', description)
})

And('PDQ link label reads {string}', (title) => {
    cy.get(`div[class='cardBody'] h4:contains("${title}")`).should('be.visible')
})

let summaryTitle;
And('user remembers the title of selected summary for further verification', () => {
    cy.get('div[id*="pdq-links-current-items"]').then($el => {
        summaryTitle = $el[0].innerText
    })
})

Then('the PDQ link is matching the earlier selected PDQ link', () => {
    cy.get('div[class*="cthp-treatment"] a').then($el => {
        const title = $el[0].innerText;
        expect(summaryTitle).to.include(title);
    })
})

let summaryVideo;
And('user remembers the title of selected video for further verification', () => {
    cy.get("div[id*='cthp-video-current-']").then($el => {
        summaryVideo = $el[0].innerText
    })
})

Then('the video is matching the earlier selected video', () => {
    cy.get('div[class*="cthp-screening"] img').then($el => {
        const video = $el[0].innerText;
        expect(summaryVideo).to.include(video);
    })
})

let summaryPageTitle;
And('user remembers title of selected Cancer Research List Page for future verification', () => {
    cy.get("div[class*='cthp-research'] div[class*='label']").then($el => {
        summaryPageTitle = $el[0].innerText
    })
})

Then('the Cancer Research List page title is matching the earlier selected Cancer Research List page title', () => {
    cy.get("h1").should('include.text', summaryPageTitle)
})

And('user clicks on {string} dropdown', (dropdown) => {
    cy.get(`div[class='more-info list cthp-dropdown'] label:contains("${dropdown}")`).click({ force: true })
})

And('the following more info links are displayed', (dataTable) => {
    for (const { title, url } of dataTable.hashes()) {
        const replacedTestSiteSection = url.replace("{TEST_SITE_SECTION}", siteSection);
        cy.get(`ul a[class='title']:contains("${title}")`).should('be.visible').and('have.attr', 'href', replacedTestSiteSection)
    }
})

And('cthp causes card has a link {string} with href {string}', (linkText, href) => {
    const replacedTestSiteSection = href.replace("{TEST_SITE_SECTION}", siteSection);
    cy.get("div[class*='cthp-causes'] a").as('card').should('have.text', linkText)
    cy.get("@card").should('have.attr', 'href', replacedTestSiteSection)
})

And('cthp survival card has a link {string} with href {string}', (linkText, href) => {
    cy.get(`div[class*='cthp-survival'] a:contains("${linkText}")`).should('be.visible').and('have.attr', 'href', href)
})

And('cthp screening card has a link {string} with href {string}', (linkText, href) => {
    const replacedTestSiteSection = href.replace("{TEST_SITE_SECTION}", siteSection);
    cy.get("div[class*='cthp-screening'] a").as('card').should('have.text', linkText)
    cy.get("@card").should('have.attr', 'href', replacedTestSiteSection)
})

And('cthp general card has description that is not empty', () => {
    cy.get("div[class='equalheight bgWhite cthp-general'] p").should('be.visible').and('not.be.empty')
})
And('cthp general card has multiple links', () => {
    cy.get("div[class*='cthp-general'] a").should('have.length.above', 0)
})

And('cthp genetics card reads {string}', (title) => {
    cy.get(`div[class='equalheight bgWhite cthp-genetics'] div:contains("${title}")`).should('be.visible')
})

And('cthp research card has multiple links', () => {
    cy.get("div[class*='cthp-general'] a").should('have.length.above', 0)
})

And('user clicks {string} link inside cthp research card', (option) => {
    cy.get(`div[class*='cthp-research'] a:contains("${option}")`).click({ force: true })
})

And('user removes Video from {string} card area', (section) => {
    cy.get(`div:contains("${section}")`).parent().find("input[name*='field_cthp_video_remove']").click({ force: true })
})

And('user selects {int} Video from the list of videos', (num) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find('input.form-checkbox').eq(num - 1).check()
})

And('user filters published list by {string} and clicks {string} button', (dropdown, button) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("select[name='status']").select(dropdown)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`input[value="${button}"]`).click({ force: true })
})

And('user selects {int} Video from the list of main page videos', (num) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find('input.form-checkbox').eq(num - 1).check()
})

let imageSrc1;
And('user selects {int} Promotional Image from the list of images', (num) => {
    cy.get('span:contains("Promotional Image")').parent().first().click()
    cy.get('input[name="field_image_promotional_entity_browser_entity_browser"]').click({ force: true })
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true })
});

And('user remembers the source of selected promo image for further verification', () => {
    cy.get('div[id*="edit-field-image-promotional"] img').then($el => {
        imageSrc1 = $el[0].getAttribute('src')
    });
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