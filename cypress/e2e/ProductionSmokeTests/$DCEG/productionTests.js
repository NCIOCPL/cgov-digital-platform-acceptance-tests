/// <reference types="Cypress"/>


Then('mega menu is displayed', () => {
    cy.get('nav.nci-header-nav').should('be.visible');
});
And('main categories titles are {string}', (titles) => {
    const allTitles = titles.split(',').map(title => title.trim());
    cy.get('.nci-header-nav__primary-item span').should(els => {
        expect(els, 'number of main category titles').to.have.length(allTitles.length);
        const actualTitles = [...els].map(el => el.textContent.trim());
        expect(actualTitles).to.deep.eq(allTitles);
    });
});

And('footer is displayed', () => {
    cy.get('footer#nci-footer').should('be.visible');
    cy.get('footer#nci-footer a').each(el => {
        cy.wrap(el).should('have.attr', 'href').then(href => {
            expect(href).to.not.be.empty;
        })
    })
})

And('page options are displayed', () => {
    cy.get('.cgdp-page-options').should('be.visible')
    .and('have.length',2);
});

And('content is displayed', () => {
    cy.get('main#main-content,div#content').should('be.visible').and('not.be.empty');
});

And('page title is {string}', (title) => {
    cy.get(`h1:contains('${title}')`).should('be.visible');
});

And('the text {string} is displayed', (str) => {
    cy.get(`p:contains("${str}")`).should('be.visible');
});
