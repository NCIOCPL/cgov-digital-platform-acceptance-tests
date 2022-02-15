/// <reference types="Cypress" />
import { And, Then } from 'cypress-cucumber-preprocessor/steps';

const username = Cypress.env('admin_username');
const password = Cypress.env('admin_password');

When('user enters credentials', () => {
    expect(username, 'username was set').to.be.a('string').and.not.be.empty
    // the password value should not be shown
     if (typeof password !== 'string' || !password || password === '') {
      throw new Error('Missing password value, set using CYPRESS_admin_password=...')
}
    cy.get('input#edit-name').type(username, { log: false });
    cy.get('input#edit-pass').type(password, { log: false });
});

And('user clicks {string} button', (loginButton) => {
    cy.get('input#edit-submit').contains(loginButton).click();
});

When('user is logged in and the user name {string} is displayed in the toolbar', (admin) => {
    cy.get('#toolbar-item-user').should('have.text', admin).and('be.visible');
});

Then('the tool bar appears at the top', () => {
    cy.get('nav#toolbar-bar[data-offset-top]').should('be.visible');
});

And('the hamburger menu {string} is displayed', (menu) => {
    cy.get('#toolbar-item-administration').contains(menu).should('be.visible');
});

And('the toolbar for administration menu appears', () => {
    cy.get('#toolbar-item-administration').should('be.visible');
});

When('user clicks on {string} tab', (option) => {
    cy.get('ul.toolbar-menu>li>a:visible').contains(option).click({ force: true });
});

And('the following tab links appear below title', (dataTable) => {
    for (const { name, link } of dataTable.hashes()) {
        cy.get('.tabs__tab').contains(name).should('have.attr', 'href', link);
    }
});

And('table with existing content is displayed', () => {
    cy.get('.views-table').should('be.visible');
});

And('each content title is a link', () => {
    cy.document().then((doc) => {
        const titleLocator = doc.querySelectorAll('.views-field.views-field-title');
        for (let i = 0; i < titleLocator.length - 1; i++) {
            cy.get(titleLocator[i]).should('be.visible');
            cy.get(titleLocator[i]).find('a').should('have.attr', 'href');
        }
    });
});

And('the following config links appear below', (dataTable) => {
    for (const { name, link } of dataTable.hashes()) {
        cy.get('.admin-list').contains(name).should('have.attr', 'href', link);
    }
});

And(`page's {int} subtitle is {string}`, (num, subTitle) => {
    cy.get('.region.region-content').find('h2').eq(num - 1).should('have.text', subTitle);
});

And('the following configuration groups are displayed', (dataTable) => {
    for (const { title } of dataTable.hashes()) {
        cy.get('h3.panel__title').contains(title);
    }
});

And('table with existing users is displayed', () => {
    cy.get('.views-table').should('be.visible');
});

And('each username is a link', () => {
    cy.document().then((doc) => {
        const userLocator = doc.querySelectorAll('.views-field.views-field-name');
        for (let i = 0; i < userLocator.length - 1; i++) {
            cy.get(userLocator[i]).should('be.visible');
            cy.get(userLocator[i]).find('a').should('have.attr', 'href');
        }
    });
});