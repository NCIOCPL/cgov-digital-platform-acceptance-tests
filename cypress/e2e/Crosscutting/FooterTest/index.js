/// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';
import { getBaseDirectory } from "../../../utils";
Given('user is navigating to {string}', (a) => {
    cy.visit(a);
    Cypress.on('uncaught:exception', (err, runnable) => {
        // we expect a 3rd party library error with message `Cannot read property 'getAttribute' of undefined`
        // and don't want to fail the test so we return false
        if (err.message.includes(`Cannot read property 'getAttribute' of undefined`)) {
            return false
        }
        // we still want to ensure there are no other unexpected
        // errors, so we let them fail the test
    })
});

Then('footer section is visible', () => {
    cy.get('#nci-footer').should('be.visible');
});

And('there is only one footer on a page', () => {
    cy.get('#nci-footer').should('have.length', 1);
});

And('footer header text is {string}', (header) => {
    cy.get('p.usa-footer__logo-heading').should('include.text', header);
});

And('footer text is within reasonable range', () => {
    cy.get('#nci-footer').invoke('text').then((text) => {
        expect(text.length).to.be.greaterThan(400).lessThan(800);
    });
});

And('the footer text does not contain any broken links', () => {
    cy.document().then(document => {
        const allAnchorTags = document.querySelectorAll("#nci-footer a");
        for (let i = 0; i < allAnchorTags; i++) {
            cy.get('#nci-footer a').eq(i).invoke('attr', href).then((href) => {
                expect(href.length).to.be.greaterThan(0);
            });
        }
    });
});

Then('clicking on {string} link with href {string} in the footer opens a chat pop-up', (linkName, href) => {
    cy.get(`#nci-footer a:contains('${linkName}')`).should('have.attr','href').and('eq',href);
});
And('clicking on {string} link in the footer opens a {string} survey', (linkName, href) => {
    cy.get(`#nci-footer a:contains(${linkName})`).should('have.attr', 'href').and('include', href);
});
And('{string} heading is present', (heading) => {
    cy.get('#nci-footer div.usa-sign-up__heading').should('include.text', heading);
});
And('the {string} input box is present', (label) => {
    cy.get(`#nci-footer input#${label}`).should('be.visible');
});
And('{string} button is visible', (buttonText) => {
    cy.get('#nci-footer button').should('include.text', buttonText);
});
When('user clicks on {string} button', (signUp) => {
    cy.get('#nci-footer button').contains(signUp).click();
});

Then('the error message {string} is displayed', (errorMessage) => {
    cy.get('#nci-footer span.usa-error-message').should('be.visible').and('have.text', errorMessage);
});

And('footer is broken into {int} sections', (sectionNum) => {
    cy.get('#nci-footer').find('div[class$="-section"]').should('have.length', sectionNum);
});

And('link {string} links to {string}', (linkName, href) => {
    cy.get(`#nci-footer a:contains('${linkName}')`).should('be.visible').and('have.attr','href').and('eq',`${getBaseDirectory()}${href}`);
});

And('the {string} are displayed', (socialMediaIcons, area) => {
    const icons = socialMediaIcons.split(',');
    cy.get('#nci-footer a.usa-social-link').should('have.length', icons.length);
    icons.forEach(icon => {
        cy.get(`#nci-footer title:contains('${icon}')`).parent('svg').should('be.visible');
    });
})

Then('there are {int} accordion sections in the footer', (num) => {
    cy.get("#nci-footer section[class$='collapsible']").should('have.length', num);
});
And("the following links have become section's headers", (dataTable) => {
    for (const { header } of dataTable.hashes()) {
        cy.get("#nci-footer section[class$='collapsible']").find(`div.usa-footer__primary-link:contains('${header}')`).should('be.visible');
    }
})
And('sections are collapsed', () => {
    cy.get("#nci-footer section[class$='collapsible'] button").each($el => {
        cy.wrap($el).should('have.attr', 'aria-expanded', 'false');
    });
});
When('user clicks on {string} link header', (header) => {
    cy.get("#nci-footer section[class$='collapsible']").find(`div:contains('${header}')`).click();
});
Then('following are the states of sections accordions', (dataTable) => {
    for (const { header, expanded } of dataTable.hashes()) {
        cy.get("#nci-footer section[class$='collapsible']").find(`div:contains('${header}') button`)
            .should('have.attr', 'aria-expanded', expanded);
    }
});

When('user clicks on {string} footer link', (linkName) => {
    cy.get(`#nci-footer a:contains('${linkName}')`).trigger('click', { followRedirect: false });
});

When('user enters {string} into email field', (email) => {
    cy.get('input#email').type(email);
});

When('user clicks on email field', () => {
    cy.get('input#email').click();
});