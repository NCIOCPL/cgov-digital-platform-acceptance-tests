/// <reference types="Cypress" />
import { Then } from "cypress-cucumber-preprocessor/steps";
import { getBaseDirectory } from '../../utils';

Then('NCIDS feature cards are visible', () => {
    cy.get('section[class*="cgdp-feature-card-row"] .nci-card__body').should('be.visible');
});

And('NCIDS feature cards have the following attributes', (dataTable) => {

    for (const { index, title, description, link, altText, source, file } of dataTable.hashes()) {
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
    cy.get('h1.cgdp-title-area__page-title').should('have.text', title)
});
And('NCIDS subheading is {string}', (subheading) => {
    cy.get('.cgdp-title-area__subheading').should('have.text', subheading)
});
And('NCIDS feature card row heading at position {int} is {string}', (index, featCardHeading) => {
    cy.get('.cgdp-feature-card-row__heading').eq(index - 1).should('have.text', featCardHeading)
});

Then('NCIDS guide cards have the following attributes', (dataTable) => {
    for (const { index, title, description, btnLinkAndText } of dataTable.hashes()) {

        cy.get('.nci-guide-card__header').eq(index).invoke('text').then((text) => {
            expect(text.trim()).equal(title);
        });
        cy.get('p.nci-guide-card__description').eq(index).invoke('text').then((text) => {
            expect(text.trim()).equal(description);
        });
        const button = btnLinkAndText.split(';')
        for (let i = 0; i < button.length; i++) {
            const linkAndText = button[i].split(',');
            cy.get('.nci-guide-card__wrapper').eq(index).find('a').eq(i).as('link').should('include.text', linkAndText[0])
            cy.get('@link').should('have.attr', 'href', linkAndText[1])
        }
    }
})
