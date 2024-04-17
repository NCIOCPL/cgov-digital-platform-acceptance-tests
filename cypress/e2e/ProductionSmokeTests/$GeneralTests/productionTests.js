/// <reference types="Cypress"/>

const baseUrl = "https://www.cancer.gov";

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

And('correct {int} of top-level menu items is displayed', (number) => {
    cy.document().then(document => {
        const els = document.querySelectorAll('.nci-header-nav__primary-item');
        expect(els.length).to.eq(number)
    });
});

And('all mega menu sections have the correct {string}', (path) => {
    const regex = new RegExp(`^\\${path}`);
    cy.get('.nci-header-nav__primary-item button,.nci-header-nav__primary-item a').each(el => {
        //expand megamenu first to check links
        cy.wrap(el).trigger('click', { followRedirect: false });
        cy.get("a[class='nci-megamenu__primary-link'],.nci-megamenu__list-item-link").each(el => {
            const href = el[0].getAttribute('data-href') ? (el[0].getAttribute('data-href')).replace(baseUrl, "") : el[0].getAttribute('href');
            expect(href).to.match(regex);
        })
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

And('the list of posts is displayed', () => {
    cy.get('.dynamic.list li').should('be.visible').and('not.be.empty');
});

And('page options are displayed', () => {
    cy.get('.cgdp-page-options').should('be.visible')
        .and('have.length', 2);
});

And('content is displayed', () => {
    cy.get('main#main-content,div#content').should('be.visible').and('not.be.empty');
});

And('language toggle has a text {string}', (lbl) => {
    if (lbl.includes('none'))
        cy.get('.usa-banner__header a').should('not.exist');
    else
        cy.get('.usa-banner__header a').should('have.text', lbl);
});

Then('the system returns the results page for {string}', (term) => {
    cy.get('div.results > h3').should('include.text', term);
});

When('user types {string} in the search box', (keyword) => {
    cy.get("input#swKeyword").type(keyword);
});

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
            expect(body[param]).to.not.be.empty;
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
    Cypress.on('uncaught:exception', (error, runnable) => {
        if (error.message.includes('ReferenceError: attachEvents is not defined')) {
            return false
        } else {
            throw error;
        }
    })
    cy.location('pathname').should('eq', redirectedPath);
    cy.location('search').should('include', `?${printID}=`);
});

And('page title is {string}', (title) => {
    cy.get(`h1:contains('${title}')`).should('be.visible');
});

Then('thumbnail images are displayed', () => {
    cy.get("div[class*='views-element-container'] img").each(el => {
        cy.wrap(el).should('be.visible');
    })
});
And('the image src contains {string}', (source) => {
    cy.get("div[class*='views-element-container'] img").each(el => {
        cy.wrap(el).should('have.attr', 'src').and('include', source)
    })
});

And('the text {string} is displayed', (str) => {
    cy.get(`p:contains("${str}")`).should('be.visible');
});

Then('search results page title is {string}', (title) => {
    Cypress.on('uncaught:exception', (error, runnable) => {
        return false
    })
    cy.get(`h1:contains('${title}')`).should('be.visible');
});