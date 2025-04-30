/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';

And('user selects {string} from the {string} dropdown', (option, dropdown) => {
    cy.get(`label:contains('${dropdown}')`).parent().find('select').first().select(option).should('have.value','cgov_js_only_app');
});

And('user clears out {string} text field', (settingField) => {
    cy.get(`label:contains('${settingField}')`).parent().find('textarea').clear();
});

And('user enters {string} into app config text field', (value) => {
    cy.get('textarea#edit-field-application-module-0-data').type(value, { parseSpecialCharSequences: false });
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


