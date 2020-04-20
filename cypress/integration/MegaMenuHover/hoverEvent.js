/// <reference types="Cypress" />
import { Then } from "cypress-cucumber-preprocessor/steps";

Then('user is hovering over mega menu with href {string}', (href) => {
    // // Make the browser desktop viewport so mega menu shows.
    // // Do this BEFORE tracking analytics call since it also
    // // makes a call.
    // cy.viewport(1025, 600);
    // hover over the menu
    let locator = ".nav-item-title a[href$='" + href + "']"
    cy.get(locator).trigger('mouseover');
    //wait until menu drops and beacon is sent
    cy.wait(3000)
});

Then('user is clicking on mega menu button', () => {
    cy.get('.mobile-menu-bar button').first().click();
    cy.wait(1500);
});