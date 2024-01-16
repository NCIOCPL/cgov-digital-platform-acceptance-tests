/// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';
const baseUrl = Cypress.config('baseUrl');

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

And('the page contains og:site_name meta tags with the following properties', (dataTable) => {
    cy.document().then((doc) => {
        for (const { property, content } of dataTable.hashes()) {
            const locator = `META[property='${property}']`;
            //find element, ensure it has attribute content
            //compare content's value with expected one
            cy.get(locator).should('have.length', 1).invoke('attr', 'content').then((value) => {
                expect(value.endsWith(content)).to.be.true;
            });
        }
    });
});

And('the page contains dcterms.issued meta tags with the following names', (dataTable) => {
    cy.document().then((doc) => {
        for (const { name, content } of dataTable.hashes()) {
            if (content.includes('null')) {
                const locator = `meta[name='${name}']`;
                cy.get(locator).should('not.exist');
            }
            else {
                const locator = `meta[name='${name}']`;
                //find element, ensure it has attribute content
                //compare content's value with expected one
                const regex = new RegExp(content);
                cy.get(locator).should('have.length', 1).and('have.attr', 'content').and('match', regex);
            }
        }
    });
});


And('{string} tag contains expected environment value', (tagName) => {
    const domains = new Map([
        ['ncigovcdode', 'ode'],
        ['www-dev-ac.cancer.gov', 'dev'],
        ['www-test-ac.cancer.gov', 'staging'],
        ['www-int-ac.cancer.gov', 'int'],
        ['devbox', 'local'],
        ['www-test-acsf.cancer.gov/automation-installed', 'automation0installed-test'],
        ['www-test-acsf.cancer.gov/automation-refreshed', 'automation0refreshed-test'],
        ['www-dev-acsf.cancer.gov/automation-installed', 'automation0installed-dev'],
        ['www-dev-acsf.cancer.gov/automation-refreshed', 'automation0refreshed-dev'],
       
    ])
    const value = () => {
        for (let [key, value] of domains.entries()) {
            if (baseUrl.includes(key)) {
                return value;
            }
        }

    };
    const locator = `meta[name='${tagName}']`;
    cy.get(locator).should('have.length', 1).and('have.attr', 'content', value())
});







