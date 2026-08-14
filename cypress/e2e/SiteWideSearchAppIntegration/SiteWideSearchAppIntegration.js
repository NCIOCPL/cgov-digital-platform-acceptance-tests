/// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';

Then('the system returns the results page for {string}', (term) => {
    cy.get('input#sws-results-search').should('have.value',term);
});

And('the best bet box is displayed', () => {
    cy.get('div.best-bet').should('be.visible');
});

And('the best bets title is a link', () => {
    cy.get('div.best-bet').find('a').should('have.attr', 'href');
});

And('the dictionary definition box is displayed', () => {
    cy.get('div.usa-summary-box.sws-results__definition').should('be.visible');
});

And('the {string} button is displayed within the dictionary definition', (moreInfoButton) => {
    cy.get('div.usa-summary-box.sws-results__definition p').find('a').should('contain.text', moreInfoButton);
});

Then('the {string} button within the dictionary definition is displayed', (showHideButtonText) => {
    cy.get('.sws-results__definition-show-full').should('contain.text', showHideButtonText);
});

And('the {string} title is {string}', (tag, title) => {
    if (title.includes('XXXXX')) {
            const regex = new RegExp(title.replace(/XXXXX/g, '[0-9]+'));
            cy.get(`${tag}:nth-of-type(1)`).invoke('text').should('match',regex)
    }
    else {
        cy.get(`${tag}:contains("${title}")`).should('be.visible');
    }
});

And('the results are displayed with each title containing a link', () => {
    cy.get('.usa-collection__item.sws-results__list-item.grid-container').find('a').should('have.attr', 'href');
});

And('the system defaults to {string} results per page', (resultsCount) => {
    cy.get('.grid-col.sws-results__viewby option').should('be.selected').and('have.value', resultsCount);
});

Then('the drop down box to show results per page is displayed', () => {
    cy.get('.pager__select > option').should('be.visible');
});

Then('the {string} text is {string}', (tag1, title1) => {
    cy.get(`${tag1}:contains("${title1}")`).should('be.visible');
});

And('the user clicks the last page link in the pager', () => {
    cy.get('.pager__list-item a[class="pager__button total_pages"]').first().click();
});

Then('user is clicking on a BestBets title link at position {int}', (positionNumber) => {
    cy.get('div.best-bet').eq(positionNumber - 1).find('a').then(link$ => {
        link$.on('click', e => {
            e.preventDefault();
        });
    })
    .click({ followRedirect: false });
});

Then('user is clicking on a search result item at position {int}', (positionNumber) => {
    cy.get('.usa-collection__item.sws-results__list-item.grid-container').eq(positionNumber - 1).find('a').then(link$ => {
        link$.on('click', e => {
            e.preventDefault();
        });
    })
    .click({ followRedirect: false });
});

Then('user is clicking on a glossary term link {string}', (termLink) => {
    cy.get('div.usa-summary-box.sws-results__definition p').find('a').then(link$ => {
        link$.on('click', e => {
            e.preventDefault();
        });
    })
    .click({ followRedirect: false });
});

When('user types {string} in the site search box', (searchText) => {
    cy.get('input#nci-header-search__field').type(searchText);
})

And('user selects {string} from the autosuggest dropdown', (term) => {
    cy.get(`span[aria-label="${term}"]`).parent().click();
});


And('user clicks Search button', () => {
    Cypress.on('window:before:unload', (win) => {
        cy.AnalyticsStorageBeforeUnload = cy.AnalyticsStorage;
    });
    cy.get('button[class*="search-button"]').click();
})

