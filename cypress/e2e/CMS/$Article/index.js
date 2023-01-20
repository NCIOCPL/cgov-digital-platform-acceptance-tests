/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';
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
    for (const { fieldLabel, value, field_name } of dataTable.hashes()) {
        if (fieldLabel === 'Pretty URL') {
            value = `${value}-${randomNum}`;
        }
        cy.get(`input[name^='${field_name}']`).as('inputField').parent().find('label').should('include.text', fieldLabel);
        cy.get('@inputField').type(value);
    }
});

// And('user clicks on title with url {string} from the list of content', (contentHref) => {
//     cy.get(`a[href='${siteSection}/${contentHref}-${randomNum}']`).click();
// });

And('user clicks on title with url {string} from the list of content', (contentHref) => {
    cy.get(`a[href='${siteSection}/${contentHref}']`).click();
});

And('user selects a checkbox next to title with url {string} from the list of content', (url) => {
    cy.get(`a[href='${siteSection}/${url}-${randomNum}']`).parent().parent().find('input.form-checkbox').check();
});

Given('user is navigating to the front end site with path site section plus {string}', (purl) => {
    cy.visit(`${frontEndBaseUrl}${siteSection}/${purl}-${randomNum}`, { retryOnStatusCodeFailure: true });
});

And('the content item with url {string} does not exist in the list of content', (url) => {
    cy.get(`a[href='${siteSection}/${url}-${randomNum}']`).should('not.exist');
});

And("{string} date is displaying today's date", (stampLabel) => {
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
    const date = new Date()
    const year = date.getFullYear()
    const month = months[date.getMonth()]
    const day = date.getDate()
    const expectedDate = `${month} ${day}, ${year}`
    cy.get('ul.clearfix li').as('dateStamp').find('strong').should('have.text', stampLabel)
    cy.get('@dateStamp').find('time').should('include.text', expectedDate)
})

And('{string} button is displayed', (optionLabel) => {
    cy.get(`input[value='${optionLabel}']`).should('be.visible')
})

And('user enters {string} as intro text', (introTxt) => {
    cy.getIframeBody("iframe[title='Rich Text Editor, Intro Text field']").find('p').type(introTxt)
})

And('user enters {string} as {int} body section heading', (value, position) => {
    cy.getNthIframe("iframe[title='Rich Text Editor, Heading field']", position - 1).find('p').type(value)
})

And('user fills out {int} {string} text area with {string}', (position, sectionName, value) => {
    cy.getNthIframe("iframe[title='Rich Text Editor, Content field']", position - 1).find('p').type(value)
})

And('intro text reads {string}', (titlText) => {
    cy.get(`div[class='blog-intro-text'] p:contains("${titlText}")`).should('be.visible')
})

And('{int} section heading reads {string}', (num, title) => {
    cy.get(`h2[id^='article-heading'] p:contains('${title}')`).should('be.visible')
})

And('{int} description reads {string}', (contentText) => {
    cy.get(`p:contains('${contentText}')`).should('be.visible')
})

And('public use text has a link {string} with href {string}', (linkText, linkUrl) => {
    cy.get(`div[class='public-use'] a:contains('${linkText}')`).should('be.visible').and('have.attr', 'href', linkUrl)
})

And('{string} section is not displayed', (section) => {
    cy.get(`a:contains("${section}")`).should('not.exist')
})

let imageSrc;
And('user selects {int} Lead Image from the list of images', (num) => {
    cy.get('span:contains("Lead Image")').parent().as('imageUpload').click()
    cy.get('input[name="field_image_article_entity_browser_entity_browser"]').click({ force: true })
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true })
});
And('user remembers the source of selected lead image for further verification', () => {
    cy.get('details img').then($el => {
        imageSrc = $el[0].getAttribute('src')
    })
})

let imageSrc1;
And('user selects {int} Promotional Image from the list of images', (num) => {
    cy.get('span:contains("Promotional Image")').parent().first().as('imageUpload').click()
    cy.get('input[name="field_image_promotional_entity_browser_entity_browser"]').click({ force: true })
    cy.wait(2000)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true })
})

And('user remembers the source of selected promo image for further verification', () => {
    cy.get('details img').then($el => {
        imageSrc1 = $el[0].getAttribute('src')
    })
})

And('user selects {string} checkbox', (dateDisplay) => {
    cy.get(`[class='fieldset-wrapper'] label:contains("${dateDisplay}")`).parent().find('input.form-checkbox').check({ force: true })
})

And('the lead image is matching the earlier selected image', () => {
    cy.get('.centered-element > img').then($el => {
        const source = $el[0].getAttribute('src');
        const actSrc = source.replace(/\?itok=[\S]+/, '').replace(/^(.*?)\/public/, '')
        const expectedSrc = (imageSrc.replace(/\?itok=[\S]+/, '')).replace(/^(.*?)\/public/, '')
        expect(actSrc).to.include(expectedSrc);
    })
});

And('user removes the Lead Image', () => {
    cy.get('#edit-field-image-article-current-items-0-remove-button').click({ force: true })
})

And('user clicks on {string} to add a body section', (option) => {
    cy.get(`input[value='${option}']`).click();
    cy.get("div[data-drupal-selector='edit-field-article-body-1-top-paragraph-type-title']").should('exist');
})

And('user removes the Promo Image', () => {
    cy.get('input[id*="edit-field-image-promotional-current-items-0-remove-button"]').click({ force: true })
})

And('{string} section is displayed with the following anchor links', (OTP, dataTable) => {
    cy.get('nav.on-this-page h6').should('have.text', OTP);
    for (const { title, href } of dataTable.hashes()) {
        cy.get(`nav.on-this-page a[href='${href}']`).should('include.text', title)
    }
});

And('public use text is not displayed', () => {
    cy.get("div[class='public-use']").should('not.exist');
});


























