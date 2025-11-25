/// <reference types="Cypress" />

import { And, Then, When } from 'cypress-cucumber-preprocessor/steps';


import { getBaseDirectory } from '../../../utils';
const baseUrl = Cypress.config('baseUrl');
const randomStr = Cypress.env('randomStr')
const siteSection = Cypress.env('test_site_section');

And('user selects {string} from style dropdown', (option) => {
    cy.get('select[name="field_page_style"]').select(option);
});

And('user clicks on {string} from {string} area', (button, area) => {

    cy.get(`em.placeholder:contains("${area}")`).parent().find("button.dropbutton__toggle").click();
    cy.get(`em.placeholder:contains("${area}")`).parent().find(`input[value="${button}"]`).click();
})
And('user expands link dropdown to add a link in {string} area of {string} component', (button, area) => {
    cy.get(`div:contains("${area}")`).parent().parent().find(`div:contains("${button}")`).parent().parent().find('summary[aria-expanded="false"]').click()
})
And('user expands link dropdown to add a link in {string} in CTA', (button) => {
    cy.get('summary[aria-expanded="false"]').click()
})


And('user selects {string} from {string} dropdown', (dropDown, cartOption) => {
    cy.get(`.placeholder:contains("${cartOption}")`).parent().find(`input[value="${dropDown}"]`).click({ force: true });
})

And('user clicks on {string} link in the {string} text area', (title, cartOption) => {
    cy.get(`summary[aria-expanded="false"]:contains(${title})`).click();
})

And('user uploads hero images as follows', (dataTable) => {
    for (const { fileName, type } of dataTable.hashes()) {
        cy.fixture(fileName, { encoding: null }).as('fixture')
        cy.get(`input[type="file"][data-drupal-selector*="${type}"]`).selectFile('@fixture');
        cy.get('.throbber', { timeout: 40000 }).should('not.exist')
    }
});
And('user adds another {string} link for {int} guide card', (link, index) => {
    cy.get(`input[name*="guide_cards"][name*="_${link}_add_more"]`).eq(index - 1).click({ force: true })
})

And('user clicks on {string} in {int} {string} section', (featItemLink, index, section) => {
    cy.get(`summary[aria-expanded="false"]:contains("${featItemLink}")`).click();
});

And('user selects {string} theme for {int} block', (option, index) => {
    cy.get('select[name*="theme"]').select(option)
});
And('user selects {string} image position for {int} block', (option, index) => {
    cy.get('select[name*="image_position"]').eq(index - 2).select(option)
});




And('user uploads {string} as {int} guide card image', (fileName, index) => {
    cy.fixture(fileName, { encoding: null }).as('fixture')
    cy.get(`input[type="file"][name*="guide_cards_${index - 1}"]`).selectFile('@fixture')
    cy.get('.throbber', { timeout: 40000 }).should('not.exist')
})

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

And('user selects {string} as promo image for {int} block', (name, index) => {
    cy.get(`summary[aria-controls*="edit-field-override-image-promotional"]`).click();
    cy.wait(500);
    cy.get('input[name*="override_image_promotional_entity_browser"]').click({ force: true })
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find('input#edit-name').type(name)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find('input[id*="edit-submit-cgov-image-media-browser"]').click()
    cy.wait(1500)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input.form-checkbox").eq(0).click()
    cy.wait(1500)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click()
})

And('tagline button has text {string} with link {string}', (btnText, href) => {
    if (href.includes("{TEST_SITE_SECTION}")) {
        href = href.replace("{TEST_SITE_SECTION}", siteSection)
    }
    cy.get('.nci-hero__cta.nci-hero__cta--with-button a').should('include.text', btnText).and('have.attr', 'href', `${href}-${randomStr}`)
})

