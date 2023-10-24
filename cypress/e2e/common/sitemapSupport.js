/// <reference types="Cypress" />
import { Given, Then } from "cypress-cucumber-preprocessor/steps";

Given("user requests the sitemap from {string}", (url) => {
    cy.request(url).as('sitemap_response');
});

Then("the response content type is {string}", (expectedType) => {

    cy.get('@sitemap_response').should( response =>  {

        expect(response).to.have.property('headers');
        const actualType = response.headers['content-type'];

        expect(actualType).to.equal(expectedType);
    });
});


Then("the sitemap has at least {int} urls", (minimumCount) => {

    cy.get("@sitemap_response").should((response) => {
        expect(response).to.have.property('body');

        const urls = Cypress.$(response.body)
            .find("loc")
            .toArray()
            .map((el) => el.innerText);

        expect(urls.length).to.be.at.least(minimumCount);
    });
});


Then("the sitemap has no more than {int} urls", (maximumCount) => {

    cy.get("@sitemap_response").should((response) => {
        expect(response).to.have.property('body');

        const urls = Cypress.$(response.body)
            .find("loc")
            .toArray()
            .map((el) => el.innerText);

        expect(urls.length).to.be.lessThan(maximumCount);
    });
});


Then("the sitemap has at least {int} alternate entries with language code {string}", (minimumCount, langcode) => {

    cy.get("@sitemap_response").should((response) => {
        expect(response).to.have.property('body');

        const alternatives = Cypress.$(response.body)
            .find(`xhtml\\:link[hreflang='${langcode}']`)
            .toArray();

        expect(alternatives.length).to.be.at.least(minimumCount);
    });
});


Then("the sitemap has no more than {int} alternate entries with language code {string}", (minimumCount, langcode) => {

    cy.get("@sitemap_response").should((response) => {
        expect(response).to.have.property('body');

        const alternatives = Cypress.$(response.body)
            .find(`xhtml\\:link[hreflang='${langcode}']`)
            .toArray();

        expect(alternatives.length).to.be.lessThan(minimumCount);
    });
});


Then("all sitemap entries start with www.cancer.gov", () => {

    const re = /^https:\/\/www\.cancer\.gov/;

    cy.get("@sitemap_response").should((response) => {
        expect(response).to.have.property('body');

        const urls = Cypress.$(response.body)
            .find("loc")
            .toArray()
            .map((el) => el.innerText.trim());

        urls.forEach( entry => expect(entry).to.match(re));
    });
});

Then('the sitemap includes the path {string}', (expectedPath) => {

        cy.get("@sitemap_response").should((response) => {
        expect(response).to.have.property('body');

        const re = /https?:\/\/.*?(\/.*)/;

        const pathList = Cypress.$(response.body)
            .find("loc")
            .toArray()
            .map((el) =>  el.innerText);

        expect(pathList).to.include(expectedPath);
    });

});

