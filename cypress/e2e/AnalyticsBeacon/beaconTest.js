/// <reference types="Cypress" />

import { Given, Then } from "cypress-cucumber-preprocessor/steps";
import { convertBeacon } from "../../utils";

Given("the beacon url is {string}", (url) => {
  Cypress.BEACON = convertBeacon(url);
});

Then("the following analytics variables should be captured", dataTable => {
  const rawTable = dataTable.rawTable.slice();
  for (let j = 0; j < rawTable.length; j++) {
    const row = rawTable[j];
    expect(Cypress.BEACON[row[0]]).to.be.equal(row[1]);
  }
});

Then("the app should throw and error with incorrect url {string}", (url) => {
  try {
    convertBeacon(url);
  } catch (err) {
    expect(err.message).to.include("Invalid variable")
  }

});