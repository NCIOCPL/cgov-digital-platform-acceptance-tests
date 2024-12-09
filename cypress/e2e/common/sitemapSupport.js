/// <reference types="Cypress" />
import { Given, Then } from "cypress-cucumber-preprocessor/steps";


Given("the user requests the sitemap from {string}", (url) => {
    cy.request(url).as('sitemap_response');
});


Then("the response content type is {string}", (expectedType) => {

    cy.get('@sitemap_response').should(response => {

        expect(response).to.have.property('headers');
        const actualType = response.headers['content-type'];

        expect(actualType).to.equal(expectedType);
    });
});


Then("the sitemap has between {int} and {int} urls", (minimumCount, maximumCount) => {

    cy.get("@sitemap_response").should((response) => {
        expect(response).to.have.property('body');

        const urls = Cypress.$(response.body)
            .find("loc")
            .toArray()
            .map((el) => el.innerText);

        expect(urls.length).to.be.at.least(minimumCount);
        expect(urls.length).to.be.lessThan(maximumCount);
    });
});



Then("the sitemap has between {int} and {int} alternate entries with language code {string}", (minimumCount, maximumCount, langcode) => {

    cy.get("@sitemap_response").should((response) => {
        expect(response).to.have.property('body');

        const alternatives = Cypress.$(response.body)
            .find(`xhtml\\:link[hreflang='${langcode}']`)
            .toArray();

        expect(alternatives.length).to.be.at.least(minimumCount);
        expect(alternatives.length).to.be.lessThan(maximumCount);
    });
});


Then("all sitemap entries start with www.cancer.gov", () => {
    const baseUrlFromConfig = Cypress.config("baseUrl");

    cy.get("@sitemap_response").should((response) => {
        expect(response).to.have.property('body');

        const urls = Cypress.$(response.body)
            .find("loc")
            .toArray()
            .map((el) => el.innerText.trim());

        urls.forEach(entry => expect(entry.startsWith(baseUrlFromConfig)).to.be.true);
    });
});

Then('the sitemap includes the path {string}', (expectedPath) => {
    const baseUrlFromConfig = Cypress.config("baseUrl");
    cy.get("@sitemap_response").should((response) => {
        expect(response).to.have.property('body');

        const pathList = Cypress.$(response.body)
            .find("loc")
            .toArray()
            .map((el) => el.innerText);

        expect(pathList).to.include(expectedPath.replace('{BASE_URL}', baseUrlFromConfig));
    });

});


Then("the sitemap has no entry for {string}", (path) => {
    const baseUrlFromConfig = Cypress.config("baseUrl");
    // Elsewhere, we expect all sitemap entries to start with
    // base url, but these path segments will not.
    const expectedPath = `${baseUrlFromConfig}${path}`;

    cy.get("@sitemap_response").should((response) => {
        expect(response).to.have.property("body");

        const pathList = Cypress.$(response.body)
            .find("loc")
            .toArray()
            .map((el) => el.innerText);

        expect(pathList).to.not.include(expectedPath);
    });
});