Then('NCIDS guide cards have the following attributes', (dataTable) => {
    for (let { index, title, description, btnLinkAndText, source, file, exitDisclaimer } of dataTable.hashes()) {
        if (baseUrl.includes('cms-dev') || baseUrl.includes('cms-test')) {
            source = source.replace('\\/sites\\/default', '\\/sites\\/www')
        }
        cy.get('.nci-guide-card__header').eq(index).invoke('text').then((text) => {
            expect(text.trim()).equal(title);
        });
        cy.get('p.nci-guide-card__description').eq(index).invoke('text').then((text) => {
            expect(text.trim()).equal(description);
        });
        const button = btnLinkAndText.split(';')
        for (let i = 0; i < button.length; i++) {
            const linkAndText = button[i].split(',');
            let link = linkAndText[1];
            if (link.includes("{TEST_SITE_SECTION}")) {
                link = link.replace("{TEST_SITE_SECTION}", siteSection)
            }
            cy.get('.nci-guide-card__wrapper').eq(index).find('a').eq(i).as('link').should('include.text', linkAndText[0])
            if (linkAndText[1].includes('http')) {
                cy.get('@link').should('have.attr', 'href', `${linkAndText[1]}`)
            } else {
                cy.get('@link').should('have.attr', 'href', `${link}-${randomStr}`)
            }
        }

        cy.get('.nci-guide-card__wrapper').eq(index).find('img').invoke('attr', 'src').then((fullSrc) => {

            if (baseUrl.includes('cms-dev') || baseUrl.includes('cms-test')) {
                fullSrc = fullSrc.replace('/sites/www', '/sites/default')
            }
            expect(fullSrc.includes(`${source}`)).to.be.true;

            const src1 = fullSrc.substring(0, fullSrc.indexOf('?'));
            if (file.includes('placeholder')) {
                expect(src1).to.match(new RegExp(`.*\/${file}`))
            } else {
                expect(src1).to.match(new RegExp(`.*\\d{4}-\\d{2}\/${file}`))
            }
        });


        const indexes = exitDisclaimer.split(';')[0].split(',')
        const value = exitDisclaimer.split(';')[1].split(',')
        for (const newIndex of indexes) {
            cy.get('.nci-guide-card__wrapper').eq(index).find('a').eq(newIndex).as('link')
            if (value[newIndex] === 'N/A') {

                cy.get('@link').hasPseudoElement('::after')
                    .should('eq', false)
            }
            else {
                cy.get('@link').hasPseudoElement('::after')
                    .should('eq', true)
            }
        }

    }
})

And('NCIDS promo blocks have the following attributes', (dataTable) => {

    for (let { index, title, description, link, buttonText, source, file, srcset, srcSetImg, exitDisclaimer } of dataTable.hashes()) {
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace("{TEST_SITE_SECTION}", siteSection)
        }
        if (baseUrl.includes('cms-dev') || baseUrl.includes('cms-test')) {
            source = source.replace('\\/sites\\/default', '\\/sites\\/www')
            srcset = srcset.replace('\\/sites\\/default', '\\/sites\\/www')

        }

        cy.get('div[class*="nci-promo-block "]').eq(index).as('promoBlock');

        cy.get('@promoBlock').find('h2').invoke('text').then((text) => {
            expect(text.trim()).equal(title);
        });

        if (description === 'N/A') {
            cy.get('@promoBlock').find('p').should('not.exist')
        }
        else {
            cy.get('@promoBlock').find('p').invoke('text').then((text) => {
                expect(text.trim()).equal(description);
            });
        }

        cy.get('@promoBlock').find('a').invoke('attr', 'href').then(href => {
            if (href.startsWith('http')) {
                expect(href).to.eq(link)
            } else {
                expect(href).to.eq(`${getBaseDirectory()}${link}-${randomStr}`)
            }
        })

        cy.get('@promoBlock').find('a').invoke('text').then((text) => {
            expect(text.trim()).equal(buttonText);
        });

        if (source === 'N/A') {
            cy.get('@promoBlock').find('img').should('not.exist');
        } else {
            cy.get('@promoBlock').find('img').invoke('attr', 'src').then((fullSrc) => {

                if (baseUrl.includes('cms-dev') || baseUrl.includes('cms-test')) {
                    fullSrc = fullSrc.replace('/sites/www', '/sites/default')

                }
                expect(fullSrc.includes(`${source}`)).to.be.true;
            });
        }

        if (file === 'N/A') {
            cy.get('@promoBlock').find('img').should('not.exist');
        } else {

            cy.get('@promoBlock').find('img').invoke('attr', 'src').then((fullSrc) => {

                const src1 = fullSrc.substring(0, fullSrc.indexOf('?'));
                expect(src1).to.match(new RegExp(`.*\\d{4}-\\d{2}\/${file}`))
            });
        }
        if (srcset === 'N/A') {
            cy.get('@promoBlock').find('picture source').should('not.exist');
        } else {

            cy.get('@promoBlock').find('picture source').invoke('attr', 'srcset').then((fullSrc) => {

                if (baseUrl.includes('cms-dev') || baseUrl.includes('cms-test')) {
                    fullSrc = fullSrc.replace('/sites/www', '/sites/default')
                }
                expect(fullSrc.includes(`${srcset}`)).to.be.true;
            });
        }
        if (srcSetImg === 'N/A') {
            cy.get('@promoBlock').find('picture source').should('not.exist');
        } else {

            cy.get('@promoBlock').find('picture source').invoke('attr', 'srcset').then((fullSrc) => {
                const src1 = fullSrc.substring(0, fullSrc.indexOf('?'));
                expect(src1).to.match(new RegExp(`.*\\d{4}-\\d{2}\/${srcSetImg}`))
            });
        }

        if (exitDisclaimer === 'N/A') {
            cy.get('@promoBlock').find('a').hasPseudoElement('::after')
                .should('eq', false)
        } else {
            cy.get('@promoBlock').find('a').hasPseudoElement('::after')
                .should('eq', true)
        }
    }
});


