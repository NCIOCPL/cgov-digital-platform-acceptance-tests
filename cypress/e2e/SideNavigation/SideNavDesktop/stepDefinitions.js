/// <reference types="Cypress" />
import { And, Then } from 'cypress-cucumber-preprocessor/steps';

Then('the current page is {string}', (label) => {
    cy.get('a[class="usa-current"]').should('have.text', label);
});

And('{int} level up section is {string}', (level, label) => {
    let ancestors;
    cy.document().then(doc => {
        ancestors = doc.querySelectorAll('.usa-current.usa-current--nci-ancestor').length;
        cy.get('.usa-current.usa-current--nci-ancestor').eq(ancestors - level).should('have.text', label);
    })

});

And('the following nav children are displayed', (dataTable) => {
    let counter = 0;
    const rows = dataTable.raw();
    cy.get('a[class="usa-current"]').siblings('ul').children().each(($el) => {
        const child = $el[0].querySelector('li a');
        expect(child.innerText).to.eq((rows[counter][0]));
        counter++;
    })
});

And('the following nav siblings are displayed', (dataTable) => {
    let counter = 0;
    const rows = dataTable.raw();
    cy.get('a[class="usa-current"]').parent().siblings('li').each(($el) => {
        const child = $el[0].querySelector('a');
        expect(child.innerText).to.eq((rows[counter][0]));
        counter++;
    });
});

And('the children are not displayed',()=>{
    cy.get('a[class="usa-current"]').siblings('ul').should('have.length',0);
});

Then('the current page is not displayed in the side nav',()=>{
    cy.get('a[class="usa-current"]').should('not.exist');
});

When('user clicks on {string} section',(label)=>{
cy.get(`nav[aria-label='Secondary navigation']`).find('a').contains(new RegExp(`^${label}$`)).click();
});

And('the {string} section is not displayed',(label)=>{
    cy.get(`nav[aria-label='Secondary navigation']`).find('a').contains(new RegExp(`^${label}$`)).should('not.exist');
});

And('side nav is not displayed',()=>{
cy.get("nav[aria-label='Secondary navigation']").should('not.exist');
});

When('user clicks on {string} link',(link)=>{
    cy.get(`nav[aria-label='Secondary navigation']`).find('a').contains(new RegExp(`^${link}$`))
    .trigger('click',{followRedirect:false});
});
