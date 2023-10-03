/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';
import { extractImgName } from "../../../utils/extractImgName.js";

const siteSection = Cypress.env('test_site_section');
const frontEndBaseUrl = Cypress.env('front_end_base_url');
const randomStr = Cypress.env('randomStr')

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
    cy.window().then(win => {
        win.Drupal.CKEditor5Instances.forEach(editor => {
            if (editor.sourceElement.id?.includes('intro-text')) {
                editor.setData(`<p>${introTxt}</p>`)
            }
        })
    })

})

And('user enters {string} as {int} body section heading', (value, position) => {
    cy.window().then(win => {
        win.Drupal.CKEditor5Instances.forEach(editor => {
            if (editor.sourceElement.id?.includes(`${position-1}-subform-field-body-section-heading`)) {
                editor.setData(`<p>${value}</p>`)
            }
        })
    })
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
    cy.get('summary:contains("Lead Image")').click()
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
    cy.get('summary:contains("Promotional Image")').first().click()
    cy.get('input[name="field_image_promotional_entity_browser_entity_browser"]').click({ force: true })
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true })
});

And('user remembers the source of selected promo image for further verification', () => {
    cy.get('div[id*="edit-field-image-promotional"] img').then($el => {
        imageSrc1 = $el[0].getAttribute('src')
    });
});

And('user selects {string} checkbox', (dateDisplay) => {
    cy.get(`div#edit-field-date-display-mode label:contains("${dateDisplay}")`).parent().find('input.form-checkbox').check({ force: true })
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

And('user selects {string} content item', (dropDown) => {
    cy.get(`input[value='${dropDown}']`).click({ force: true });
});

And('user clicks on {string} link in the {string} text area', (title, cartOption) => {
    cy.get(`div.paragraph-type-title:contains('${cartOption}')`).parent().parent().find(`span:contains('${title}')`).parent().click();
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

And('Link section under related resources was translated as {string}', (linkText) => {
    cy.get(`summary.claro-details__summary:contains("${linkText}")`).should('be.visible');
});

And('{string} label is displayed', (labelListDesc) => {
    cy.get(`div[class*="js-form-item-field-list-description-0-value"] label:contains("${labelListDesc}")`).should('be.visible');
});

And('body was translated as {string}', (bodyTranslation) => {
    cy.get(`div[id*=field-article-body] h4:contains("${bodyTranslation}")`).should('be.visible');
});

And('body content was translated as {string}', (contentHeadingTranslation) => {
    cy.get(`div[id="edit-field-article-body-0-subform-field-body-section-content-wrapper"] label:contains("${contentHeadingTranslation}")`);
});

And('Add Body Section was translated as {string}', (addBodySection) => {
    cy.get(`input[value='${addBodySection}']`).should('be.visible');
});

And('user clicks on title with url spanish path {string} site section plus {string}', (spPath, purl) => {
    cy.get(`a[href='${spPath}${siteSection}/${purl}-${randomStr}']`).click();
});