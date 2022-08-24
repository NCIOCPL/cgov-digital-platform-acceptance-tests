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

And('correct {int} of top-level menu items is displayed', (number) => {
    cy.document().then(document => {
        const els = document.querySelectorAll('.nav-item.lvl-1>div.nav-item-title>a');
        expect(els.length).to.eq(number)
    });
});

And('all mega menu sections have the correct {string}', (path) => {
    const regex = new RegExp(`^\\${path}`);
    cy.get('li[class*="nav-item lvl-1"]>div.nav-item-title>a').each(el => {
        cy.wrap(el).should('have.attr', 'href').and('match', regex);
    })
});


And('footer is displayed', () => {
    cy.get('#nvcgSlFooter').should('be.visible');
    cy.get('#nvcgSlFooter ul li a').each(el => {
        cy.wrap(el).should('have.attr', 'href').then(href => {
            expect(href).to.not.be.empty;
        })
    })
})

And('the list of posts is displayed', () => {
    cy.get('.dynamic.list li').should('be.visible').and('not.be.empty');
});

And('page options are displayed', () => {
    cy.get('#PageOptionsControl1').should('be.visible');
});

And('content is displayed', () => {
    cy.get('div#content').should('be.visible').and('not.be.empty');
});

And('language toggle has a text {string}', (lbl) => {
    if (lbl.includes('none'))
        cy.get('#LangList1 li a').should('not.exist');
    else
        cy.get('#LangList1 li a').should('have.text', lbl);
});

Then('the system returns the results page for {string}', (term) => {
    cy.get('div.results > h3').should('include.text', term);
});

When('user types {string} in the search box', (keyword) => {
    cy.get("input#swKeyword").type(keyword);
});
And('user clicks search icon', () => {
    Cypress.on('uncaught:exception', (err, runnable) => {
        // returning false here to Cypress from
        // failing the test
        return false;
    })
    cy.get('button#sitesearch').click();
})
Then('user is redirected to {string}', (path) => {
    cy.url('pathname').should('include', path);
});

Given('app sends the request {string}', (req) => {

    cy.request(req).as('request');

});
Then('response status code is {int}', (code) => {
    cy.get('@request').should((response) => {
        expect(response.status).to.eq(code);
    })
});
And('the {string} is not empty', (param) => {
    cy.get('@request').should((response) => {
        const body = response.body;
        if (param.includes('body'))
            expect(body).to.not.be.empty;
        else
           expect( body[param]).to.not.be.empty;
    })
});

And('trial info displays {string}', (infoText) => {
    cy.get('.all-trials').invoke('text').then((text) => {
        const resultsText = text.split('\n').join(' ').split('\t').join('');
        const regex = new RegExp(infoText);
        expect(resultsText).to.match(regex);
    });
});

When(`user selects {int} result's checkbox`, (num) => {
    cy.get(`.results-list .cts-checkbox__label`).eq(num - 1).click();
});

And('user clicks on {string} button at {string} position', (printButton, printButtonPosition) => {
    cy.get(`div.results-page__control.--${printButtonPosition}`).find('button.results-page__print-button').contains(printButton).click();
});

Then('user is redirected to {string} with generated {string}', (redirectedPath, printID) => {
    cy.location('pathname').should('eq', redirectedPath);
    cy.location('search').should('include', `?${printID}=`);
});

And('page title is {string}',(title)=>{
    cy.get(`h1:contains('${title}')`).should('be.visible');
    });
    