/// <reference types="Cypress" />

import { And, Then, When } from 'cypress-cucumber-preprocessor/steps';


import { getBaseDirectory } from '../../../utils';
const baseUrl = Cypress.config('baseUrl');
const randomStr = Cypress.env('randomStr')
const siteSection = Cypress.env('test_site_section');

And('user selects {string} from style dropdown', (option) => {
    cy.get('select[id="edit-field-mlp-page-style"]').select(option);
});

And('user uploads slim hero {string}', (fileName) => {
    cy.fixture(fileName, { encoding: null }).as('fixture')
    cy.get('input[id*="field-slim-hero-image"]').first().selectFile('@fixture');
    cy.wait(2000);
});

And('user clicks on Source tool icon in the html content tool bar', () => {
    cy.get("button[data-cke-tooltip-text*='Source']").click()
})

And('user enters {string} into source text field', (value) => {
    cy.get(".ck-source-editing-area textarea[aria-label='Source code editing area']").type(value)
})

And('NCIDS Slim Hero is displayed with alt text {string}', (altText) => {
    cy.get("div[class='usa-section cgdp-slim-hero']").as('slimHero').should('be.visible');
    cy.get('@slimHero').find('img').should('have.attr', 'alt', altText)
})

And('content block has a title {string}', (title) => {
    cy.get('div.usa-prose.cgdp-landing-content-block h2').should('be.visible').and('have.text', title)
})
And('content block has the following links', (dataTable) => {
    for (const { title, href } of dataTable.hashes()) {
        cy.get('div.usa-prose.cgdp-landing-content-block').find(`a[href='${href}']`).should('have.text', title)

    }
});
And('user removes page title block', () => {
    cy.get('[id*="edit-field-landing-contents-1-top-paragraph-type-title"]').parent().find('input[value="Remove"]').click({force:true});
    cy.get('input[value="Confirm removal"]').click({force:true})
})

And('page title does not exist', () => {
    cy.get('h1').should('not.exist')
})


And('user selects {string} from {string} dropdown', (dropDown, cartOption) => {
    cy.get(`.placeholder:contains("${cartOption}")`).parent().find(`input[value="${dropDown}"]`).click({ force: true });
})

And('user clicks on {string} in {int} {string} section', (featItemLink, index, section) => {
    cy.get(`summary[aria-expanded="false"]:contains("${featItemLink}")`).click();
});

And('user selects {string} as promo image for {int} feature card', (name, index) => {
    cy.get(`summary[aria-controls*="edit-field-override-image-promotional"]`).eq(index - 1).click();
    cy.wait(500);
    cy.get('input[name*="override_image_promotional_entity_browser"]').eq(index - 1).click()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find('input#edit-name').type(name)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find('input[id*="edit-submit-cgov-image-media-browser"]').click()
    cy.wait(1500)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input.form-checkbox").eq(0).click()
    cy.wait(1500)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click()
})

