/// <reference types="Cypress" />
import { When, And } from "cypress-cucumber-preprocessor/steps";
const rootDiv = 'div#NCI-CTS-root';
When('user clicks on {string} button', (buttonLabel) => {
  if (buttonLabel === "Modify Search Criteria") {
    cy.get(rootDiv).find('button.btnAsLink').contains(buttonLabel).trigger('click', { followRedirect: false });
  } else {
    cy.get(rootDiv).find('button').contains(buttonLabel).click();
  }
});
When('user types {string} in {string} field', (inputText, fieldLabel) => {
  cy.get(`div input[aria-label="${fieldLabel}"]`).type(inputText);
});
When('user clicks on {int} trial result', (resultItem) => {
  cy.get('.results-list__item a').eq(resultItem - 1).trigger('click', { force: true, followRedirect: false });
});
When('user checks {string} checkbox on {int} pages', (label, page) => {
  for (let i = 1; i <= page; i++) {
    cy.get('div.pager__num').contains(`${i}`).click()
    cy.get('label.cts-checkbox__label').contains(label).parent().find('input').check({ force: true });
  }
})
When('user clicks on share by {string} button', (option) => {
  if (option === 'Print') {
    cy.window().then(win => {
      //same approach we used on platform testig and it works, in the app it does not!(
      //stubbing the print window to prevent the call to open it, 
      //but still triggering the click event
      const printStub = cy.stub(win, 'print')
      cy.get("button").contains(option).click({ force: true });

    })
  } else {
    cy.get('button[class="share-btn cts-share-email"]').invoke('removeAttr', 'target')
    cy.get('button[class="share-btn cts-share-email"]')
      .then(button$ => {
        button$.on('click', e => {
          //this is useless since cypress still waits for a new page to load 
          // and it never loads - timeout and fail!
          e.preventDefault();
        });
      })
      .click({ followRedirect: false });

  }
});
And('user clicks on {string} link', (linkText) => {
  cy.get(rootDiv).find('div.reset-form a').contains(linkText).trigger('click', { force: true, followRedirect: false });
});
When('user checks {string} checkbox', (label) => {
  cy.get('label.cts-checkbox__label').contains(label).parent().find('input').check({ force: true });
});

And('browser waits', () => {
  cy.wait(2000);
});

And('user clears form', () => {
  //needs implementing
});