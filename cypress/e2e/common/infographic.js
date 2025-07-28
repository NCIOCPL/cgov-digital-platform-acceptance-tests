/// <reference types="Cypress" />
import { Then } from "cypress-cucumber-preprocessor/steps";
import { getBaseDirectory } from "../../utils";
Then('there should be an infographic at position {int} with the following', (number, dataTable) => {
    //index of a DOM element representing an image 
    let index = number - 1;

    for (const { attribute, value } of dataTable.hashes()) {
        // verify alt attribute of an image
        if (attribute === 'alt') {
            if (value === 'empty') {
                cy.get(".cgdp-infographic figure").eq(index).find('img').should(($div) => {
                    const el = $div.get(0);
                    expect(el.getAttribute('alt').trimEnd()).to.be.equal('');
                })
            } else {
                cy.get(".cgdp-infographic figure").eq(index).find('img').should(($div) => {
                    const el = $div.get(0);
                    expect(el.getAttribute('alt').trimEnd()).to.be.equal(value);
                })
            }
        }
        // verify image caption text
        if (attribute === 'caption') {
            if (value === 'none') {
                cy.get(".cgdp-infographic figure").eq(index).find('figcaption div p').should('not.exist');
            } else {
                cy.get(".cgdp-infographic figure").eq(index).find('figcaption div p').should(($div) => {
                    const el = $div.get(0);
                    expect(el.innerText).to.be.equal(value);
                });
            }
        }
        if (attribute === 'mobileImage') {
            if (value === 'none') {
                cy.get(".cgdp-infographic figure").find('picture').should('not.exist');
            } else {
                const regex = new RegExp (value);
                cy.get(".cgdp-infographic figure").find("source[media='(max-width: 768px)']")
                    .should('have.attr', 'srcset').and('match', regex);
            }
        } if (attribute === 'desktopImage') {
            const regex = new RegExp (value);
            cy.get(".cgdp-infographic figure").find('img').should('have.attr', 'src').and('match', regex);
        }
    }

});


Then('{string} link appears below caption text with the href {string}', (linkText, linkHref) => {
    const regex = new RegExp (linkHref);
    cy.get(".cgdp-infographic__link-container").find('a').should('have.text', linkText);
    cy.get(".cgdp-infographic__link-container").find('a').should('have.attr', 'href').and('match', regex);
});

Then('infographic at position {int} has a link {string} with the href {string}', (number, linkText, linkHref) => {
    const regex = new RegExp (linkHref);
     cy.get(".cgdp-infographic figure").eq(number - 1).find('figcaption a').invoke('text').should('be.eq', linkText);
    cy.get(".cgdp-infographic figure").eq(number - 1).find('figcaption a').should('have.attr', 'href').and('match', regex);

});


Then('there should be an infographic with the following', (dataTable) => {
    for (const { attribute, value } of dataTable.hashes()) {
        // verify alt attribute of an image
        if (attribute === 'alt') {
            if (value === 'empty') {
                cy.get(".cgdp-infographic figure").find('img').should(($div) => {
                    const el = $div.get(0);
                    expect(el.getAttribute('alt').trimEnd()).to.be.equal('');
                })
            } else {
                cy.get(".cgdp-infographic figure").find('img').should(($div) => {
                    const el = $div.get(0);
                    expect(el.getAttribute('alt').trimEnd()).to.be.equal(value);
                })
            }
        }
        // verify image caption text
        if (attribute === 'caption') {
            if (attribute === 'caption') {
                if (value === 'none') {
                     cy.get(".cgdp-infographic figure").find('figcaption div p').should('not.exist');
                } else {
                    cy.get(".cgdp-infographic figure").find('figcaption p').first().should(($div) => {
                        const el = $div.get(0);
                        expect(el.innerText).to.be.equal(value);
                    })
                }
            }
        }
        //verify srcset of mobile (if present) and desktop image 
        if (attribute === 'mobileImage') {
            if (value === 'none') {
                cy.get(".cgdp-infographic figure").find('picture').should('not.exist');
            } else {
                const regex = new RegExp (value);
                cy.get(".cgdp-infographic figure").find("source[media='(max-width: 639px)']")
                    .should('have.attr', 'srcset').and('match', regex);

            }
        } if (attribute === 'desktopImage') {
            const regex = new RegExp (value);
            cy.get(".cgdp-infographic figure").find('img').should('have.attr', 'src').and('match', regex);
        }
    }
});

Then('{string} link should not appear', (viewAndPrintLink) => {
    cy.get(".cgdp-infographic__link-container").find('a').should('not.be.visible');
});

Then('language toggle is not displayed', () => {
    cy.get('header.usa-banner__header a').should('not.exist');
});

Then('language toggle is displayed with the href {string}', (langToggleHref) => {
    cy.get('header.usa-banner__header a').should('exist').and('have.attr', 'href').and('eq', `${getBaseDirectory()}${langToggleHref}`);

})


