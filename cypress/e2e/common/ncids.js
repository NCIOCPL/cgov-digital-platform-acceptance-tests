/// <reference types="Cypress" />
import { Then } from "cypress-cucumber-preprocessor/steps";
import { getBaseDirectory } from '../../utils';
const baseUrl = Cypress.config('baseUrl');

Then('NCIDS feature cards are visible', () => {
    cy.get('section[class*="cgdp-feature-card-row"] .nci-card__body').should('be.visible');
});

And('NCIDS feature cards have the following attributes', (dataTable) => {

    for (let { index, title, description, link, altText, source, file } of dataTable.hashes()) {
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
                expect(href).to.eq(`${getBaseDirectory()}${link}`)
            }
        })

        cy.get('@featureCard').parent().find('img').should('have.attr', 'alt', altText);

        cy.get('@featureCard').parent().find('img').invoke('attr', 'src').then((fullSrc) => {
            const modifiedSrc = fullSrc.replace(/\?.*/, '')
            expect(modifiedSrc).to.match(new RegExp(source))
        });


    }
});

Then('NCIDS page title is {string}', (title) => {
    cy.get('div[class*="usa-section"] h1.cgdp-title-area__page-title').should('have.text', title)
});
And('NCIDS subheading is {string}', (subheading) => {
    cy.get('.cgdp-title-area__subheading').should('have.text', subheading)
});
And('NCIDS feature card row heading at position {int} is {string}', (index, featCardHeading) => {
    cy.get('.cgdp-feature-card-row__heading').eq(index - 1).should('have.text', featCardHeading)
});

Then('NCIDS guide cards have the following attributes', (dataTable) => {
    for (let { index, title, description, btnLinkAndText } of dataTable.hashes()) {

        cy.get('div[class*="cgdp-guide-card-row"] h2.nci-guide-card__header').eq(index).invoke('text').then((text) => {
            expect(text.trim()).equal(title);
        });
        cy.get('p.nci-guide-card__description').eq(index).invoke('text').then((text) => {
            expect(text.trim()).equal(description);
        });
        const button = btnLinkAndText.split(';')
        for (let i = 0; i < button.length; i++) {
            const linkAndText = button[i].split('|');
            cy.get('.nci-guide-card__wrapper').eq(index).find('a').eq(i).as('link').should('include.text', linkAndText[0])
            if (linkAndText[1].includes('http')) {
                cy.get('@link').should('have.attr', 'href', `${linkAndText[1]}`)
            } else {
                cy.get('@link').should('have.attr', 'href', `${getBaseDirectory()}${linkAndText[1]}`)
            }
        }
    }
})
And('NCIDS promo blocks have the following attributes', (dataTable) => {


    for (let { index, title, description, link, buttonText, source } of dataTable.hashes()) {
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
                expect(href).to.eq(`${getBaseDirectory()}${link}`)
            }
        })

        cy.get('@promoBlock').find('a').invoke('text').then((text) => {
            expect(text.trim()).equal(buttonText);
        });

        if (source === 'N/A') {
            cy.get('@promoBlock').find('img').should('not.exist');
        } else {
            if (baseUrl.includes('acsf')) {
                source = source.replace('\\/sites\\/default', 'automation-installed\/sites\/autoinstalled')

            }
            cy.get('@promoBlock').find('img').invoke('attr', 'src').then((fullSrc) => {
                const modifiedSrc = fullSrc.replace(/\?.*/, '')

                expect(modifiedSrc).to.match(new RegExp(source))
            });
        }

    }
});


And('CTA strip has the following links', (dataTable) => {
    cy.get('div[class*="usa-section"] ul.nci-cta-strip').as('cta').should('be.visible')
    for (let { title, link } of dataTable.hashes()) {
        if (link.includes('http')) {
            cy.get('@cta').find(`a[href="${link}"]`).should('include.text', title);
        } else {
            cy.get('@cta').find(`a[href="${getBaseDirectory()}${link}"]`).should('include.text', title);
        }
    }
})

And('NCIDS Hero is displayed', () => {
    cy.get('div[class*="usa-section"] .nci-hero > .nci-hero__image').should('be.visible')
})
And('tagline title reads {string}', (title) => {
    cy.get('h2.nci-hero__cta-tagline').should('have.text', title)
})
And('tagline button has text {string} with link {string}', (btnText, href) => {
    cy.get('.nci-hero__cta.nci-hero__cta--with-button a').should('include.text', btnText).and('have.attr', 'href', href);
})
And("tagline button doesn't exist", () => {
    cy.get('.nci-hero__cta.nci-hero__cta--with-button a').should('not.exist')
})

