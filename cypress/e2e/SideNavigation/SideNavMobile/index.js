/// <reference types="Cypress" />
import { When, Then } from 'cypress-cucumber-preprocessor/steps';

When('user clicks on the mobile menu button', () => {
    cy.get('button.nci-header-mobilenav__open-btn').click({ force: true });
});

Then('user should see the following in the mobile menu', (dataTable) => {
    let counter = 0;
    for (const { Label } of dataTable.hashes()) {
        cy.get(`ul.nci-header-mobilenav__list li a,ul.nci-header-mobilenav__list li button`)
            .eq(counter).should('have.text', Label);
        counter++;
    }
});

When('user clicks on Back button', () => {
    cy.get('button.nci-header-mobilenav__list-msg').click({ force: true });
    cy.wait(1000);
});

And('user clicks on {string} mobile menu link', (linkName) => {
    cy.get(`ul.nci-header-mobilenav__list li a:contains("${linkName}"),ul.nci-header-mobilenav__list li button:contains("${linkName}")`)
        .click()
});

And('user clicks on Explore {string} mobile menu link', (linkName) => {
    cy.get(`a.nci-header-mobilenav__list-link:contains("${linkName}")`)
        .trigger("click", { followRedirect: false }, { force: true })
});

And('user closes mobile menu by clicking {string} button', (closeBtn) => {
    cy.get("button[aria-label='Close Menu']").click();
})

And('user hits {string} key', (key) => {
    cy.get('body').type('{esc}')
});

And('user clicks on the right side of a screen', () => {
    cy.get('div.nci-header-mobilenav__overlay').click('topRight', { force: true })
});