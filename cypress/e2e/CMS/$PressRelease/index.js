/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';
import { extractImgName } from "../../../utils/extractImgName.js";

const siteSection = Cypress.env('test_site_section');
const frontEndBaseUrl = Cypress.env('front_end_base_url');
const randomStr = Cypress.env('randomStr')

let imageSrc;
And('user selects {int} Lead Image from the list of images', (num) => {
    cy.get('span:contains("Lead Image")').parent().as('imageUpload').click()
    cy.get('input[name="field_image_article_entity_browser_entity_browser"]').click({ force: true })
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true })
});
And('user remembers the source of selected lead image for further verification', () => {
    cy.get('details img').eq(0).then($el => {
        imageSrc = $el[0].getAttribute('src')
    })
})

let imageSrc1;
And('user selects {int} Promotional Image from the list of images', (num) => {
    cy.get('span:contains("Promotional Image")').parent().first().as('imageUpload').click()
    cy.get('input[name="field_image_promotional_entity_browser_entity_browser"]').click({ force: true })
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true })
})

And('user remembers the source of selected promo image for further verification', () => {
    cy.get('div[id*="edit-field-image-promotional"] img').then($el => {
        imageSrc1 = $el[0].getAttribute('src')
    })
})

And('user selects {string} checkbox', (dateDisplay) => {
    cy.get(`[class='fieldset-wrapper'] label:contains("${dateDisplay}")`).parent().find('input.form-checkbox').check({ force: true })
})

And("{string} date is displaying today's date", (date) => {
    cy.get('ul.clearfix li strong').should('be.visible').and('include.text', date)

})

And('Contact {string} link has a href {string}', (linkText, link) => {
    cy.get(`a:contains("${linkText}")`).should('have.attr', 'href', link)
})

And('description reads {string}', (desc) => {
    cy.get('div#cgvBody > p').should('have.text', desc)
})

And('the lead image for press release is matching the earlier selected image', () => {
    cy.get('.centered-element img').then($el => {
        const source = $el[0].getAttribute('src');
        const actSrc = source.replace(/\?itok=[\S]+/, '').replace(/^(.*?)\/public/, '')
        const expectedSrc = (imageSrc.replace(/\?itok=[\S]+/, '')).replace(/^(.*?)\/public/, '')
        expect(actSrc).to.include(expectedSrc);
    })
});

And('public use text has a link {string} with href {string}', (linkText, link) => {
    cy.get(`div.public-use a:contains("${linkText}")`).should('have.attr', 'href', link)
});

And('{string} is a link with href that contains site section and {string}', (linkText, itemHref) => {
    cy.get('.views-element-container > ul> li').find(`a:contains("${linkText}")`).should('have.attr', 'href').then((link) => {
        expect(link).to.include(itemHref).and.to.include(siteSection);
    })

});

And('today date is displayed in format {string}', (format) => {
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
    cy.get('.views-element-container > ul> li').find('time').first().should('have.text', expectedDate);

});

And('the list item description reads {string}', (desc) => {
    cy.get('.views-element-container > ul> li').find('p').first().should('have.text', desc);
});

And('the promotional image for press release is matching the earlier selected image', () => {
    const expectedSrc = (imageSrc1.replace(/\?itok=[\S]+/, '')).replace(/^(.*?)\/public/, '');
    const extractedImageName = extractImgName(expectedSrc).replace(/\.jpg|\.jpeg|\.png/, '')

    cy.get('.views-element-container > ul> li').find('img').then($el => {
        const source = $el[0].getAttribute('src');
        const actSrc = source.replace(/\?itok=[\S]+/, '').replace(/^(.*?)\/public/, '')
        expect(actSrc).to.include(extractedImageName.replaceAll('_', '-').replace('article', ''))
    })
});

And('user removes the Lead Image', () => {
    cy.get('#edit-field-image-article-current-items-0-remove-button').click({ force: true })
})

And('user removes the Promotional Image', () => {
    cy.get('input[id*="edit-field-image-promotional-current-items-0-remove-button"]').click({ force: true })
})

And('public use text is not displayed', () => {
    cy.get("div[class='public-use']").should('not.exist');
});

And('user is navigating to the front end site plus {string}', (path) => {
    cy.visit(`${frontEndBaseUrl}/${path}`);
});

Then('the promo image is matching the earlier selected image', () => {
    const expectedSrc = (imageSrc1.replace(/\?itok=[\S]+/, '')).replace(/^(.*?)\/public/, '');
    const extractedImageName = extractImgName(expectedSrc).replace(/\.jpg|\.jpeg|\.png/, '')

    cy.get('div.feature-card').find('img').then($el => {
        const source = $el[0].getAttribute('src');
        const actSrc = source.replace(/\?itok=[\S]+/, '').replace(/^(.*?)\/public/, '')
        expect(actSrc).to.include(extractedImageName.replaceAll('_', '-').replace('article', ''))
    });
});

And('body was translated as {string}', (title) => {
    cy.get(`label:contains("${title}")`).should('be.visible')
})

And('Related Resources section was translated as {string}', (dropdownLabel) => {
    cy.get("strong[data-drupal-selector='edit-field-related-resources-title']").should('include.text', dropdownLabel)
})

And('dates were translated as follows', (dataTable) => {
    for (const { date } of dataTable.hashes()) {
        cy.get(`div[class='document-dates horizontal'] li>strong:contains("${date}")`).should('be.visible')
    }
})

And('user clicks on title with url spanish path {string} site section plus {string}', (spPath, purl) => {
    cy.get(`a[href='${spPath}${siteSection}/${purl}-${randomStr}']`).click();
});