When('user clicks on tagline button', () => {
    cy.get('.nci-hero__cta.nci-hero__cta--with-button a').trigger('click', { followRedirect: false })
})

When('user clicks on cta link at position {int}', (index) => {
    cy.get('ul.nci-cta-strip a').eq(index - 1).trigger('click', { followRedirect: false })
});
When('user clicks on {string} button on a {int} NCIDS guide card', (btnText, cardIndex) => {
    cy.get('.nci-guide-card__body').eq(cardIndex - 1).find(`a:contains("${btnText}")`).trigger('click', { followRedirect: false })
})

When('user clicks on NCIDS feature card at position {int}', (cardIndex) => {
    cy.get('li[class^="nci-card"]').eq(cardIndex - 1).find('img').trigger('click', { followRedirect: false })
})

When('user clicks on NCIDS promo block at position {int}', (cardIndex) => {
    cy.get('div[class^="nci-promo-block "]').eq(cardIndex - 1).find('a').trigger('click', { followRedirect: false })
})

And('NCIDS {string} component does not have {string} but has header {string} attributes', (component, aria, id) => {
    cy.get(`div[class*="${component}"]`).as('component').should('not.have.attr', aria);
    cy.get('@component').find('h2').should('have.attr', id).then(idValue => {
        cy.get('@component').find('ul').should('have.attr', aria, idValue)
    });

});

And('NCIDS component has {string} and {string} attributes', (aria, id) => {
    let attrValue;
    cy.get('section[class*="usa-section"]').each($el => {
        attrValue = $el[0].getAttribute(aria);
        cy.wrap($el).find('h2').should('have.attr', id, attrValue)
    })
})

When('user clicks on link {string} in raw html block', (href) => {
    cy.get(`a[href="${href}"]`).trigger('click', { followRedirect: false })
});

And('the {int} NCIDS 3 guide card row has a heading {string}', (pos, title) => {
    cy.get('section[class*="cgdp-guide-card-row"] h2').eq(pos - 1).should('have.text', title)
});

And('the {int} NCIDS 3 guide card row has no heading', (pos) => {
    cy.get('div[class*="cgdp-guide-card-row"]').eq(pos - 1).find('h2.nci-guide-card__header').should('not.exist')
});

Then('NCIDS 3 guide card row at position {int} have the following attributes', (pos, dataTable) => {
    for (const { index, title, btnLinkAndText } of dataTable.hashes()) {
        cy.get('ul.nci-card-group').eq(pos - 1).as('row');
        cy.get('@row').find('.nci-guide-card__title').eq(index).invoke('text').then((text) => {
            expect(text.trim()).equal(title);
        });

        const button = btnLinkAndText.split(';')
        for (let i = 0; i < button.length; i++) {
            const linkAndText = button[i].split('|');
            cy.get('@row').find('.nci-guide-card__wrapper').eq(index).find('a').eq(i).as('link').should('include.text', linkAndText[0])
            if (linkAndText[1].includes('http')) {
                cy.get('@link').should('have.attr', 'href', `${linkAndText[1]}`)
            } else {
                cy.get('@link').should('have.attr', 'href', `${getBaseDirectory()}${linkAndText[1]}`)
            }
        }
    }
})

Then('two column container is visible', () => {
    cy.get('div.usa-section.usa-section--light div.grid-container').should('be.visible')
})
And('NCIDS dynamic list shows items with date and the following', (dataTable) => {
    cy.get('div.cgdp-dynamic-list').as('list');
    cy.get('@list').find('li.usa-collection__item').each(($el) => {
        for (const { component } of dataTable.hashes()) {
            cy.wrap($el).find(`.usa-collection__${component}`).should('be.visible');
            cy.wrap($el).find('time').should('exist');
        }
    })
})

And('view more button {string} is a link', (linkText) => {
    cy.get('div[class*="cgdp-dynamic-list__view-more-button"]').find('a')
        .should('include.text', linkText).and('have.attr', 'href')
});


And('the right rail links have {string} attribute with value {string}', (attr, value) => {
    cy.get('div[class*="grid-col-4 ncids"] a').each($el => {
        cy.wrap($el).should('have.attr', attr, value)
    })
});


And('console log outputs {string}', (message) => {
    cy.window().then((win) => {
        expect(win.console.log).to.have.callCount(1);
        expect(win.console.log).to.be.calledWith(message)
    });


});

And('tagline displays in color {string}', (color) => {
    cy.get('.nci-hero__cta-tagline')
        .should('have.css', 'color')
        .and('eq', color)
});