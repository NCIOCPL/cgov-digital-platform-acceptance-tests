/// <reference types="Cypress" />
import { Then } from 'cypress-cucumber-preprocessor/steps';

Then("event's links are displayed", () => {
    cy.get('.cgdp-dynamic-list li a.usa-link').should('be.visible').and('have.attr', 'href').and('not.be.empty')
})
Then('each links has a title', () => {
    cy.get('.cgdp-dynamic-list li h3 a span').should('be.visible').and('not.be.empty')
})
Then('each link has a date and location', () => {
    cy.get('.cgdp-dynamic-list ul.usa-collection__meta li.usa-collection__meta-item').each(el => {
        cy.wrap(el).find('br').should('exist').and('have.length.at.most', 2).and('have.length.at.least', 1)
    })
})

Then('pager is displayed', () => {
    cy.get('.cgdp-dynamic-list__bottom-pager').should('be.visible')
})
Then('user clicks on page {string}', (page) => {
    cy.get('.cgdp-dynamic-list__bottom-pager').find(`a[href="?page=${page - 1}"]`).first().click()
})
Then('user is redirected to {string}', (redirectedUrl) => {
    cy.url().should('include', redirectedUrl)
});

Then('user clicks on event number {int}', (index) => {
    cy.get('.cgdp-dynamic-list li a.usa-link').eq(index-1).trigger('click', { followRedirect: false })
})

Then('user clicks on page number {int}',(page)=>{
     cy.get(`a[href="?page=${page-1}"]`).eq(0).trigger('click', { followRedirect: false })
})