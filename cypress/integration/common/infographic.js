/// <reference types="Cypress" />
import { Then } from "cypress-cucumber-preprocessor/steps";

Then('there should be an infographic at position {int} with the following', (number, dataTable) => {
    //index of a DOM element representing an image 
    let index = number - 1;

    for (const { attribute, value } of dataTable.hashes()) {
        // verify alt attribute of an image
        if (attribute === 'alt') {
            if (value === 'empty') {
                cy.get("figure[class*='centered']").eq(index).find('img').should(($div) => {
                    const el = $div.get(0);
                    expect(el.getAttribute('alt').trimEnd()).to.be.equal('');
                })
            } else {
                cy.get("figure[class*='centered']").eq(index).find('img').should(($div) => {
                    const el = $div.get(0);
                    expect(el.getAttribute('alt').trimEnd()).to.be.equal(value);
                })
            }
        }
        // verify image caption text
        if (attribute === 'caption') {
            if (value === 'none') {
                cy.get("figure[class*='centered']").eq(index).find('figcaption div p').should('not.exist');
            } else {
                cy.get("figure[class*='centered']").eq(index).find('figcaption div p').should(($div) => {
                    const el = $div.get(0);
                    expect(el.innerText).to.be.equal(value);
                });
            }
        }
        if (attribute === 'mobileImage') {
            if (value === 'none') {
                cy.get("figure[class*='centered']").find('picture').should('not.exist');
            } else {
                cy.get("figure[class*='centered'] picture").find("source[media='(max-width: 768px)']")
                    .should('have.attr', 'srcset').and('include', value);
            }
        } if (attribute === 'desktopImage') {
            cy.get("figure[class*='centered']").find('img').should('have.attr', 'src').and('include', value);
        }
    }

});


Then('{string} link appears below caption text with the href {string}', (linkText, linkHref) => {
    cy.get("figure[class*='centered']").find('figcaption a').should('have.text', linkText);
    cy.get("figure[class*='centered']").find('figcaption a').should('have.attr', 'href').and('include', linkHref);
});

Then('infographic at position {int} has a link {string} with the href {string}', (number, linkText, linkHref) => {
    console.log(`text ${linkText}`)
    console.log(number)
    console.log(linkHref)
    cy.get("figure[class*='centered']").eq(number - 1).find('figcaption a').invoke('text').should('be.eq', linkText);
    cy.get("figure[class*='centered']").eq(number - 1).find('figcaption a').should('have.attr', 'href').and('include', linkHref);
});


Then('there should be an infographic with the following', (dataTable) => {
    for (const { attribute, value } of dataTable.hashes()) {
        // verify alt attribute of an image
        if (attribute === 'alt') {
            if (value === 'empty') {
                cy.get("figure[class*='centered']").find('img').should(($div) => {
                    const el = $div.get(0);
                    expect(el.getAttribute('alt').trimEnd()).to.be.equal('');
                })
            } else {
                cy.get("figure[class*='centered']").find('img').should(($div) => {
                    const el = $div.get(0);
                    expect(el.getAttribute('alt').trimEnd()).to.be.equal(value);
                })
            }
        }
        // verify image caption text
        if (attribute === 'caption') {
            if (attribute === 'caption') {
                if (value === 'none') {
                    cy.get("figure[class*='centered']").find('figcaption div p').should('not.exist');
                } else {
                    cy.get("figure[class*='centered']").find('figcaption div').first().should(($div) => {
                        const el = $div.get(0);
                        expect(el.innerText).to.be.equal(value);
                    })
                }
            }
            //verify srcset of mobile (if present) and desktop image 
            if (attribute === 'mobileImage') {
                if (value === 'none') {
                    cy.get("figure[class*='centered']").find('picture').should('not.exist');
                } else {
                    cy.get("figure[class*='centered'] picture").find("source[media='(max-width: 768px)']")
                        .should('have.attr', 'srcset').and('include', value);
                }
            } if (attribute === 'desktopImage') {
                cy.get("figure[class*='centered']").find('img').should('have.attr', 'src').and('include', value);
            }
        }
    }
});

Then('{string} link should not appear', (viewAndPrintLink) => {
    cy.get("figure[class*='centered']").find('figcaption a').should('not.exist');
});

Then('language toggle is not displayed', () => {
    cy.get('ul.links').should('not.exist');
});

Then('language toggle is displayed with the href {string}', (langToggleHref) => {
    cy.get('ul.links a').should('exist').and('have.attr', 'href').and('be.eq', langToggleHref);

})


