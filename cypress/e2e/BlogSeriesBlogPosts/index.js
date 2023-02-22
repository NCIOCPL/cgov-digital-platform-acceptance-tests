/// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';
import { getBaseDirectory } from '../../utils';
And('the {string} button appears', (linkSubscribe) => {
    cy.get('div.subscribeRSS span').should('be.visible').and('contain.text', linkSubscribe);
});

And('the {string} managed list appears with a date {string}', (featuredPosts, date) => {
    cy.get('div.managed.list.with-date').should('be.visible').and('contain.text', featuredPosts).and('contain.text', date);
});

And('the {string} managed list appears without a date', (categories) => {
    cy.get('div.managed.list.without-date').should('be.visible').and('contain.text', categories);
});

And('the {string} accordion is displayed', (archive) => {
    cy.get('div#blog-archive-accordion').should('be.visible').and('contain.text', archive);
});

And('{string} accordion is collapsed', (archive) => {
    cy.get('div#blog-archive-accordion').contains(archive).should('have.attr', 'aria-expanded', 'false');
});

And('blog posts list appears', () => {
    cy.get('div.item-list span').should('be.visible');
});

And('{string} button appears with a link {string}', (postLink, link) => {
    cy.get(`a:contains("${postLink}")`).should('be.visible').and('have.attr','href').and('eq',`${getBaseDirectory()}${link}`);
});

When('user clicks on {string} button', (olderPostLink) => {
    cy.get('div.clearfix').contains(olderPostLink).click();
});

And('each blog post has a title, time, description and {string} button', (linkButton) => {
    cy.get('a.title span').should('be.visible').invoke('text').should('not.be.empty');
    cy.get('div.date-author time').should('be.visible').invoke('text').should('not.be.empty');
    cy.get('div.description p').should('be.visible').invoke('text').should('not.be.empty');
    cy.get('div.description p').find('a').first().should('have.text', linkButton);
});

And('{int} blog has a date as {string}', (blogPosition, date) => {
    cy.get('div.date-author').eq(blogPosition - 1).find('time').should('have.text', date);
});

And('{int} blog has an image with an url {string}', (blogPosition, link) => {
    cy.get('div.item-list').eq(blogPosition - 1).find('a').should('have.attr','href').and('eq',`${getBaseDirectory()}${link}`);
});

And(`{int} blog's title and continue reading button both link to {string}`, (blogPosition, link) => {
    cy.get('div.item-list').eq(blogPosition - 1).find('a').should('have.attr','href').and('eq',`${getBaseDirectory()}${link}`);
    cy.get('div[class*="title-and-desc"]').eq(blogPosition - 1).find('a').should('have.attr','href').and('eq',`${getBaseDirectory()}${link}`);
});

When('user clicks on {string} accordion', (archive) => {
    cy.get('div#blog-archive-accordion').contains(archive).click();
});

And('{int} blog has no image', (blogPosition) => {
    cy.get('div.item-list a').eq(blogPosition - 1).find('img').should('not.exist');
});

And('{int} blog has an author {string}', (blogPosition, author) => {
    cy.get('div.date-author').eq(blogPosition - 1).should('be.visible').and('contain.text', author);
});

Then('{string} section is expanded', (archive) => {
    cy.get('div#blog-archive-accordion').contains(archive).should('have.attr', 'aria-expanded', 'true');
});

And('the following sections are displayed', (dataTable) => {
    for (const { title, isExpanded } of dataTable.hashes()) {
        cy.get('div#blog-archive-accordion').find(`h3:contains('${title}')`).should('have.attr', 'aria-expanded', isExpanded);
    }
});

And('months links are displayed', () => {
    cy.get('div#blog-archive-accordion').find('a').should('be.visible');
});

And('blog posts list doesnot appear', () => {
    cy.get('div.item-list span').should('not.exist');
});

And('only {int} blog appear', (count) => {
    cy.get('div.item-list a.title').should('be.visible').and('have.length', count);
});

Then('the text {string} appears', (errorText) => {
    cy.get(`div#content`).should('be.visible').and('include.text',errorText);
});

And(`blog's posted date is {string}`, (postedDate) => {
    cy.get('div.cgvblogpost p').find('time').should('have.text', postedDate);
});

And('user clicks on blog post image number {int}', (positionNumber) => {
    cy.get('a.item-image.image').eq(positionNumber - 1).trigger('click', { followRedirect: false });
});



Then('status code is {int} on {string}', (statusCode, badApi) => {  
const baseUrlFromConfig = Cypress.config("baseUrl");
const replacedUrl = badApi.replace("{BASE_URL}",baseUrlFromConfig);
    cy.request({
      url: replacedUrl,
      failOnStatusCode: false
    }).then((resp) => {
      expect(resp.status).to.be.eq(statusCode);
    }) 
  });


