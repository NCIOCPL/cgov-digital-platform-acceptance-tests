/// <reference types="Cypress" />

import { Given, Then } from "cypress-cucumber-preprocessor/steps";

Then('the hero image should be displayed full width with the following', dataTable =>{
    for (const { attribute, value } of dataTable.hashes()) {
        // verify alt attribute of an image
        if (attribute === 'alt') {
            if (value === 'empty') {
                cy.get("#nvcgSlHeroHeader > div > .rawHtml").find('img').should(($div) => {
                    const el = $div.get(0);
                    expect(el.getAttribute('alt').trimEnd()).to.be.equal('');
                })
            } else {
                cy.get("#nvcgSlHeroHeader > div > .rawHtml").find('img').should(($div) => {
                    const el = $div.get(0);
                    expect(el.getAttribute('alt').trimEnd()).to.be.equal(value);
                })
            }
        }
        
        //verify src of desktop image 
        if (attribute === 'image') {
            const regex = new RegExp (value);
            cy.get("#nvcgSlHeroHeader > div > .rawHtml").find('img').should('have.attr', 'src').and('match', regex);
        }

        //verify width of desktop image 
        if (attribute === 'width') {
            cy.get("#nvcgSlHeroHeader > div > .rawHtml").find('img').should('have.attr', 'width').and('eq', value);
        }

        //verify height of desktop image 
        if (attribute === 'height') {
            cy.get("#nvcgSlHeroHeader > div > .rawHtml").find('img').should('have.attr', 'height').and('eq', value);
        }
    }
});


And('the hero image title text is {string}',(title) => {
    cy.get("div#nvcgSlHeroHeader > h1").should('have.text', title);
});

And('left navigation menu is not displayed',() => {
cy.get("div#nvcgSlSectionNav").should('not.exist');
});

And('the main content area should appear',() =>{
cy.get(".row.report-container").should('be.visible');
});


