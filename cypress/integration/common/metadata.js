/// <reference types="Cypress" />
/*****************
 * This file contains all the steps for asserting metadata.
 *****************/
import { Given, When, Then } from "cypress-cucumber-preprocessor/steps";
import { convertBeacon } from "../../utils";

Then("browser title is {string}", (title) => {
  cy.title().should('eq', title);
});

Given('user is navigating to {string}', (a) => {
  cy.visit(a);
});

Then('the common load event properties are captured',()  => {
  
cy.window().then((win) => {
   //create a map of request being sent of
   const networkrequests = win.performance.getEntries().map(r => r.name);
   //list of URLs collected
   const urlList = new Array();
   for(let i=0; i<networkrequests.length; i++){
      const temp = networkrequests[i].toString()
    if(temp.includes('b/ss')){
       //find the GA url and store it
        urlList.push(networkrequests[i]);
     }
   }   
 const analyticObject = convertBeacon(urlList[urlList.length-1]);
 //Assertions:
cy.url().should('be.eq',analyticObject.prop1);
cy.location('pathname').should('be.eq',analyticObject.prop3);
cy.title().should('be.eq',analyticObject.prop10);
cy.get("meta[name='dcterms.isPartOf']").invoke('attr','content').should('be.eq',analyticObject.prop44);
expect(analyticObject.prop42).to.be.equal('Normal');
expect(analyticObject.prop65).to.match(/^\d{1,4}$/);
expect(analyticObject.prop26).to.match(/^\d{4}\|\d{1,2}\|\d{1,2}\|\d{1,2}$/);
expect(analyticObject.prop29).to.match(/^\d{1,2}:\d{2} (AM|PM)\|[a-zA-z]+day$/);
expect(analyticObject.events).to.contain('event1');
expect(analyticObject.events).to.contain('event47');

//global variable to convert the language captured in meta tag with language emitted by GA

let language;
//get the language emitted
const intermidiate = analyticObject.prop8;

//to dynamically compare values, c8 event capture language as 'english' or 'spanish'
//whereas metatag holds 'en' and 'es' 
if (intermidiate==='english'){
  language = 'en';
}
else if(intermidiate==='spanish'){
  language = 'es';
}
cy.get("meta[http-equiv='content-language'").invoke('attr','content').should('be.equal',language);
})
});