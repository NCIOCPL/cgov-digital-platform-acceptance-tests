/// <reference types="Cypress" />
import { When, Then } from "cypress-cucumber-preprocessor/steps";

const baseURL = Cypress.config("baseUrl");
var isSSOEnabled = false;
const password = Cypress.env('ocpl_password');

if (
    baseURL == "https://www-dev-ac.cancer.gov" ||
    baseURL == "https://www-test-ac.cancer.gov" ||
    baseURL == "https://www-int-ac.cancer.gov"
) {
    isSSOEnabled = true;
}

Given("user is navigating to {string}", (a) => {
    if (!isSSOEnabled) {
        return;
    }
    cy.visit(a);
});

When("user logs in as a {string}", (username) => {
    if (!isSSOEnabled) {
        return;
    }
    expect(username, "username was set").to.be.a("string").and.not.be.empty;
    // the password value should not be shown
    if (typeof password !== "string" || !password || password === "") {
        throw new Error(
            "Missing password value, set using CYPRESS_admin_password=..."
        );
    }
    cy.get('#edit-samlauth-auth-login-link').click();
    cy.get('input[autocomplete="username"]').type(username, { log: false });
    cy.get('input[value="Next"]').click();
    cy.get('input[name="credentials.passcode"]').type(password, { log: false });

    // user clicks log in
    cy.get('input[value="Verify"]').click();
});

Then("user is logged in and the user name {string} is displayed in the toolbar", (admin) => {
    if (!isSSOEnabled) {
        return;
    }
    cy.get("#toolbar-item-user").should("include.text", admin).and("be.visible");
});
