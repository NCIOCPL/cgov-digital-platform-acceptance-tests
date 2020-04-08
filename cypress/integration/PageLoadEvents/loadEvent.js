/// <reference types="Cypress" />
/*****************
 * This file contains all the steps for asserting metadata.
 *****************/
import { Then, When } from "cypress-cucumber-preprocessor/steps";
import { convertBeacon } from "../../utils/index.js"


Then('prop26, prop29, prop 65 are matching expected format', () => {
  expect(Cypress.LoadBeacon.prop65).to.match(/^\d{1,4}$/);
  expect(Cypress.LoadBeacon.prop26).to.match(/^\d{4}\|\d{1,2}\|\d{1,2}\|\d{1,2}$/);
  expect(Cypress.LoadBeacon.prop29).to.match(/^\d{1,2}:\d{2} (AM|PM)\|[a-zA-z]+day$/);
});

Then('the following parameters contain current url', dataTable => {
  const rawTable = dataTable.rawTable.slice();
  // assertions for each entry parameter provided
  for (let j = 0; j < rawTable.length; j++) {
    let row = rawTable[j];
    cy.url().should('include', Cypress.LoadBeacon[row[0]]);
  }
});


When('page load request is sent', () => {
  cy.window().then((win) => {
    //create a map of request being sent of
    const networkrequests = win.performance.getEntries().map(r => r.name);
    //list of URLs collected
    const urlList = new Array();
    for (let i = 0; i < networkrequests.length; i++) {
      let temp = networkrequests[i].toString();

      //find Adobe request and store it in the urlList
     
        if (temp.includes(Cypress.env('trackingServer')[0]) || temp.includes(Cypress.env('trackingServer')[1])) 
        urlList.push(networkrequests[i]);
       
      
    }
    Cypress.LoadBeacon = convertBeacon(urlList[urlList.length - 1]);
    console.log(Cypress.LoadBeacon)
  });
});

Then('the following events are captured', dataTable=>{
  const rawTable = dataTable.rawTable.slice();
  // assertions for each entry parameter provided
  for (let j = 0; j < rawTable.length; j++) {
    let row = rawTable[j];
   expect(Cypress.LoadBeacon[row[0]]).to.include(row[1]);
  }
});

