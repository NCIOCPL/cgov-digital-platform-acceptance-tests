/// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';
import { getBaseDirectory } from '../../../utils';

//This step is just a workaround until it gets fixed
Given('user is navigating to {string}', (a) => {
    Cypress.on('uncaught:exception', (err, runnable) => {
        // we expect a 3rd party library error with message like 'list not defined' etc.
        // and don't want to fail the test so we return false
        if (err.message.includes(`Cannot read property 'getAttribute' of undefined`)) {
            return false
        }
    });
    cy.visit(a);
});

Then('pdq citation section is visible', () => {
    cy.get('div.pdq-sections > ol').should('be.visible');
});

And('pdq citation section number {int} header text is {string}', (num, headerText) => {
    cy.get('div.pdq-sections > h6').eq(num - 1).should('be.visible').and('have.text', headerText);
});

And('pdq citation number {string} is a PubMed link with an url {string}', (pubMedLinkNumber, linkUrl) => {
    const linkPath = linkUrl.split(',');
    const number = pubMedLinkNumber.split(',');
    for (let i = 0; i < linkPath.length; i++) {
        if (linkPath[i].startsWith('http')) {
            cy.get(`li[id*='section']`).eq(number[i]).find('a').should('have.attr', 'href', linkPath[i]);
        } else {
            cy.get(`li[id*='section']`).eq(number[i]).find('a').should('have.attr', 'href', `${getBaseDirectory()}${linkPath[i]}`);
        }
    }
});

And('citation section number {int} has a total number of pub med citations of {int}', (num, totalPubMed) => {
    cy.get('div.pdq-sections > ol').eq(num - 1).find(`a[title*='PubMed']`).should('have.length', totalPubMed);
});

And('pdq citation section number {int} has a total number of citations of {int}', (num, totalPdqCitation) => {
    cy.get('div.pdq-sections > ol').eq(num - 1).find('li').should('have.length', totalPdqCitation);
});

And('all of the citations in the pdq citation section number 1 are within reasonable text length', () => {
    cy.document().then(document => {
        const allCitationsInSection1 = document.querySelector(`${'div.pdq-sections>ol'}:nth-of-type(1)`).childElementCount;
        for (let i = 0; i < allCitationsInSection1; i++) {
            cy.get('div.pdq-sections > ol > li').eq(i).invoke('text').then((text) => {
                expect(text.length).to.be.greaterThan(20).lessThan(300);
            });
        }
    });
});

Then('pdq citation section does not exist', () => {
    cy.get('div.pdq-sections > ol').should('not.exist');
});




