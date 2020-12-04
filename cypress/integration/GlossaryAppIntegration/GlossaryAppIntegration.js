/// <reference types="Cypress" />
import { Given, When, Then } from 'cypress-cucumber-preprocessor/steps';

Then("NCI's Dictionary of Cancer Terms Widget links to {string}", (widgetHref) => {
  cy.get('#NCI-glossary-app-root div p a').should('have.attr', 'href').and('be.eq', widgetHref);
});

Then('search options for {string} and {string} are displayed', (startsWith, contains) => {
  cy.get('div.radio-selection label').first().should('include.text', startsWith);
  cy.get('div.radio-selection label').last().should('include.text', contains);
});

Then('{string} is selected by default', (a) => {
  cy.get('div.radio-selection').find("input[id='starts-with']").should('be.checked')
});

Then('{string} option is displayed below search bar', (browse) => {
  cy.document().then(doc => {
    const siblingEl = doc.querySelector('span.browse');
    expect(siblingEl.firstChild.wholeText).to.include(browse);
    expect(siblingEl.parentNode.previousSibling.className).to.be.eq('dictionary-search');
  })
});

Then('browse option contains all alphabetic letters and {string} appears at the end of the list', (a) => {
  cy.document().then(doc => {
    const browseOptions = doc.querySelectorAll('nav.az-list ul li');
    for (let i = 0; i < browseOptions.length - 1; i++) {
      let int = browseOptions[i].textContent;
      expect(int).to.match(/[A-Z]/);
    }
    expect(browseOptions[browseOptions.length - 1].textContent).to.be.eq(a)
  });

});

Then('each option appears as a link', () => {
  cy.get('nav.az-list ul li a').each((el) => {
    expect(el).to.have.attr('href');
  })
});

Then('the page is showing the expand results for letter {string}', (letter) => {
  let results;

  cy.url().then(url => {
    if (url.includes('espanol'))
      results = `resultados de: ${letter}`;
    else
      results = `results found for: ${letter}`;

    cy.get("div[class='dictionary-list-container results'] h4").should('include.text', results);
  });
});

Then('search bar is displayed below introductory text', () => {
  cy.get('form[data-testid="tid-dictionary-search"]').should('be.visible');
  cy.document().then(doc => {
    expect(doc.querySelector('form[data-testid="tid-dictionary-search"]').parentNode.previousElementSibling.firstChild.tagName).to.be.eq('P');
  });
});

Then('{string} is displayed as the submit button', (searchButton) => {
  cy.get('input#btnSearch').should('have.value', searchButton);
});

Then('the introductory text appears', () => {
  cy.get('#NCI-glossary-app-root div p:nth-of-type(1)').should('be.visible').invoke('text').should('not.be.empty');
});

Then('the number of glossary terms appears in the text', () => {
  cy.get('#NCI-glossary-app-root div p:nth-of-type(1)').should('not.include.text', '{{term_count}}');
  cy.document().then(doc => {
    const paragraph = doc.querySelector('#NCI-glossary-app-root div p:nth-of-type(1)').textContent;
    expect(paragraph).to.match(/(?=.*\d+).+/);
  });
});

Then('{string} links to {string}', (link, href) => {
  cy.get(`a[href='${href}']`).should('include.text', link);
});

Then('page title is {string}', (pageTitle) => {
  cy.get('h1').first().should('include.text', pageTitle);
});

Then('error page title is {string}', (pageTitle) => {
  cy.get('div.error-container > h1').should('include.text', pageTitle);
});

Then('page displays left navigation', () => {
  cy.get('#nvcgSlSectionNav').should('be.visible');
});

Given('user is navigating to bad url {string}', (badUrl) => {
  cy.visit(badUrl,{failOnStatusCode: false});
});

Then('status code is {int} on {string}',(statusCode,badApi)=>{
  cy.request({
    url: badApi,
    failOnStatusCode: false
  }).then((resp) => {
    expect(resp.status).to.be.eq(statusCode);
  })
});
 
