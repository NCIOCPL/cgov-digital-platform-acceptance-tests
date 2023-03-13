/// <reference types="Cypress" />
import { And, Given, When } from 'cypress-cucumber-preprocessor/steps';


And('body was translated as {string}',(title)=>{
    cy.get(`label:contains("${title}")`).should('be.visible')   
})

And('Related Resources section was translated as {string}',(RelatedResources)=>{
    cy.get("strong[data-drupal-selector='edit-field-related-resources-title']").should('include.text', RelatedResources)
})

Given('user is navigating to the front end site with spanish path site section plus {string}')