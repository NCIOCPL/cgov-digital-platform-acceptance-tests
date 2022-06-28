/// <reference types="Cypress" />

import { Given, Then } from "cypress-cucumber-preprocessor/steps";

Then('the button to download At a Glance should appear at the bottom of the page', () => {
    cy.get(`.ap-button-block`).should('be.visible');
    cy.get(`.ap-button-block a[target='_blank']`).should('be.visible');
});

And('a PDF icon located at {string} should be displayed with a text {string}', (iconUrl, iconText) => {
    
    const baseURL = Cypress.config('baseUrl');
    cy.document().then((document) => {
        const element = document.querySelector("div[class='ap-file-block pdf'] a");
        const style = window.getComputedStyle(element, '::before');
        const image = style.getPropertyValue('background-image');
        const expectedURL = `url("${baseURL}${iconUrl}")`;
        const newImage = image.replace(/sprite-.+\.svg/,"sprite.svg"); 
        expect(expectedURL).equal(newImage); 
        const text = element.innerText;
        expect(text).equal(iconText);
    });
});

And('clicking on the link will open the PDF in a new window', () => {
    cy.get(`.ap-button-block a`).should('have.attr', "target", "_blank");

});

When('user clicks on bottom {string} button', (hrefAttr) => {
    cy.get(`div[class='ap-button-block']`).find('a').trigger('click', {followRedirect: false});

});
