/// <reference types="Cypress"/>


Then('mega menu is displayed', () => {
    cy.get('#mega-nav').should('be.visible');
});
And('main categories titles are {string}', (titles) => {
    const allTitles = titles.split(',');
    cy.document().then(document => {
        const els = document.querySelectorAll('.nav-item.lvl-1>div.nav-item-title>a');
        for (let i = 0; i < els.length; i++) {
            expect(els[i].innerText).to.eq(allTitles[i]);
        }

    });

});

And('footer is displayed', () => {
    cy.get('#nvcgSlFooter').should('be.visible');
    cy.get('#nvcgSlFooter ul li a').each(el => {
        cy.wrap(el).should('have.attr', 'href').then(href => {
            expect(href).to.not.be.empty;
        })
    })
})

And('page options are displayed', () => {
    cy.get('#PageOptionsControl1').should('be.visible');
});

And('content is displayed', () => {
    cy.get('div#content').should('be.visible').and('not.be.empty');
});

And('page title is {string}', (title) => {
    cy.get(`h1:contains('${title}')`).should('be.visible');
});

And('the text {string} is displayed', (str) => {
    cy.get(`p:contains("${str}")`).should('be.visible');
});