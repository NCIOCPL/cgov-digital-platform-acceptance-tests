/// <reference types="Cypress" />
import { And, Then } from "cypress-cucumber-preprocessor/steps";

//This step is just a workaround until it gets fixed (see issue #118)
Given("user is navigating to {string}", (a) => {
  Cypress.on("uncaught:exception", (err, runnable) => {
    //there is an existing issue with PDQ content console errors
    // we don't want to fail the test so we return false
    if (err.message.includes("getAttribute")) {
      return false;
    }
  });
  cy.visit(a);
});

Then(
  "{string} section displays below the intro text {string}",
  (onThisPage, introText) => {
    cy.get("nav.on-this-page span")
      .should("be.visible")
      .and("include.text", onThisPage);
    cy.get("nav.on-this-page").prev().should("include.text", introText);
    
  }
);
And(
  "{string} section displays before the first body section titled {string}",
  (onThisPage, title) => {
    cy.get("nav.on-this-page span").should("include.text", onThisPage);
    cy.get("nav.on-this-page")
      .next()
      .find("section h2")
      .first()
      .invoke("text")
      .should("include", title);
  }
);

Then(
  "the body section accordion displays below the intro text {string}",
  (introText) => {
    //verify that the on this page is not visible
    cy.get('div[class^="accordion"]').prev().should("not.be.visible");
    //verify intro text is directly above accordion and visible
    cy.get('div[class^="accordion"]')
      .prev()
      .prev()
      .should("be.visible")
      .and("include.text", introText);
  }
);

And("{string} section does not display", (onThisPage) => {
  //verify that the on this page is not visible
  cy.get('div[class^="accordion"]')
    .prev()
    .contains(onThisPage)
    .should("not.be.visible");
});

Then("{string} section does not exist", (onThisPage) => {
  cy.get("nav.on-this-page").should("not.exist");
});

And("the body section accordion displays below page options", () => {
  cy.get('div[class^="accordion"]')
    .parent()
    .parent()
    .prev()
    .should("have.class", "page-options-container")
    .and("be.visible");
});

And("the intro text displays {string}", (introText) => {
  cy.get(".pdq-sections p").first().should("include.text", introText);
});

Then(
  "the intro text {string} appears following the {string} title {string}",
  (text, tag, title) => {
    //find h1 first and assert its text
    cy.get(`${tag}`).should('be.visible').and('have.text',title);
    cy.get(`${tag}`).next().find(`p:contains("${text}")`).should('be.visible')
  }
);

And(
  "there is no anchor link to the intro text {string} from the On This Page",
  (anchorLink) => {
    //get all anchor links from onThisPage and assert that none links to the intro text
    cy.get("nav.on-this-page ul li a").should(
      "not.have.attr",
      "href",
      anchorLink
    );
  }
);

And("the intro text {string} is displayed below page title", (text) => {
  
  // pageOption is followed by intro text
  cy.get("h1")
    .next()
    .as("summarySections")
    .find("p")
    .first()
    .should("be.visible")
    .and("include.text", text);
});

And("the intro text {string} is displayed above accordion", (text) => {
  //intro text assert
  cy.get(".summary-sections")
    .children()
    .first()
    .as("introTextSection")
    .find("p")
    .first()
    .as("introText")
    .should("be.visible")
    .and("include.text", text);
  //intro text is followed by invisible 'on this page'
  cy.get("@introTextSection")
    .next()
    .as("onThisPage")
    .should("have.class", "on-this-page")
    .and("not.be.visible");
  // 'on this page' is followed by accordion, therefore accordion is directly preceeded by intro text (in terms of visibility)
  cy.get("@onThisPage")
    .next()
    .should(($accordion) => {
      const className = $accordion[0].className;
      expect(className).to.include("accordion");
    });
});

Then("In This Section section does not exist", () => {
  cy.get("nav.in-this-section").should("not.exist");
});

And("the body sections do not collapse into accordion", () => {
  cy.get('div[class^=accordion] h2').should('not.exist');
});
