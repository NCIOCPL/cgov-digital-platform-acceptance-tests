/// <reference types="Cypress" />
import { When } from "cypress-cucumber-preprocessor/steps";
When('user clicks on View and Print Infographic button',()=>{
    cy.get("figure[class*='centered']").find('figcaption a').click();
    cy.wait(2000);
});