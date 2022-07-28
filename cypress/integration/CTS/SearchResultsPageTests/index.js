// <reference types="Cypress" />
import { Given, And, Then, When } from 'cypress-cucumber-preprocessor/steps';

Then("page title is {string}", (title) => {
    cy.get(`h1:contains('${title}') `).should('be.visible')
});

And('trial info displays {string}', (infoText) => {
    cy.get('.all-trials').invoke('text').then((text) => {
        const resultsText = text.split('\n').join(' ').split('\t').join('');
        const regex = new RegExp(infoText);
        expect(resultsText).to.match(regex);
    });
});

And('{string} button is displayed', (expectedButton) => {
    cy.get('.cts-results-header button').should('be.visible').and('contain.text', expectedButton);
});


When('user clicks on {string} button', (searchCriteriaButton) => {
    cy.get('button.cts-accordion__button').contains(searchCriteriaButton).click();
});

And('search criteria table displays the following', (dataTable) => {
    cy.get('tbody > tr').should('have.length', dataTable.hashes().length);
    //index assures correct order
    let index = 0;
    for (const { Category, Selection } of dataTable.hashes()) {
        cy.get('tbody tr th').eq(index).should('have.text', Category);
        cy.get('tbody tr td').eq(index).should('have.text', Selection);
        index++;
    }
});

And('{string} link has a href {string}', (linkText, linkHref) => {
    cy.get('a').contains(linkText).should('have.attr', 'href').and('eq', linkHref);
});

And('{string} pager is displayed', (pagerPosition) => {
    cy.get(`div.results-page__control.--${pagerPosition} .results-page__pager`).should('be.visible');
});

And('result list is displayed', () => {
    cy.get('div.results-list').should('be.visible');
});

And('each result item is a link', () => {
    cy.document().then((doc) => {
        const titleLocator = doc.querySelectorAll('.results-list-item__title');
        for (let i = 0; i < titleLocator.length - 1; i++) {
            cy.get(titleLocator[i]).should('be.visible');
            cy.get(titleLocator[i]).find('a').should('have.attr', 'href');
        }
    });
});

And('there are {int} delighters present', (count) => {
    cy.get('.cts-delighter-container div[class^="delighter"]:visible').should('have.length', count);
});

And('the following delighters are displayed', (dataTable) => {
    for (const { delighter, href, title, text } of dataTable.hashes()) {
        cy.get(`div[class="delighter ${delighter}"]:visible`).as('delighter');
        cy.get('@delighter').find('a').first().should('have.attr', 'href', href);
        cy.get('@delighter').find('h4').first().should('have.text', title);
        cy.get('@delighter').find('p').first().should('have.text', text);
    }
});

And('chat pop up is displayed', () => {
    cy.get('#ProactiveLiveHelpForCTSPrompt', { timeout: 30000 }).should('be.visible');
});

When('user clicks on chat button', () => {
    cy.get('#chat-button').click();
    cy.wait(2000);
});

And(`all result item's checkboxes are not checked`, () => {
    cy.get('.results-list .cts-checkbox__label').each(($el) => {
        const win = $el[0].ownerDocument.defaultView;
        // use getComputedStyle to read the pseudo selector
        const before = win.getComputedStyle($el[0], ':before');
        // read the value of the `content` CSS property
        const contentValue = before['background-image'];
        // the returned value will have double quotes around it, but this is correct
        expect(contentValue).to.eq('none');
    });
});

And('{string} checkbox is displayed', (selectAllCheckbox) => {
    cy.get(`label[for='select-all-cbx-top']`).should('be.visible').and('have.text', selectAllCheckbox);
});

When('user selects {string} checkbox', (selectAllCheckbox) => {
    cy.get(`label[for='select-all-cbx-top']`).contains(selectAllCheckbox).click();
});

Then(`all result item's checkboxes are checked`, () => {
    cy.get('.results-list .cts-checkbox__label').each(($el) => {
        const win = $el[0].ownerDocument.defaultView;
        // use getComputedStyle to read the pseudo selector
        const before = win.getComputedStyle($el[0], '::before');
        // read the value of the `content` CSS property
        const contentValue = before['background-image'];
        // the returned value will have double quotes around it, but this is correct
        expect(contentValue).not.to.eq('none');
    });
});

When(`user selects {int} result's checkbox`, (num) => {
    cy.get(`.results-list .cts-checkbox__label`).eq(num - 1).click();
});

Then('{string} checkbox is not checked', (selectAllCheckbox) => {
    cy.get('label').contains(selectAllCheckbox).parent().find('input').should('not.be.checked');
});

And(`{int} result's checkbox is not checked`, (num) => {
    cy.get('.results-list .cts-checkbox__label').eq(num - 1).parent().find('input').should('not.be.checked');
});

Then('{string} checkbox is checked', (selectAllCheckbox) => {
    cy.get('label').contains(selectAllCheckbox).parent().find('input').should('be.checked');
});

And(`{int} result's checkbox is checked`, (num) => {
    cy.get('.results-list .cts-checkbox__label').eq(num - 1).parent().find('input').should('be.checked');
});

And('user clicks on {string} button at {string} position', (printButton, printButtonPosition) => {
    cy.get(`div.results-page__control.--${printButtonPosition}`).find('button.results-page__print-button').contains(printButton).click();
});

Then('user is redirected to {string} with generated {string}', (redirectedPath, printID) => {
    cy.location('pathname').should('eq', redirectedPath);
    cy.location('search').should('include', `?${printID}=`);
});

And('print page search criteria table displays the following', (dataTable) => {
    dataTable.rows().forEach((row) => {
        for (let i = 0; i < row.length; i++) {
            cy.get('.search-criteria-box tbody tr td').eq(i).should('have.text', row[i]);
        }
    });
});

And('{string} link has a {string} attribute with {string} value', (emailLink, attrTarget, attrValue) => {
    cy.get(`a[target='_blank']`).as('target');
    cy.get('@target').should('be.visible').and('contain.text', emailLink);
    cy.get('@target').should('have.attr', attrTarget, attrValue);
});

And('{string} link has a href that matches {string}', (checkUpdateLink, path) => {
    cy.get('.hangingIndent.print-check-for-updates').as('checkupdate');
    cy.get('@checkupdate').should('be.visible').and('contain.text', checkUpdateLink);
    const regex = new RegExp(path);
    cy.get('@checkupdate').should('have.attr', 'href').and('match', regex);
});




