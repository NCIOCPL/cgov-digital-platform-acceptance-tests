/// <reference types="Cypress" />
import { Given, Then } from 'cypress-cucumber-preprocessor/steps';

let response;

Given('request is sent to {string}', (path) => {
    cy.request({
        url: path,
    }).then((resp) => {
        response = resp;
    })

});

Then('the {string} header specifies the following', (header, dataTable) => {
    const locator = response.headers[header];
    const individualLoc = locator.split(';');
    let expectedContents = new Array;
    expect(Array.from(individualLoc.entries()).length).to.eq(dataTable.rows().length);
    for (const { headerContents } of dataTable.hashes()) {
        expectedContents.push(headerContents);
    }
    for (let i = 0; i < individualLoc.length; i++) {
        expect(individualLoc[i]).to.include(expectedContents[i]);
    }
});