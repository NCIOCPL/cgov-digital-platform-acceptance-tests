// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';

And('the {string} title is {string}', (tag, title) => {
    if (title.includes('XX')) {
        const regex = new RegExp(title.replace(/XX/g, '[0-9]+'));
        cy.get(`div#NCI-dd-app-root ${tag}`, { timeout: 10000 }).invoke('text').should('match', regex);
    }
    else {
        cy.get(`div#NCI-dd-app-root ${tag}`).should('have.text', title);
    }
});

Then('introductory text appears', () => {
    cy.get('#NCI-dd-app-root').find('p').should('be.visible').invoke('text').should('not.be.empty');
});

Then('the page is showing the expand results for the letter {string}', (letter) => {
    let results;

    cy.url().then(url => {
        results = `results found for: ${letter} `;
        cy.get('#NCI-dd-app-root div.results h4').should('include.text', results);
    });
});

And('search bar is displayed below the introductory text', () => {
    cy.get('form[data-testid="tid-search-container"]').should('be.visible');
    cy.document().then(doc => {
        expect(doc.querySelector('form[data-testid="tid-search-container"]').parentNode.previousElementSibling.tagName).to.be.eq('P');
    });
});

And('user clicks on result number {int}', (resultNumber) => {
    cy.get('div.results dfn').eq(resultNumber - 1).find('a').first().click();
});

Then('user is redirected to definition page and url contains {string}', (urlText) => {
    cy.url().should('contain', urlText);
});

And('term title appears', () => {
    cy.get('h1.dictionary-definiton__term-title').should('be.visible');
});

And('term definition appears', () => {
    cy.get('div.dictionary-definiton__definition').should('be.visible');
});

And('the following links appear below definition text', () => {
    cy.document().then(doc => {
        const expectedLinks = doc.querySelector('div.dictionary-definiton__supplemental-links');
        expect(expectedLinks.firstChild.className).eq('dictionary-definiton__active-trials-link');
        expect(expectedLinks.lastChild.className).eq('dictionary-definiton__nci-thesaurus-link');
        expect(expectedLinks.parentNode.className).to.be.eq('dictionary-definiton__term-definition');
    })
});

When('user types {string} in the search bar', (textEntered) => {
    cy.get('input[id="keywords"]').clear().type(textEntered);
    cy.wait(500);
});

Then('autosuggest appears', () => {
    cy.get('div.ncids-autocomplete__menu.--terms[data-testid="tid-auto-suggest-options"]').should('be.visible');
});


When('user hits {string} key', (enterKey) => {
    cy.get('input[id="keywords"]').type('{enter}{enter}');
    cy.wait(2000);
});

Then('search is executed and page url is {string}', (urlText) => {
    cy.location('href').then(url => {
        expect(url.endsWith(urlText)).to.be.true;
    });
});

Then('the no matching results page is displayed', () => {
    cy.get('div.results p[data-testid="tid-no-matching-results"]').should('be.visible');
});

And('user selects {string} from the dropdown', (autosuggestTerm) => {
    cy.get(".menu-wrapper div[class*='--terms']").should('be.visible');
    cy.get(".menu-wrapper div[class*='--terms']").contains(autosuggestTerm).click();
    cy.wait(500);

});

And('user clears the search box', () => {
    cy.get('input[id="keywords"]').clear();
});

And('user modifies the search box value to {string}', (modifiedTerm) => {
    cy.wait(500);
    cy.get('input[id="keywords"]').clear().type(modifiedTerm);
});

When('user selects {string} radio button', (option) => {
    const selectedOption = option === 'Contains' ? 'Contains' : 'Begins';
    cy.get(`input[value="${selectedOption}"]`).check({ force: true });
    cy.wait(500);
});

When('user selects {string} from result list', (result) => {
    cy.get('.results dfn a', { timeout: 5000 })
        .contains(result)
        .trigger('click', { followRedirect: false });
});

And('user clicks {string} button', (searchButton) => {
    cy.get('#btnSearch').click();
    cy.wait(2000);
});
