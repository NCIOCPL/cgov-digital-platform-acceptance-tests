/// <reference types="Cypress" />

import { Given, Then } from "cypress-cucumber-preprocessor/steps";

Then('the PDF download link should appear', () => {
    cy.get(`.ap-file-block`).should('be.visible');
    cy.get(`.ap-file-block a[target='_blank']`).should('be.visible');
});

And('a PDF icon located at {string} should be displayed with a text {string}', (iconUrl, iconText) => {
    
    const baseURL = Cypress.config('baseUrl');
    cy.document().then((document) => {
        const element = document.querySelector("div[class='ap-file-block pdf'] a");
        const style = window.getComputedStyle(element, '::before');
        const image = style.getPropertyValue('background-image');
        const expectedURL = `url("${baseURL}${iconUrl}")`;
        const newImage = image.replace(/\?v=\w+/, ''); 
        expect(expectedURL).equal(newImage); 
        const text = element.innerText;
        expect(text).equal(iconText);
    });
});

And('clicking on the link will open a new window', () => {
    cy.get(`.ap-file-block a`).should('have.attr', "target", "_blank");

});

Then('the PDF download link is not displayed', () => {
    cy.get(`.ap-file-block`).should('not.be.visible');
});

When('user clicks on top {string} button', (hrefAttr) => {
    cy.get("div[class='ap-file-block pdf']").find('a').trigger('click', {followRedirect: false});

});