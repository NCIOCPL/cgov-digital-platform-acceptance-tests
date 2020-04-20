/// <reference types="Cypress" />

import { Then } from "cypress-cucumber-preprocessor/steps";

Then('user is clicking on a menu section with href {string}', (hrefAttr) => {
    cy.Beacons = [];
    cy.document().then($document => {
        $document.addEventListener('click', (e) => { e.preventDefault(); return false; })
    })
    // Make the browser desktop viewport so left nav shows.
    // Do this BEFORE tracking analytics call since it also
    // makes a call.
    cy.viewport(1025, 600);
    // Click the left nav to trigger the event, which the above eventListener
    // will listen for.
    let locator = '#nvcgSlSectionNav a[href="' + hrefAttr + '"]';
    cy.get(locator).click();
    cy.wait(2500);   
});


