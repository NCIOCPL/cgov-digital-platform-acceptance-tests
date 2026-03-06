/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';


And('user enters {string} into content title search box and clicks {string}', (nameToSearch, applyBtn) => {
    cy.getIframeBody('iframe#entity_browser_iframe_embedded_external_link_browser').find(`input[id*="edit-info"]`).type(nameToSearch);
    cy.getIframeBody('iframe#entity_browser_iframe_embedded_external_link_browser').find(`input[id*="edit-submit-external-link-content-browser"][value=${applyBtn}]`).click({ force: true });
    cy.wait(2000)
});

And('user selects {string} item from the content list', (contentTitle) => {
    cy.getIframeBody('iframe#entity_browser_iframe_embedded_external_link_browser').find('input[name^="entity_browser_select"][type="checkbox"]').check();
});

And('user clicks on {string} button to select the media', (selectImage) => {
    cy.getIframeBody('iframe#entity_browser_iframe_embedded_external_link_browser').find(`input[id="edit-submit"][value='${selectImage}']`).click({ force: true });
});

And('{int} feature card displays the following features in external link block', (position, dataTable) => {
    for (let { alignment, linkText, link, description, descTitleText } of dataTable.hashes()) {
        cy.get(`section.cgdp-article-body__section`).eq(position - 1).as('card');
        if (link.includes("{TEST_SITE_SECTION}")) {
            link = link.replace('{TEST_SITE_SECTION}', siteSection)
        }
        if (alignment !== 'align-center embedded-entity') {
            cy.get('@card').find(`a:contains("${linkText}")`).should('be.visible').and('have.attr', 'href').then(href => {
                expect(href).to.include(link);
            });
            cy.get('@card').find(`p:contains("${description}")`).should('be.visible');
            cy.get('div[data-entity-type="block_content"]').eq(position - 1).should('have.attr', 'class').and('include', alignment);
        }
        else {
            cy.get('div#cgvBody section a').eq(position - 1).should('have.attr', 'href').then(href => {
                expect(href).to.include(link);
            });
            cy.get('div#cgvBody section').eq(position - 1).find('img').parent().should('have.attr', 'class').and('include', alignment);
        }
    }
});

And('{int} feature card does not display any image', (position) => {
    cy.get('div[data-entity-type="block_content"]').eq(position - 1).should('not.have.css', 'img');
});