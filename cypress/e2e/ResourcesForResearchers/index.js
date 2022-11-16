
/// <reference types="Cypress" />
import { Given, Then, And, When } from "cypress-cucumber-preprocessor/steps";

let toolCount;
let resultTitle;

And('introductory text {string} appears', (introtext) => {
  cy.get('.r4r-DEFAULT.home__desc > p').should('contain.text', introtext);
});

And('{string} text is a link with href {string}', (linktext, linkurl) => {
  cy.get('.r4r-DEFAULT.r4r__link--about').should('contain.text', linktext).should('have.attr', 'href', linkurl);
});

And('{string} section is displayed with correct icon', (title) => {

  cy.get('.home-tile__text').contains(title).parent().as('titleText').should('be.visible');
  cy.get('@titleText').parent().find('.home-tile__icon svg').should('be.visible');
});

And('search field is displayed with placeholder text {string}', (placeholder) => {
  cy.get('.searchbar__container input').should('have.attr', 'placeholder', placeholder);
});

And('section titled {string} is displayed', (title) => {
  cy.get(".r4r-DEFAULT.home-nav__section").contains(title).should("be.visible");
});

And("general browsing section titled {string} is displayed", (title) => {
  cy.get(".home-tile__text").contains(title).parent().should("be.visible");
});

And('text {string} is displayed', (browseText) => {
  const regex = new RegExp(browseText);
  cy.get('.home-nav.r4r-DEFAULT p').invoke('text').should('match', regex);

});

And('{string} is a link', (viewAll) => {
  const regex = new RegExp(viewAll);
  cy.get('.r4r-DEFAULT.view-all__link').invoke('text').should('match', regex);

});

And("{string} section displays the following categories",
  (section, dataTable) => {
    const label = `Browse by ${section}`;
    cy.document().then((document) => {
      const allAnchorTags = document.querySelectorAll(
        `[aria-label="${label}"]>div>a`
      );
      //verify that there are expected number of resources in the section
      expect(allAnchorTags.length).to.eq(dataTable.rows().length);
      let index = 0;
      for (const tools of dataTable.rows()) {
        //for each resource verify it's title
        cy.get(`.browse-tiles__container.r4r-DEFAULT a:contains("${tools}")`).should('be.visible').invoke('text').then((txt) => {
          txt = txt.split('(')[1].replace(')', '');
          expect(txt).to.match(/\d+/);
        })
        index++;
      }
    });
  }
);

Then('the page options should appear at the bottom of the page', () => {
  cy.get('.r4r-page-options-container').should('be.visible');
});

And("the following page options are displayed", (dataTable) => {
  for (const { pageOption } of dataTable.hashes()) {
    cy.get(`#PageOptionsControl1 li a[title="${pageOption}"]`).should("be.visible");
  }
});

And("user clicks on {string} link", (viewAll) => {
  cy.get(".r4r-DEFAULT.view-all__link")
    .as("viewAllLink")
    .invoke("text")
    .should("match", new RegExp(viewAll));
  cy.get("@viewAllLink").click();
});

And("user is redirected to {string} with {string}", (redirectedPath, urlSearch) => {
  cy.location('pathname').should('eq', redirectedPath);
  cy.location('search').should('include', urlSearch);
});

And("{string} link has a href {string}", (linkText, linkHref) => {
  cy.get('header > a').contains(linkText).should('have.attr', 'href').and('eq', linkHref);
});

And("search box is empty", () => {
  cy.get(".searchbar__container input").should("have.attr", "value", "");
});

And('results info text is {string}', (resultsInfo) => {
  const regex = new RegExp(resultsInfo);
  cy.get('[aria-label="Results count"] p').invoke('text').should('match', regex);
});

And('both pagers are displayed', () => {
  cy.get(".r4r-results.r4r-DEFAULT>nav")
    .should("have.length", 2)
    .each(($el) => {
      expect($el).to.be.visible;
    });

});

And('no pager is displayed', () => {
  cy.get(".r4r-results.r4r-DEFAULT>nav >.r4r-pager__nav.r4r-DEFAULT").should('not.exist');

});

And('the results are displayed with each title containing a link', () => {
  cy.get('section[aria-label="search results"]')
    .as("searchresults")
    .should("be.visible");
  cy.get("@searchresults")
    .find("article a")
    .each(($el) => {
      cy.wrap($el).invoke("text").should("not.be.empty");
      cy.wrap($el).should("have.attr", "href");
    });
});

And('each result has a description text under the title', () => {
  cy.get('section[aria-label="search results"] > article>p').each(($el) => {
    expect($el[0].textContent).to.not.be.empty;
  });
});

When('user clicks on {string}', (tool) => {
  cy.get(".home-nav__main >div >div>a").contains(tool).as('toolLink').then(($el) => {
    toolCount = ($el[0].innerText).split('(')[1].replace(')', '');
  });
  cy.get(".home-nav__main >div >div>a").contains(tool).click();
});

And('the filter displays the {string}', (filter) => {
  cy.get('[aria-label="Selected Search Filters"] [tabindex] p').should('contain.text', filter);
});

