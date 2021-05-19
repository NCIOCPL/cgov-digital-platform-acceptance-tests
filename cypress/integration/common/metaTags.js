/// <reference types="Cypress"/>

import { Then } from 'cypress-cucumber-preprocessor/steps';

Then('the page contains meta tags with the following names', (dataTable) => {
    cy.document().then((doc) => {
        for (const { name, content } of dataTable.hashes()) {
            if (content.includes('{CANONICAL_HOST}')) {
                cy.location('host').then(host => {
                    const expectedHref = content.replace('{CANONICAL_HOST}', host)
                    const locator = `meta[name='${name}']`;
                    //find element, ensure it has attribute content
                    //compare content's value with expected one
                    cy.get(locator).should('have.length', 1).and('have.attr', 'content').and('be.eq', expectedHref);
                });
            }else {
                const locator = `meta[name='${name}']`;
                //find element, ensure it has attribute content
                //compare content's value with expected one
                cy.get(locator).should('have.length', 1).and('have.attr', 'content').and('be.eq', content);
            }
        }
    });
});

Then(
    'the page contains meta tags with the following properties',
    (dataTable) => {
        for (const { property, content } of dataTable.hashes()) {
            if (content.includes('{CANONICAL_HOST}')) {
                cy.location('host').then(host => {
                    const expectedHref = content.replace('{CANONICAL_HOST}', host)
                    const locator = `META[property='${property}']`;
                    cy.get(locator).should('have.length', 1).and('have.attr', 'content').and('be.eq', expectedHref);
                });
            } else {
                const locator = `META[property='${property}']`;
                //find element, ensure it has attribute content
                //compare content's value with expected one
                cy.get(locator).should('have.length', 1).and('have.attr', 'content').and('be.eq', content);
            }
        }
    }
);

Then('there is a canonical link with the href {string}', (href) => {
    cy.location('host').then(host => {
        const expectedHref = href.replace('{CANONICAL_HOST}', host)
        cy.get("link[rel='canonical']")
            //verify there is only one link
            .should('have.length', 1)
            //verify it has attribute 'href
            .and('have.attr', 'href')
            //href attr contains expected url
            .and('be.eq', expectedHref);
    })


});

Then('the title tag should be {string}', (expectedTitle) => {
    cy.get('head>title').invoke('text').should('be.eq', expectedTitle);

});

Then('there are alternate links with the following', (dataTable) => {
    const locator = "[rel='alternate']";
    //convert data table into the object of type
    cy.location('host').then(host => {
        for (const { href, hreflang } of dataTable.hashes()) {
            const expectedHref = href.replace('{CANONICAL_HOST}', host)
            //find element with concatenated attributes (rel=alternate and href=foo)
            cy.get(`${locator}[href='${expectedHref}']`)
                //assert it has the hreflang attr
                .should('have.length', 1).and('have.attr', 'hreflang')
                //hreflang value is matching expected
                .and('be.eq', hreflang);
        }
    });
});

Then('there are no alternate links', () => {
    cy.get("[rel='alternate']").should('not.exist');
});
