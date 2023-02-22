/// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';
import { getBaseDirectory } from '../../utils';

And('the individuals title is {string}', (individualTitle) => {
    cy.get('div[class="profile-title"]').should('be.visible').and('include.text', individualTitle)
})

And('the following organizations are listed for this individual', (dataTable) => {
    for (const { organization } of dataTable.hashes()) {
        cy.get("div[class='profile-orgs'] div").should('be.visible').and('include.text', organization)
    }
})

And('individuals office is at {string}', (address) => {
    cy.document().then(doc => {
        const addressInnerText = doc.querySelector("div[class='profile-panel-content'] p").innerText;
        expect(addressInnerText).to.be.eq(address)
        cy.get("div[class='profile-panel-content'] p").should('be.visible')
    });
   
   })

And('contact phone number is {string}', (phone) => {
    cy.get('.profile-contact-info').should('be.visible').and('include.text', phone)
})

And('contact email is {string}', (email) => {
    cy.get(`a:contains("${email}")`).should('be.visible')
})

And('the following social media links are present', (dataTable) => {
    for (const { socialMedia, href } of dataTable.hashes()) {
        cy.get(`a[href="${href}"]`).should('be.visible')
    }
})

And('biography description contains text {string}', (socialMedia) => {
    cy.get("div[id='cgvBody'] p ").should('be.visible').and('include.text', socialMedia)
})

And('{string} section contains the following links', (sectionTitle, dataTable) => {
    for (const { title, href } of dataTable.hashes()) {
        cy.get(`div#nvcgRelatedResourcesArea li a:contains('${title}')`).should('have.attr','href').and('include',`${href}`);
    }
})

And('{string} date stamp displays {string}', (date, timeStamp) => {
    cy.get('ul.clearfix li strong').should('be.visible').and('include.text', date)
    cy.get('ul.clearfix li time').should('be.visible').and('have.text', timeStamp)
})

And('date stamp does not exist', () => {
    cy.get('ul.clearfix li time').should('not.exist')
})

And('the following organizations with links are listed for this individual', (dataTable) => {
    for (const { organization, url } of dataTable.hashes()) {
        cy.get(`div#nvcgSlProfilePanel div a:contains('${organization}')`).should('have.attr', 'href').and('eq', `${url}`);
    }
})

And('{string} icon link has a href {string}', (linkText, linkUrl) => {
    cy.get(`a[href="${linkUrl}"]`).should('include.text', linkText)

})