And('NCIDS feature cards have the following attributes', (dataTable) => {

    for (let { index, title, description, link, source, file, exitDisclaimer } of dataTable.hashes()) {
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace("{TEST_SITE_SECTION}", siteSection)
        }
        if (baseUrl.includes('cms-dev') || baseUrl.includes('cms-test')) {
            source = source.replace('\\/sites\\/default', 'automation-installed\/sites\/autoinstalled')
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
                fullSrc = fullSrc.replace('/sites/www', '/sites/default')
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

When('user clicks on the {string} button', (deleteBtn) => {
    cy.get(`input[id='edit-submit'][value='${deleteBtn}']`).click({ force: true });
});

And('user selects {string} from Save as dropdown', (dropdown) => {
    cy.get("select[name='moderation_state[0][state]").select(dropdown)
})

Then('NCIDS 3 guide card row at position {int} have the following attributes', (pos, dataTable) => {
    for (const { index, title, btnLinkAndText, exitDisclaimer } of dataTable.hashes()) {
        cy.get('ul.nci-card-group').eq(pos - 1).as('row');
        cy.get('@row').find('.nci-guide-card__title').eq(index).invoke('text').then((text) => {
            expect(text.trim()).equal(title);
        });



        const button = btnLinkAndText.split(';')
        for (let i = 0; i < button.length; i++) {
            const linkAndText = button[i].split(',');
            cy.get('@row').find('.nci-guide-card__wrapper').eq(index).find('a').eq(i).as('link').should('include.text', linkAndText[0])
            let link = linkAndText[1];

            if (link.includes("{TEST_SITE_SECTION}")) {
                link = link.replace("{TEST_SITE_SECTION}", siteSection)
            }

            if (link.includes('http')) {
                cy.get('@link').should('have.attr', 'href', `${link}`)
            } else {
                cy.get('@link').should('have.attr', 'href', `${getBaseDirectory()}${link}-${randomStr}`)
            }
        }

        const links = exitDisclaimer.split(';')

        for (const newLink of links) {
            const linkValues = newLink.split(',')
            cy.get('@row').find('.nci-guide-card__wrapper').eq(index).find('a').eq(linkValues[0]).as('link')
            if (linkValues[1] === 'N/A') {

                cy.get('@link').hasPseudoElement('::after')
                    .should('eq', false)
            }
            else {
                cy.get('@link').hasPseudoElement('::after')
                    .should('eq', true)
            }
        }
    }
})

And('user clicks on Select content button item', () => {
    cy.get(`input[value="Select content"]`).trigger("click")
})

And('user clicks on {string} button for {string}', (edit, section) => {
    cy.get(`span.paragraph-type-label:contains('${section}')`).parent().parent().find(`input[value="${edit}"]`).click();
});


And('user selects {string} from {int} External Link Display dropdown number {int}', (option, index, dropdownIndex) => {
    cy.get(`select[id*='edit-field-landing-contents-${index - 1}-subform-field-row-cards-${dropdownIndex}-subform-field-external-link-display']`).select(option)

})

And('{int} cta strip link has text {string} with a link {string} and exit disclaimer is {string}', (index, text, href, exitDisclaimer) => {
    cy.get('ul.nci-cta-strip a').eq(index - 1).as('ctaLink');
    cy.get('@ctaLink').should('include.text', text)
    cy.get('@ctaLink').should('have.attr', 'href', href)
    if (exitDisclaimer.toLowerCase() === 'displayed') {
        cy.get('@ctaLink').hasPseudoElement('::after')
            .should('eq', true)
    } else {
        cy.get('@ctaLink').hasPseudoElement('::after')
            .should('eq', true)
    }
})

And('user clicks on {int} edit paragraph button', (index) => {
    cy.get(`input[id*="field-landing-contents-${index - 1}-edit"]`).click()
})


And('user clicks on {int} edit cta strip', (index) => {
    cy.get(`input[id*='field-landing-contents-${index - 1}-subform-field-cta-link-buttons-0-edit']`).click()
})

And('user selects {string} from cta External Link Display dropdown number {int}', (value, index) => {
    cy.get(`select[id*='edit-field-landing-contents-0-subform-field-cta-link-buttons-${index - 1}-subform-field-external-link-display']`).select(value)
})

And('user clicks on {int} guide card edit link {int}', (cardIndex, linkIndex) => {
    cy.get(`input[id*=field-landing-contents-${cardIndex - 1}-subform-field-image-desc-guide-cards-${linkIndex}-subform-field-link-buttons-0-edit]`)

})

And('user selects {string} from {int} guide card External Link Display dropdown number {int}', (value, cardIndex, linkIndex) => {
    cy.get(`select[id*='edit-field-landing-contents-${cardIndex - 1}-subform-field-image-desc-guide-cards-1-subform-field-link-buttons-${linkIndex}-subform-field-external-link-display']`).select(value)
})

And('user selects {string} from promo block External Link Display dropdown number {int}', (value, index) => {
    cy.get(`select[id*='edit-field-landing-contents-${index - 1}-subform-field-external-link-display']`).select(value)
})