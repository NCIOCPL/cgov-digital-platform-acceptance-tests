/// <reference types="Cypress" />
import { Then } from "cypress-cucumber-preprocessor/steps";

Then('user is hovering over mega menu with href {string}', (href) => {
    // hover over the menu
    let locator = ".nav-item-title a[href$='" + href + "']"
    cy.get(locator).trigger('mouseover');
    //wait until menu drops and beacon is sent
    cy.wait(2000)
});

Then('user is clicking on mega menu button', () => {
    cy.get('.mobile-menu-bar button').first().click();
    //wait for the click beacon
    cy.wait(2000);
});