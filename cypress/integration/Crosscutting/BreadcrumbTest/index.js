/// <reference types="Cypress" />
import { When, Then, And } from "cypress-cucumber-preprocessor/steps";

Then('the breadcrumbs are displayed', () => {
    cy.get('.breadcrumbs').should('be.visible');
});

And('the breadcrumbs have the count of {int}', (count) => {
    cy.get('div#cgvSlBreadcrumb > ul > li').should('have.length',count);
});

Then('the breadcrumbs are not displayed', () => {
    cy.get('.breadcrumbs').should('not.exist');
});

And('the breadcrumbs have the titles as {string}', (title) => {
    const allTitles = title.split(',');
    cy.document().then(document => {
        const number = document.querySelectorAll('div#cgvSlBreadcrumb > ul > li');
        for (let i = 0; i < number.length; i++) {
            expect(number[i].innerText.trim()).to.eq(allTitles[i]);
        }
    });
});


And('the {int} breadcrumbs links to {string}', (count, linkPath) => {
    const allLinks = linkPath.split(',');
            for (let i = 0; i < count; i++) {
            cy.get('div#cgvSlBreadcrumb > ul > li >a').then(urls => {
                expect(urls[i].getAttribute('href')).to.eq(allLinks[i]);
            })
            }
        });