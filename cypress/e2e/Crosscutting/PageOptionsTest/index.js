// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';

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

Then('the following {string} buttons are displayed at top and bottom of the page', (pageOptions) => {
    const pOptions = pageOptions.split(',');
    pOptions.forEach(option => {
        cy.get(`div.cgdp-page-options.cgdp-page-options--top svg[aria-labelledby="${option}-title"]`).should('be.visible');
        cy.get(`div.cgdp-page-options.cgdp-page-options--bottom svg[aria-labelledby="${option}-title"]`).should('be.visible');
    })
});



Then('the page options are not displayed', () => {
    cy.get('div.cgdp-page-options.cgdp-page-options').should('not.be.visible');
});

Then('the page options do not exist', () => {
    cy.get('div.cgdp-page-options.cgdp-page-options').should('not.exist');
});

When('user clicks on {string} share option', (shareOption) => {
    if (shareOption === 'print') {
        cy.window().then(win => {
            //same approach we used on platform testig and it works, in the app it does not!(
            //stubbing the print window to prevent the call to open it, 
            //but still triggering the click event
            const printStub = cy.stub(win, 'print')
            cy.get('div.cgdp-page-options.cgdp-page-options--top > button').trigger('click');

        })

    } else if (shareOption === 'email') {
        cy.get('div.cgdp-page-options.cgdp-page-options--top > a').invoke('removeAttr', 'target')
        cy.get('div.cgdp-page-options.cgdp-page-options--top > a')
            .then(button$ => {
                button$.on('click', e => {
                    //this is useless since cypress still waits for a new page to load 
                    // and it never loads - timeout and fail!
                    e.preventDefault();
                });
            })
            .click({ followRedirect: false });

    }
});

Then('email page option will pre-populate email subject line with {string}', (subjectLine) => {
    cy.get('div.cgdp-page-options.cgdp-page-options--top > a').invoke('attr', 'href').then(href => {
        expect(href).to.include(`subject=${subjectLine}`);
    })
});
And('email body will have the following text {string}', (bodyText) => {
    cy.get('div.cgdp-page-options.cgdp-page-options--top > a').invoke('attr', 'href').then(href => {
        expect(href).to.include(`body=${bodyText}`);
    })
});
And('email body will contain shared page url as {string}', (url) => {

    cy.get('div.cgdp-page-options.cgdp-page-options--top > a').invoke('attr', 'href').then(href => {
        cy.location('host').then(host => {
            const currentUrl = url.replace('{CANONICAL_HOST}', host);
            expect(href).to.include(currentUrl);
        })
    })
});