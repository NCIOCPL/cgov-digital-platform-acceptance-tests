import { Then } from "cypress-cucumber-preprocessor/steps";
import {getClickBeacon} from "../../utils/getClickBeacon.js"

Then('the following parameters should be captured', dataTable => {
    const rawTable = dataTable.rawTable.slice();
    const beacon = getClickBeacon();
    for (let j = 0; j < rawTable.length; j++) {
        let row = rawTable[j];
        expect(beacon[row[0]]).to.be.equal(row[1]);
    }
});


Then('pageName and pageURL parameters contain current url', (pagename, pageUrl) => {
    let hoverBeacon = getClickBeacon();
    cy.url().should('be.eq', hoverBeacon.pageURL);
    cy.url().should('contain', hoverBeacon.pageName);
});

Given('user is navigating to {string}', (a) => {
    cy.visit(a);
  });

  Then("browser title is {string}", (title) => {
    cy.title().should('eq', title);
  });
  
  Then('the following page load parameters should be captured',dataTable => {
   const rawTable = dataTable.rawTable.slice();
   // assertions for each entry parameter provided
      for (let j = 0; j < rawTable.length; j++) {
          let row = rawTable[j];
          expect(Cypress.LoadBeacon[row[0]]).to.be.equal(row[1]);
      }
  });


Then('the following events are captured', dataTable=>{
    const rawTable = dataTable.rawTable.slice();
    // assertions for each entry parameter provided
    for (let j = 0; j < rawTable.length; j++) {
      let row = rawTable[j];
     expect(Cypress.LoadBeacon[row[0]]).to.include(row[1]);
    }
  });


Then('the following parameters contain current url', dataTable => {
    const rawTable = dataTable.rawTable.slice();
    // assertions for each entry parameter provided
    for (let j = 0; j < rawTable.length; j++) {
      let row = rawTable[j];
      cy.url().should('include', Cypress.LoadBeacon[row[0]]);
    }
  });