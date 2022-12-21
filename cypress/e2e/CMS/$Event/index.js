/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';


And('user types {string} in the {string} autosuggest', (value, fieldLabel) => {
    cy.get(`div[class*="field-event-series"] label:contains("${fieldLabel}")`).type(value);
});

let expectedText;
And('user selects {int} event series from {string} autosuggest', (position, fieldLabel) => {
    cy.get('li.ui-menu-item a').eq(position - 1).click({ force: true });
});

And('Event Start Date & Time date field is displaying todays date', () => {
    const date = new Date();
    const currYear = date.getFullYear();
    const currMonth = date.getMonth();
    const currDay = date.getDate();
    const expectedDate = `${currYear}-${currMonth + 1}-${currDay}`
    cy.get('input#edit-field-event-start-date-0-value-date').should('have.attr', 'value', expectedDate);
});

And('Event End Date & Time date field is displaying todays date', () => {
    const date = new Date();
    const currYear = date.getFullYear();
    const currMonth = date.getMonth();
    const currDay = date.getDate();
    const expectedDate = `${currYear}-${currMonth + 1}-${currDay}`
    cy.get('input#edit-field-event-end-date-0-value-date').should('have.attr', 'value', expectedDate);
});

And('user enters {string} in the {string} time field', (value, fieldLabel) => {
    cy.get('input#edit-field-event-end-date-0-value-time').type(value);
});

let imageSrc;
And('user selects {int} Lead Image from the list of images', (num) => {
    cy.get('span:contains("Lead Image")').parent().as('imageUpload').click()
    cy.get('input[name="field_image_article_entity_browser_entity_browser"]').click({ force: true })
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true })
});

let imageSrc1;
And('user selects {int} Promotional Image from the list of images', (num) => {
    cy.get('span:contains("Promotional Image")').parent().first().as('imageUpload').click()
    cy.get('input[name="field_image_promotional_entity_browser_entity_browser"]').click({ force: true })
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num - 1).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true })
});

And('user remembers the source of selected lead image for further verification', () => {
    cy.get('details img').then($el => {
        imageSrc = $el[0].getAttribute('src')
    });
});

And('the Event Series title matches selected event series', () => {
    cy.get('#cgvBody h2').then($el => {
        expectedText = $el[0].innerText.trim();
    });
});

And('the event date is displaying todays date', () => {
    const months = [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December'
    ];
    const date = new Date();
    const year = date.getFullYear();
    const month = months[date.getMonth()];
    const day = date.getDate();
    const expectedDate = `${month} ${day}, ${year}`;
    cy.get('p.event-date-time').should('include.text', expectedDate);
});

And('the event start time displays in the following format {string}', (num) => {
    cy.get('p.event-date-time').invoke('text').then((time) => {
        const startAndEnd = time.split('|');
        const startAndEndtime = startAndEnd[1].split('–');
        const regex = new RegExp(num);
        expect(startAndEndtime[0]).to.match(regex);
    });
});

And('the event end time displays {string}', (num) => {
    cy.get('p.event-date-time').should('include.text', num);
});

And('the Venue location field displays {string}', (locVenue) => {
    cy.get('span.event-location-venue').should('have.text', locVenue);
});

And('the room location field displays {string}', (roomNum) => {
    cy.get('span.event-location-room').should('have.text', roomNum);
});

And('the city-state location field displays {string}', (cityState) => {
    cy.get('span.event-location-city-state').should('have.text', cityState);
});

And('{string} is a link with href that matches {string}', (linkText, linkHref) => {
    const regex = new RegExp(linkHref);
    cy.get('div#cgvBody p').find('a').should('have.text', linkText);
    cy.get('div#cgvBody p').find('a').should('have.attr', 'href').and('match', regex);
});

And('description reads {string}', (desc) => {
    cy.get(`p:contains('${desc}')`).should('be.visible');
});

And('the lead image for event is matching earlier selected image', () => {
    cy.get('.centered-element > img').then($el => {
        const source = $el[0].getAttribute('src');
        const actSrc = source.replace(/\?itok=[\S]+/, '').replace(/^(.*?)\/public/, '')
        const expectedSrc = (imageSrc.replace(/\?itok=[\S]+/, '')).replace(/^(.*?)\/public/, '')
        expect(actSrc).to.include(expectedSrc);
    })
});

And('user checks {string} checkbox', (targetCheckbox) => {
    cy.get(`div[class*="field-all-day-event-value"] label:contains("${targetCheckbox}")`).as('checkbox');
    cy.get('@checkbox').parent().find('input').check();
});

And('event date does not display time', () => {
    cy.get('p.event-date-time', { timeout: 100 }).should('not.include.text', '|');
});

And('user removes the Lead Image', () => {
    cy.get('#edit-field-image-article-current-items-0-remove-button').click({ force: true })
});