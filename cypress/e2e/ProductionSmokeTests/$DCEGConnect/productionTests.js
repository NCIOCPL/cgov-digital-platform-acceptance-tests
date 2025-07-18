/// <reference types="Cypress"/>

Then('mega menu is displayed', () => {
    cy.get('nav.nci-header-nav').should('be.visible');
});
And('main categories titles are {string}', (titles) => {
    const allTitles = titles.split(',');
    cy.document().then(document => {
        const els = document.querySelectorAll('.nci-header-nav__primary-item span');
        for (let i = 0; i < els.length; i++) {
            expect(els[i].textContent).to.eq(allTitles[i]);
        }

    });
});


And('all mega menu sections have the correct {string}', (path) => {
    const regex = new RegExp(`^\\${path}`);
    cy.get('a.nci-header-nav__primary-link').each(el => {
        const href = el[0].getAttribute('data-href') ? (el[0].getAttribute('data-href')).replace(baseUrl, "") : el[0].getAttribute('href');
        expect(href).to.match(regex);

    })
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
    cy.get('.cgdp-page-options').should('be.visible').and('have.length', 2);
});

And('content is displayed', () => {
    cy.get('div.cgdp-inner-content-area').should('be.visible').and('not.be.empty');
});
