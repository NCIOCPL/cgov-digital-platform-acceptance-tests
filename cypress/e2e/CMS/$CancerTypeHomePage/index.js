/// <reference types="Cypress" />
import {  And, Then  } from 'cypress-cucumber-preprocessor/steps';
import { extractImgName } from "../../../utils/extractImgName.js";


const siteSection = Cypress.env('test_site_section');
const randomStr = Cypress.env('randomStr')

And('user selects {string} from {string} CTHP dropdown', (dropdown, cartOption) => {
    cy.get(`.placeholder:contains("${cartOption}")`).parent().parent().find(`input[value="${dropdown}"]`).eq(0).click({ force: true })
})

And('user selects {string} from CTHP Card Theme dropdown number {int}', (option, index) => {
    cy.get('select[id*="cthp-card-theme"]').eq(index - 1).select(option)
})

And('user fills out Overview Card Text field text area with {string}', (value) => {
    cy.get(`div[id*='cthp-overview-card`).find('.ck-content[contenteditable=true]').then(el => {
        const editor = el[0].ckeditorInstance
        editor.data.set(value)
    });
})

And('user fills out the following fields under {string} section', (option, dataTable) => {
    for (const { fieldLabel, value, field_name } of dataTable.hashes()) {
        cy.get(`label:contains("${option}")`).should('be.visible')
        cy.get(`input[name^='${field_name}']`).as('inputField').parent().find('label').should('include.text', fieldLabel);
        cy.get('@inputField').type(value);
    }
})

And('user fills out CTHP Guide Card Description field text area with {string}', (value) => {
    cy.get(`div[id*='cthp-guide-card`).find('.ck-content[contenteditable=true]').then(el => {
        const editor = el[0].ckeditorInstance
        editor.data.set(value)
    });
})

And('user clicks on {string} link in the {string} text area', (link, linkOption) => {
    cy.get(`div:contains("${linkOption}")`).parent().parent().find(`summary:contains("${link}")`).eq(0).click({ force: true })
})

And('user selects {string} from Current Page Audience dropdown', (option) => {
    cy.get('label:contains("Current Page Audience")').parent().find('select').select(option)
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
    cy.get(`summary[role='button']:contains("${link}")`).eq(1).click({ force: true })
})

And('user clicks on {string} link in the Media Link text area', (link) => {
    cy.get("[id*='edit-field-media-link'] summary[aria-expanded='false']").click({ force: true })
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
    cy.get("button[data-cke-tooltip-text*='Source']").eq(2).click()
})

And('user enters {string} into source text field', (value) => {
    cy.get(".ck-source-editing-area textarea[aria-label='Source code editing area']").type(value)
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
    for (let { title, url } of dataTable.hashes()) {
        url = url.replace('{TEST_SITE_SECTION}', siteSection)
        cy.get(`ul a[class='title']:contains("${title}")`).should('be.visible').and('have.attr', 'href').then(href => {
            expect(href).to.include(url)
        })
    }
})

And('cthp causes card has a link {string} with href {string}', (linkText, href) => {
    const replacedTestSiteSection = href.replace('{TEST_SITE_SECTION}', siteSection)
    cy.get("div[class*='cthp-causes'] a").as('card').should('include.text', linkText)
    cy.get("@card").should('have.attr', 'href').then(href => {
        expect(href).to.include(replacedTestSiteSection)
    })
})

And('cthp survival card has a link {string} with href {string}', (linkText, href) => {
    cy.get(`div[class*='cthp-survival'] a:contains("${linkText}")`).should('be.visible').and('have.attr', 'href', href)
})

And('cthp screening card has a link {string} with href {string}', (linkText, href) => {
    const replacedTestSiteSection = href.replace('{TEST_SITE_SECTION}', siteSection)
    cy.get("div[class*='cthp-screening'] a").as('card').should('have.text', linkText)
    cy.get("@card").should('have.attr', 'href').then(href => {
        expect(href).to.include(replacedTestSiteSection)
    })
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
    cy.get('summary:contains("Promotional Image")').first().click()
    cy.get('input[name="field_image_promotional_entity_browser_entity_browser"]').click({ force: true })
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true })
});

And('user remembers the source of selected promo image for further verification', () => {
    cy.get('div[id*="edit-field-image-promotional"] img').then($el => {
        imageSrc1 = $el[0].getAttribute('src').replace('.webp','')
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

And('Current Page Audience dropdown has the following values', (dataTable) => {
    for (let { option } of dataTable.hashes()) {
        cy.get(`select[id*="edit-field-audience"] option:contains("${option}")`).should('be.visible');
    }
});

And('{string} is present', (audienceToggle) => {
    cy.get(`summary.claro-details__summary:contains("${audienceToggle}")`).should('be.visible');
});

And('the following cards fields are displayed with remove button translated as {string}', (removeBtn, dataTable) => {
    for (let { card } of dataTable.hashes()) {
        cy.get(`div[id*='top-paragraph-type-title']:contains("${card}")`).each($el => {
            cy.wrap($el).parent().find(`input[value = "${removeBtn}"]`).should('be.visible');
        })
    }
});

And('Add Card Section was translated as {string}', (addCardSection) => {
    cy.get(`input[value='${addCardSection}']`).should('be.visible');
});

And('the following cards have multiple spanish links that start with {string}', (startLink, dataTable) => {
    for (let { cardType } of dataTable.hashes()) {
        cy.get(`div[class*="${cardType}"]`).find('a').as('card').should('have.length.above', 1);
        cy.get('@card').invoke('attr', 'href').then((linkHref) => {
            expect(linkHref.startsWith(startLink)).to.be.true;
        });
    }
});

And('user clicks on title with url spanish path {string} site section plus {string}', (spPath, purl) => {
    cy.get(`a[href='${spPath}${siteSection}/${purl}-${randomStr}']`).click();
});

And('user clicks on {string} link', (linkText) => {
    cy.get(`summary:contains('${linkText}')`).click();
});

And("the {string} link is displayed with href {string}", (linkText, linkHref) => {
    cy.get('.toggle-arrow-link').contains(linkText).should('have.attr', 'href').and('include', linkHref);
});

And('user filters results by {string} type', (contentType) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("select[id*='edit-type']").select(`${contentType}`);
});
      