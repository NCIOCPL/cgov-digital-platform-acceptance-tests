/// <reference types="Cypress" />
import { When, Then, And } from "cypress-cucumber-preprocessor/steps";

Then('mega menu is displayed', () => {
    cy.get('nav.nci-header-nav').should('be.visible');
});
And('main categories titles are {string}', (titles) => {
    const allTitles = titles.split(',');
    cy.document().then(document => {
        const els = document.querySelectorAll('#nci-header li.nci-header-nav__primary-item button');
        for (let i = 0; i < els.length; i++) {
            expect(els[i].innerText).to.eq(allTitles[i]);
        }

    });

});

And('correct {int} of top-level menu items is displayed', (number) => {
    cy.document().then(document => {
        const els = document.querySelectorAll('#nci-header li.nci-header-nav__primary-item');
        expect(els.length).to.eq(number)
    });
});

And('{string} menu title {string} is a link', (lang, title) => {
    cy.url().then(url => {
        if (lang.includes('Spanish') && url.includes('espanol')) {
            cy.get(`#nci-header li.nci-header-nav__primary-item a:contains('${title}')`).should('be.visible');
        } else if (lang.includes('English') && !url.includes('espanol')) {
            cy.get(`#nci-header li.nci-header-nav__primary-item a:contains('${title}')`).should('be.visible');
        }
    })
});

When('user clicks on {string} menu section', (label) => {
    cy.get(`#nci-header button:contains('${label}')`).click({ force: true });
});

And('user clicks on {string} mega menu sub section link', (linkLabel) => {
    cy.get(`a:contains("${linkLabel}")`).trigger('click', { followRedirect: false });
});

When('user clicks on {string} menu link', (linkLabel) => {
    cy.get(`nav.nci-header-nav a:contains("${linkLabel}")`).trigger('click', { followRedirect: false });
});

Then('the following menu links are displayed', (dataTable) => {
    cy.document().then((doc) => {
        const linksNum = doc.querySelectorAll('li.nci-megamenu__list-item a').length

        expect(linksNum).to.eq(dataTable.rows().length);
        for (const { label, href } of dataTable.hashes()) {
            cy.get(`li.nci-megamenu__list-item a[href='${href}']`).should('have.text', label);
        }
    })
});

And('primary link is {string} with href {string}', (label, href) => {
    cy.get('a.nci-megamenu__primary-link').should('have.text', label);
    cy.get('a.nci-megamenu__primary-link').should('have.attr', 'href', href);
});