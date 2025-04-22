import { Given, Then, And, When } from "cypress-cucumber-preprocessor/steps";
import { getBaseDirectory } from "../../../utils";

Then('page title is {string}', (title) => {
    cy.get('#NCI-trial-listing-app-root').find('h1').should('have.text', title);
});

And('the page displays pager info {string}', (pagerInfo) => {
    const regex = new RegExp(pagerInfo.split('\N').join('\\d+'));
    cy.get('.ctla-results__count.grid-col').invoke('text').then((text) => {
        const newText = text.trim().split('\n').join(' ').split('\t').join('').replace(/  +/g, ' ');;
        expect(newText).to.match(regex);
    })
});

And('each result displays the trial title with a link in the following format {string}', (linkFormat) => {
    cy.get('a.ctla-results__list-item-title.grid-col').should('have.attr', 'href').then((link) => {
        expect(link).to.include(linkFormat)
    })
}
);

And('each result displays the trial summary', () => {
    cy.get('.ct-list-item p').should('not.be.empty');
});

And('each result displays {string} below the summary', (location) => {
    cy.get('.ctla-results__list-item-location.grid-col')
        .should('include.text', location);
});

When('user clicks on {string} button', (arrow) => {
    cy.get('.pager__navigation li').contains(arrow).click();
});

Then('the url has path {string} with query {string}', (path, queryParams) => {
    cy.location('pathname').should('include', `${getBaseDirectory()}${path}`);
    cy.location('search').should('eq', queryParams);

});

When('the user navigates to {string} with non-existent page {string}', (path, parameter) => {
    cy.visit(`${path}?${parameter}`);
});

Then('the text {string} appears', (text) => {
    cy.get('#NCI-trial-listing-app-root p').should('have.text', text)
})

When('user clicks on {int} result', (resultNum) => {
    cy.get('a.ctla-results__list-item-title.grid-col')
        .eq(resultNum - 1)
        .trigger('click', { followRedirect: false });
});

And('the pager is not displayed', () => {
    cy.get('.pager__navigation').should('not.exist');
});

And('intro text {int} paragraph is {string}', (num, introText) => {
    cy.get('.disease-view__intro.ctla-results__intro').find('p').eq(num - 1).should('have.text', introText);

});

And('{string} link has href {string}', (link, href) => {
    cy.get('a').contains(link).should('have.attr', 'href', `${href}`);
});

Then('user is redirected to {string}', (redirectedUrl) => {
    const expUrl = redirectedUrl.split('?');
    cy.location('pathname').should('eq', `${getBaseDirectory()}${expUrl[0]}`)
    cy.location('search').should('eq', `?${expUrl[1]}`)
});

When('user is navigating to {string} with {string}', (path, search) => {
    cy.visit(`${path}${search}`)
});