And('NCIDS feature cards have the following attributes', (dataTable) => {

    for (let { index, title, description, link, source, file } of dataTable.hashes()) {
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

And('user clicks on Select content button item', () => {
    cy.get(`input[value="Select content"]`).trigger("click")
})

And('user clicks on {string} button for {string}', (edit, section) => {
    cy.get(`span.paragraph-type-label:contains('${section}')`).parent().parent().find(`input[value="${edit}"]`).click({force:true});
});

And('user selects {string} from {int} list style dropdown', (option, index) => {
    cy.get('select[id*="subform-field-list-item-style"]').eq(index - 1).select(option);
})

And('user selects {string} from {int} item list dropdown', (dropdown, index) => {
    cy.get(`input[value='${dropdown}']`).eq(index - 1).click({ force: true })
})

And('user clicks on {string} button to link to a media', (link) => {
    cy.get(`summary[aria-controls^="edit-field-media-link"]`).click({ force: true });
});

And('NCIDS {int} list is displayed with title {string}', (index, title) => {
    cy.get('.cgdp-list h2').eq(index - 1).should('be.visible').and('include.text', title)
})
And('each {int} list item has a heading and an image', (listIndex) => {
    cy.get('.cgdp-list').eq(listIndex - 1).find('li.usa-collection__item').each(item => {
        cy.wrap(item).find('a').invoke('text').should('have.length.above', 0);
        cy.wrap(item).find('img').should('have.attr', 'src')
    })
})

And('each {int} list item out of {int} has a heading and description except items {int} and {int}', (listIndex,totalNum, index1, index2) => {
    for (let i = 0; i < totalNum; i++) {
        if (i !== (index1 - 1) && i !== (index2 - 1)) {
            cy.get('.cgdp-list').eq(listIndex - 1).find('li.usa-collection__item').eq(i).find('p.usa-collection__description').invoke('text').should('have.length.above', 0);
        }
        cy.get('.cgdp-list').eq(listIndex - 1).find('li.usa-collection__item').eq(i).find('a').invoke('text').should('have.length.above', 0);
    }
})

When('the optional flag card group heading is {string}', (title) => {
    cy.get(`h2.nci-heading-h2.padding-bottom-2`).should('have.text', title);
});


And('NCIDS flag cards have the following attributes', (dataTable) => {

    for (let { index, title, description, link, source, file } of dataTable.hashes()) {
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace("{TEST_SITE_SECTION}", siteSection)
        }
        if (baseUrl.includes('cms-dev') || baseUrl.includes('cms-test')) {
            source = source.replace('/sites/default', '/sites/g/files/xnrzdm\\d+')

        }

        cy.get('.cgdp-flag-card').eq(index).as('featureCard');

        cy.get('@featureCard').find('.cgdp-flag-card__title').invoke('text').then((text) => {
            expect(text.trim()).equal(title);
        });

        if (description === 'none') {
            cy.get('@featureCard').find('p').should('not.exist');
        }
        else {
            cy.get('@featureCard').find('p').invoke('text').then((text) => {
                expect(text.trim()).equal(description);
            });
        }
        cy.get('@featureCard').find('a').invoke('attr', 'href').then(href => {
            if (link.startsWith('http')) {
                expect(href).to.eq(link)
            } else {
                expect(href).to.eq(`${getBaseDirectory()}${link}-${randomStr}`)
            }
        })

        cy.get('@featureCard').find('img').invoke('attr', 'src').then((fullSrc) => {

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

When('the following imageless cards are displayed', (dataTable) => {
    for (let { cardIndex, componentVariant, cardType, linkHref, title, description } of dataTable.hashes()) {

        if (linkHref.includes("{TEST_SITE_SECTION}")) {
            linkHref = linkHref.replace("{TEST_SITE_SECTION}", siteSection)
        }
        cy.get(`[class='cgdp-imageless-card-group cgdp-imageless-card-group--${componentVariant}']`)
            .find('.nci-card').eq(cardIndex).as('card')

        cy.get('@card').find('a').should('have.attr', 'data-eddl-landing-item-link-type', cardType);

        if (linkHref.startsWith('http')) {
            cy.get('@card').find('a').should('have.attr', 'href', linkHref)
        } else {
            cy.get('@card').find('a').should('have.attr', 'href').then(href=>{
                expect(href).to.eq(`${getBaseDirectory()}${linkHref}-${randomStr}`)
            })
        
        }
   
        cy.get('@card').find('.nci-card__body').find('.nci-card__title').should('have.text', title)
        if (description !== 'none')
            cy.get('@card').find('.nci-card__body').find('.nci-card__description').should('have.text', description)
        else
            cy.get('@card').find('.nci-card__body').find('.nci-card__description').should('not.exist')
    }
})

And('user clicks on {string} button for {string}',(edit,section)=>{
    cy.get(`span.paragraph-type-label:contains('${section}')`).parent().parent().find(`input[value="${edit}"]`).click();
    });

