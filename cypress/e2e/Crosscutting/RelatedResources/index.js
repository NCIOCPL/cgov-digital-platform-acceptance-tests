/// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';
import { getBaseDirectory } from '../../../utils';
And('related resources section is visible', () => {
    cy.get('.cgdp-related-resources').should('be.visible');
});

And('related resources have working link {string} with the href {string}', (linkText, linkHref) => {
    cy.get('.cgdp-related-resources ul').find('a').first().invoke('text').should('be.eq', linkText);
    cy.get('.cgdp-related-resources ul').find('a').should('have.attr', 'href').and('eq', `${getBaseDirectory()}${linkHref}`);
});

And('exit disclaimer is visible {string}', (exitDisclaimer) => {
    const indexes = exitDisclaimer.split(';')
console.log(indexes)
    for (let i = 0; i < indexes.length; i++) {
        console.log(indexes[i].split(',')[0])
        cy.get('.cgdp-related-resources ul').find('a').eq(indexes[i].split(',')[0]).as('link')
        if (indexes[i].split(',')[1] === 'N/A') {

            cy.get('@link').hasPseudoElement('::after')
                .should('eq', false)
        }
        else {
            cy.get('@link').hasPseudoElement('::after')
                .should('eq', true)
        }
    }
});


Then('related resources section does not exist', () => {
    cy.get('.cgdp-related-resources').should('not.exist');
});

And('exit disclaimer is not visible', () => {
    cy.get('.cgdp-related-resources').find('a').hasPseudoElement('::after')
        .should('eq', false)
});
