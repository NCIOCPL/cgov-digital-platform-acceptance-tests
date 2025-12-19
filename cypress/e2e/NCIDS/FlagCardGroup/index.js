/// <reference types="Cypress" />
import { When } from "cypress-cucumber-preprocessor/steps";
import { getBaseDirectory } from '../../../utils';
const baseUrl = Cypress.config('baseUrl');
When('the optional flag card group heading is {string}', (title) => {
    cy.get(`h2`).should('have.text', title);
});


And('NCIDS flag cards have the following attributes', (dataTable) => {

    for (let { index, title, description, link, altText, source, file } of dataTable.hashes()) {
        
        if (baseUrl.includes('acsf')) {
            source = source.replace('\/sites\/default', 'automation-installed\/sites\/autoinstalled')

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
            if (href.startsWith('http')) {
                expect(href).to.eq(link)
            } else {
                expect(href).to.eq(`${getBaseDirectory()}${link}`)
            }
        })

        cy.get('@featureCard').find('img').should('have.attr', 'alt', altText);

       
        cy.get('@featureCard').find('img').invoke('attr', 'src').then((fullSrc) => {
            const modifiedSrc = fullSrc.replace(/\?.*/, '')

            expect(modifiedSrc).to.match(new RegExp(source))
            // expect(fullSrc.includes(`${source}`)).to.be.true;
        });

        cy.get('@featureCard').find('img').invoke('attr', 'src').then((fullSrc) => {
            const src1 = fullSrc.substring(0, fullSrc.indexOf('?'));
            expect(src1.endsWith(file)).to.be.true;
        });

    }
});



When('user clicks on {int} flag card', (index) => {
    cy.get(`.cgdp-flag-card a`).eq(index - 1).then(link$ => {
        link$.on('click', e => {
            e.preventDefault();
        });
    })
        .click({ followRedirect: false });
});

