/// <reference types="Cypress" />
import { And, Then } from 'cypress-cucumber-preprocessor/steps';

Then('{string} is displayed', (otpTitle) => {
    cy.get('.cgdp-on-this-page').contains(otpTitle).should('be.visible');
});

And('OTP links have the following {string}', (options) => {
    function compare(wordOne, wordTwo) {
        let result = true
        for (let i = 0; i < wordOne.length; i++) {
            if (wordOne.charAt(i) !== wordTwo.charAt(i)) {
                if (wordOne.charAt(i) === ' '){
               
            } else {
                result = false
            }
        }
        return result
    }
}
    const expectedOptions = options.split(',');
    for (let i = 0; i < expectedOptions.length; i++) {
        cy.get('.cgdp-on-this-page ul li a').eq(i).invoke('text').then((text) => {
            let actText = text.toString()
            const res = compare(actText.trim(), expectedOptions[i])
            expect(res).to.be.true
        });
    }
});

And('OTP links have the {string} as follows', (options) => {
    const expectedOptions = options.split(',');
    for (let i = 0; i < expectedOptions.length; i++) {
        cy.get('.cgdp-on-this-page ul li a').eq(i).should('be.visible').and('have.attr', 'href', expectedOptions[i]);
    }
});

Then('on this page section title is not displayed', () => {
    cy.get('.cgdp-on-this-page').should('not.be.visible');
});

And('on this page accordion is displayed', () => {
    cy.get('div.accordion').should('be.visible');
});

And('all of the accordion items are collapsed', () => {
    cy.get('.cgdp-on-this-page section h2').should('have.attr', 'aria-expanded', 'false');
});

Then('On This page section does not exist', () => {
    cy.get('.cgdp-on-this-page').should('not.exist');
});


////// legacy OTP

Then('legacy {string} is displayed', (otpTitle) => {
    cy.get('.on-this-page').contains(otpTitle).should('be.visible');
});

And('legacy OTP links have the following {string}', (options) => {
    function compare(wordOne, wordTwo) {
        let result = true
        for (let i = 0; i < wordOne.length; i++) {
            if (wordOne.charAt(i) !== wordTwo.charAt(i)) {
                if (wordOne.charAt(i) === ' '){
               
            } else {
                result = false
            }
        }
        return result
    }
}
    const expectedOptions = options.split(',');
    for (let i = 0; i < expectedOptions.length; i++) {
        cy.get('#cgvBody section h2').eq(i).invoke('text').then((text) => {
            let actText = text.toString()
            const res = compare(actText.trim(), expectedOptions[i])
            expect(res).to.be.true
        });
    }
});

And('legacy OTP links have the {string} as follows', (options) => {
    const expectedOptions = options.split(',');
    for (let i = 0; i < expectedOptions.length; i++) {
        cy.get('#cgvBody ul li a').eq(i).should('be.visible').and('have.attr', 'href', expectedOptions[i]);
    }
});

Then('legacy on this page section title is not displayed', () => {
    cy.get('.on-this-page').should('not.be.visible');
});


And('all of the legacy accordion items are collapsed', () => {
    cy.get('#cgvBody section h2').should('have.attr', 'aria-expanded', 'false');
});

Then('legacy On This page section does not exist', () => {
    cy.get('.on-this-page').should('not.exist');
});