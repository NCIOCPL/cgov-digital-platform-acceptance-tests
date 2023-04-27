/// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';
import { getBaseDirectory } from '../../../utils';
Then('feature cards are visible', () => {
    cy.get('.feature-primary .feature-card').should('be.visible');
});

And('number of feature cards is {int}', (count) => {
    cy.get('.feature-primary .feature-card').should('have.length', count);
});

And('feature cards at positions {string} have {string} as {string}', (indexes, component, value) => {
    const expectedIndex = indexes.split(',');
    for (let i = 0; i < expectedIndex.length; i++) {
        switch (component) {
            case 'titles':
                const expectedTitle = value.split(',');
                cy.get('.feature-primary .feature-card').eq(expectedIndex[i]).find('h3').invoke('text').then((text) => {
                    expect(text.trim()).equal(expectedTitle[i]);
                });
                break;
            case 'descriptions':
                const expectedDescription = value.split(',');
                if (expectedDescription[i] == 'null') {
                    cy.get('.feature-primary .feature-card').eq(expectedIndex[i]).find('p').should('not.exist');
                }
                else {
                    cy.get('.feature-primary .feature-card').eq(expectedIndex[i]).find('p').invoke('text').then((text) => {
                        expect(text.trim()).equal(expectedDescription[i]);
                    });
                }
                break;
            case 'links':
                const expectedItemLink = value.split(',');
                cy.get('.feature-primary .feature-card > a').eq(expectedIndex[i]).invoke('attr', 'href').then(href => {
                    if (href.startsWith('http')) {
                        expect(href).to.eq(expectedItemLink[i])
                    } else {
                        expect(href).to.eq(`${getBaseDirectory()}${expectedItemLink[i]}`)
                    }
                })

                break;
            case 'alt texts':
                const expectedAltText = value.split(',');
                cy.get('.feature-primary .feature-card').eq(expectedIndex[i]).find('img').should('have.attr', 'alt', expectedAltText[i]);
                break;
            case 'sources':
                cy.get('.feature-primary .feature-card').eq(expectedIndex[i]).find('img').invoke('attr', 'src').then((fullSrc) => {
                    expect(fullSrc.includes(`${value}`)).to.be.true;
                });
                break;
            case 'files':
                const expectedFile = value.split(',');
                cy.get('.feature-primary .feature-card').eq(expectedIndex[i]).find('img').invoke('attr', 'src').then((fullSrc) => {
                    const src1 = fullSrc.substring(0, fullSrc.indexOf('?itok'));
                    expect(src1.endsWith(expectedFile[i])).to.be.true;
                });
                break;
            case 'exit notification link href':
                const expectedHref = value.split(',');
                cy.get('.feature-primary .feature-card').eq(expectedIndex[i]).find('a.icon-exit-notification').should('be.visible').and('have.attr', 'href', `${expectedHref[i]}`);
                break;
        }
    }
});

And('the number of exit disclaimers is {int}', (externalLinkCount) => {
    cy.get('.feature-primary .feature-card').find('a.icon-exit-notification').should('have.length', externalLinkCount);
});


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
            console.log('source',fullSrc)
            expect(fullSrc.includes(`${source}`)).to.be.true;
        });

        cy.get('@featureCard').parent().find('img').invoke('attr', 'src').then((fullSrc) => {
            const src1 = fullSrc.substring(0, fullSrc.indexOf('?'));
            console.log(src1)
            expect(src1.endsWith(file)).to.be.true;
        });

    }
});
