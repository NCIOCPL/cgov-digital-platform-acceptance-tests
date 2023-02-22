/// <reference types="Cypress" />
import { Given, And, Then, When } from 'cypress-cucumber-preprocessor/steps';
import { getBaseDirectory } from '../../../utils';

// Local field map as labels are not used in the shared field map.
const labelFieldMap = {
    Age: 'age',
    'Cancer Type/Keyword': 'type',
    'U.S. Zip Code': 'zip',
    'Cancer Type/Condition': 'ct',
    'Keywords/Phrases': 'keywordPhrases',
};

const inputFieldMap = {
    Age: 'age',
    'Cancer Type/Keyword': 'ctk',
    'Primary Cancer Type/Condition': 'ct-searchTerm',
    'U.S. Zip Code': 'zip',
    'Cancer Type/Condition': 'ct',
    'Keywords/Phrases': 'keywordPhrases',
};

Then("page title is {string}", (title) => {
    cy.get(`h1:contains('${title}') `).should('be.visible')
});

And('the text {string} appears below the title', (introtext) => {
    cy.get('.search-page__header > p').should('contain', introtext);
});

And('{string} link has a href {string}', (linkText, linkHref) => {
    if(linkText === 'Steps to Find a Clinical Trial'){
        cy.get('a').contains(linkText).should('have.attr', 'href').and('eq', linkHref);
    } else {
    cy.get('a').contains(linkText).should('have.attr', 'href').and('eq', `${getBaseDirectory()}${linkHref}`);
    }
});


And('Search tip icon is displayed and text {string} appears', (tiptext) => {
    cy.get('.cts-search-tip__icon').should('be.visible');
    cy.get('.cts-search-tip__body').should('contain', tiptext);
});

And('the following delighters are displayed', (dataTable) => {
    for (const { delighter, href, title, text } of dataTable.hashes()) {
        cy.get(`div[class="delighter ${delighter}"]:visible`).as('delighter');
        cy.get('@delighter').find('a').first().should('have.attr', 'href', href);
        cy.get('@delighter').find('h4').first().should('have.text', title);
        cy.get('@delighter').find('p').first().should('have.text', text);
    }
});

Then(
    'help icon is displayed in {string} section with href {string}',
    (fieldLabel, helpHref) => {
        cy.get(`#fieldset--${labelFieldMap[fieldLabel]}`)
            .find('a.text-icon-help')
            .should('have.attr', 'href', `${getBaseDirectory()}${helpHref}`);
    }
);

And('autocomplete dropdown is displayed', () => {
    cy.get('.cts-autocomplete .menu-anchor :visible').should('exist');
});

And('user selects {string} from dropdown', (keyword) => {
    cy.get('.cts-autocomplete__menu-item.highlighted').contains(keyword).click();
});

And('user clicks on {string} button', (buttonLabel) => {
    cy.get('button').contains(buttonLabel).click();
});

Then('the search is executed and results page is displayed', () => {
    cy.location('pathname').should('contain', 'search/r');
    cy.get('div[class="results-list"]',{timeout:10000}).should('be.visible');
});

And('results info has text {string}', (resultsInfo) => {
    cy.get('.cts-results-header .all-trials').should('have.text', resultsInfo);
});

Then(
    '{string} input field has a placeholder {string}',
    (fieldLabel, placeholderText) => {
        cy.get(`input#${inputFieldMap[fieldLabel]}`).should(
            'have.attr',
            'placeholder',
            placeholderText
        );
    }
);

When('user clicks on {string} field', (fieldLabel) => {
    cy.get(`input#${inputFieldMap[fieldLabel]}`).click();
});

Then('{string} input field has a value {string}', (fieldLabel, value) => {
    cy.get(`input#${inputFieldMap[fieldLabel]}`).should('have.value', value);
});

When('user types {string} in {string} field', (inputText, fieldLabel) => {
    cy.get(`input#${inputFieldMap[fieldLabel]}`).type(inputText, { force: true });
});

And('trial info displays {string}', (infoText) => {
    const regex = new RegExp(infoText);
    cy.get('.all-trials').invoke('text').should('match', regex);
});

And('the url query has the following corresponding code', (dataTable) => {
    cy.location('href').then((url) => {
        const params = new URL(url).searchParams;
        //verify num of url params matches expected
        expect(Array.from(params.entries()).length).to.eq(dataTable.rows().length);
        //verify that url query params have expected values
        Array.from(params.entries()).map(([pkey, pvalue]) => {
            for (const { parameter, value } of dataTable.hashes()) {
                if (parameter === pkey) {
                    expect(pvalue).equal(value);
                }
            }
        });
    });
});

Then(
    'autocomplete dropdown is displayed with {string} text', (autosuggestItem) => {
        cy.get('div.cts-autocomplete__menu-item').should('have.text', autosuggestItem);
    });

Then('the search is executed and no results page is displayed', () => {
    cy.location('pathname').should('contain', 'search/r');
    cy.get('.results-page h1').should('have.text', 'Clinical Trials Search Results');
    cy.get('div[class="results-list no-results"]').should('be.visible');
});

And('{string} form section is displayed', (sectionLabel) => {
    cy.get('legend').contains(sectionLabel).should('be.visible');
});

Then(
    'alert {string} is displayed in {string} section',
    (alertText, fieldLabel) => {
        cy.get(
            `#fieldset--${labelFieldMap[fieldLabel]} .cts-input__error-message`
        ).should('have.text', alertText);
    }
);

Then('alert is not displayed in {string} section', (fieldLabel) => {
    cy.get('article')
        .find(`#fieldset--${labelFieldMap[fieldLabel]} .cts-input__error-message`)
        .should('not.exist');
});

Then('the search is not executed and path is {string}', (path) => {
    cy.location('pathname').should('eq', `${getBaseDirectory()}${path}`);
});

When('user clears {string} input field', (fieldLabel) => {
    cy.get(`input#${inputFieldMap[fieldLabel]}`).clear();
});

And('the criteria table displays the following', (dataTable) => {
    let index = 0;
    for (const { Category, Selection } of dataTable.hashes()) {
        cy.get('tbody tr th').eq(index).should('have.text', Category);
        cy.get('tbody tr td').eq(index).should('include.text', Selection);
        index++;
    }
});

When('user clicks on Modify Search Criteria button', () => {
    cy.get('button.btnAsLink').contains('Modify Search Criteria').click();
});

When('user clicks on Start Over button', () => {
    cy.get('.all-trials a').contains('Start Over').click();
});

When('user types {string} in {string} field', (inputText, fieldLabel) => {
    cy.get(`input#${inputFieldMap[fieldLabel]}`).type(inputText);
});

Then('the title tag should be {string}', (expectedTitle) => {
    cy.get('head>title')
        .invoke('text')
        .then((title) => {
            expect(title.trim().replace(/\n/g), '').to.eq(expectedTitle);
        });
});