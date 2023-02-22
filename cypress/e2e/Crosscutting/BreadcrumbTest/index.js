/// <reference types="Cypress" />
import { When, Then, And } from "cypress-cucumber-preprocessor/steps";
import { getBaseDirectory } from "../../../utils";

Then('the following breadcrumbs are displayed', (dataTable) => {
    for (const { label, link } of dataTable.hashes()) {
        if (link === 'none') {
            cy.get(`.usa-breadcrumb__list span:contains("${label}")`).as('breadcrumb').should('be.visible');
            cy.get('@breadcrumb').parent().find('a').should('not.exist');
        } else {
            cy.get(`.usa-breadcrumb__list span:contains("${label}")`).as('breadcrumb').should('be.visible');
            cy.get('@breadcrumb').parent().should('have.attr','href').and('eq',`${getBaseDirectory()}${link}`);
        }
    }
});


When('user clicks {string} breadcrumb link', (label) => {
    cy.get(`.usa-breadcrumb__list span:contains("${label}")`).parent().click();
});

Then('the following breadcrumbs are not displayed', (dataTable) => {
    for (const { label, link } of dataTable.hashes()) {
        if (link === 'none') {
            cy.get(`.usa-breadcrumb__list span:contains("${label}")`).should('not.exist');
        } else {
            cy.get(`.usa-breadcrumb__list span:contains("${label}")`).as('breadcrumb').parent().parent().should('not.be.visible');
            cy.get('@breadcrumb').parent().should('have.attr','href').and('eq',`${getBaseDirectory()}${link}`);
        }
    }
});

When('user clicks on {string} breadcrumb link', (label) => {
    cy.get(`.usa-breadcrumb__list span:contains("${label}")`).parent().trigger('click',{followRedirect:false});
});

Then('breadcrumbs do not exist',()=>{
    cy.get('.usa-breadcrumb__list').should('not.exist');
});

And('current page breadcrumb has an attribute {string} with value {string}',(attr, value)=>{
cy.get('li.usa-breadcrumb__list-item.usa-current').should('have.attr',attr,value);
})