And('the {string} box displays the filter {string}', (section, tool) => {
  const regex = new RegExp(tool);
  cy.get('div[class*="box--tool-types"]')
    .as("toolType")
    .find("h4")
    .should("be.visible")
    .and("contain.text", section);
  cy.get("@toolType").find("span").invoke("text").should("match", regex);

});

And('the {string} box is displayed for {string}', (section, eligibleToolType) => {
  if (eligibleToolType === "Y") {
    cy.get("h4").contains(section).should("be.visible");
  } else {
    cy.get("h4").contains(section).should("not.exist");
  }
});

And('the {string} box is displayed', (section) => {
  cy.get('.r4r-DEFAULT.results__facets >div').find('h4').should('contain.text', section);

});

When('user types {string} in the search bar', (searchText) => {
  cy.get('.searchbar__container input').type(searchText);
});

When('user clicks on the magnifying glass icon', () => {
  cy.get('.searchbar__container button').click();
});

And("search box displays the term {string}", (searchText) => {
  cy.get('.searchbar__container input').should('have.attr', 'value', searchText);
});

When('user hits {string} key', (enterKey) => {
  cy.get('.searchbar__container input').type('{enter}{enter}');
});

When('user clicks on {string} button', (button) => {
  cy.get('.r4r-DEFAULT.results__search-container > .r4r-DEFAULT.results__filter-button').click();
});

And('the search result is displayed', () => {
  cy.get('[aria-label="search results"]').should('be.visible');
});

And('the search result title is {string} with href {string}', (title, href) => {
  const baseURL = Cypress.config('baseUrl');
  if (baseURL.includes('ncigovcdode')) {
    cy.get('[aria-label="search results"] > article>h2').first().should('be.visible').find('a').then($link => {
      const linkHref = $link[0].getAttribute('href');
      expect(linkHref.replace('Exit Notification', '')).to.eq(href)
    })
  } else {
    cy.get('[aria-label="search results"] > article>h2').first().should('be.visible').find('a').should('have.attr', 'href', href).should('have.text', title);
  }
});

And('the search result description is displayed', () => {
  cy.get('[aria-label="search results"] > article>p').first().should('be.visible');
});

And('the message is displayed as {string}', (message) => {
  cy.get('.results__noresults').should('contain.text', message);
});

And("{string} is a link with href {string}", (linkText, linkHref) => {
  cy.get('.results__noresults > a').contains(linkText).should('have.attr', 'href').and('eq', linkHref);
});

Then('the resource title is displayed as {string}', (resourceTitle) => {
  cy.get('.r4r-resource__header h1').should('contain.text', resourceTitle);
});

And("{string} is displayed with href {string}", (linkText, linkHref) => {
  cy.get('.r4r-DEFAULT.resource__home > a').contains(linkText).should('have.attr', 'href').and('eq', linkHref);
});

And('Visit Resource link is displayed', () => {
  cy.get('.resource__link--external').should('be.visible');
});

And('search box is displayed', () => {
  cy.get('.searchbar__container input').should('be.visible');
});

And('{string} section is displayed', (section) => {
  cy.get('.resource__nav h2').contains(section).should('be.visible');
});

And('{string} field is displayed', (fieldName) => {
  cy.get(`article[aria-label="${fieldName}"]`).should('be.visible');
});

And("Contact Information field is {string}", (visibility) => {
  if (visibility.toLowerCase() === 'visible')
    cy.get('h2').contains('Contact Information').should('be.visible');
  else
    cy.get('h2').contains('Contact Information').should('not.exist');

});

And('the Resource not found message is displayed as {string} and {string}', (message1, message2) => {
  cy.document().then(doc => {

    const msg = doc.querySelectorAll(`.r4r-DEFAULT.r4r-error > p`);
    expect(msg[0].innerText).to.eq(message1);
    expect(msg[1].innerText).to.eq(message2);

  })
});

And("the {string} is displayed with href {string}", (linkText, linkHref) => {
  cy.get('.r4r-container.row a').contains(linkText).should('have.attr', 'href').and('eq', linkHref);
});

And('the {string} box displays the filter {string} as checked', (section, area) => {
  cy.get('div[class="facet__box  r4r-DEFAULT"]>h4').contains(section).parent().find(`label > input[value="${area}"]`).should('be.checked');
});

When("user clicks on {int} search result item", (resIndex) => {
  cy.get(".r4r-DEFAULT.results-container >article> h2 > a").eq(resIndex - 1).as('resultItem').then(($el) => {
    resultTitle = $el[0].innerText;
  })
  cy.get("@resultItem").eq(resIndex - 1).click();
});

Then("the {string} is displayed", (backToSearch) => {
  cy.get(".r4r-DEFAULT.resource__back").contains(backToSearch).should("be.visible");
});

And('Visit Resource link is displayed with exit disclaimer icon', () => {
  cy.get('.resource__link--external').should('be.visible');
  cy.get('a[title="Exit Disclaimer"]').should('be.visible');
});

And('Result Count text contains the same number as present in the {string} link', (tools) => {
  cy.get('div[aria-label="Results count"] p').then(($el) => {
    const totalRes = ($el[0].innerText).split('of ')[1].replace(' results', '');
    expect(totalRes).to.eq(toolCount)
  });
});

Then("the page title is the same as the clicked result's item title", () => {
  cy.get(`h1:contains("${resultTitle}")`).should('be.visible');
});