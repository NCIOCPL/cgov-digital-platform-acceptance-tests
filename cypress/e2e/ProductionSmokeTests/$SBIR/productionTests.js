/// <reference types="Cypress"/>


/// <reference types="Cypress"/>


Then('mega menu is displayed', () => {
    cy.get('nav.nci-header-nav').should('be.visible');
});
And('main categories titles are {string}', (titles) => {
    const allTitles = titles.split(',');
    cy.document().then(document => {
        const els = document.querySelectorAll('.nci-header-nav__primary-item span');
        for (let i = 0; i < els.length; i++) {
            expect(els[i].textContent).to.eq(allTitles[i]);
        }

    });

});

And('footer is displayed', () => {
    cy.get('footer#nci-footer').should('be.visible');
    cy.get('footer#nci-footer a').each(el => {
        cy.wrap(el).should('have.attr', 'href').then(href => {
            expect(href).to.not.be.empty;
        })
    })
})

And('page options are displayed', () => {
    cy.get('.cgdp-page-options').should('be.visible')
        .and('have.length', 2);
});

And('content is displayed', () => {
    cy.get('main#main-content,div#content').should('be.visible').and('not.be.empty');
});

And('page title is {string}', (title) => {
    cy.get(`h1:contains('${title}')`).should('be.visible');
});

And('the text {string} is displayed', (str) => {
    cy.get(`p:contains("${str}")`).should('be.visible');
});

Then('all displayed events have a future date or text {string} is displayed', (noEventsText) => {
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
    const currYear = date.getFullYear();
    const currMonth = date.getMonth();
    const currDay = date.getDate();

    const eventsDateLocator = 'div.event-date-time';
    let monthAndDay;// this is used to separate Month DD from YYYY such as here: June 8, 2023

    cy.document().then((document) => {
        const events = document.querySelector(eventsDateLocator);
        if (events === null) {
            cy.get('div.views-element-container').should('include.text', noEventsText);
        } else {
            cy.get(eventsDateLocator).each(($el) => {
                const dateString = $el[0].innerText;
                if (dateString.includes('|')) { // event date example "June 13, 2023 | 11:00 AM – 3:30 PM", tackling it first to avoid wrong split of case "June 5 – June 8, 2023"
                    monthAndDay = dateString.split('|')[0].split(',')[0].trim();
                } else if (dateString.includes('–')) {//event date example "June 5 – June 8, 2023", only care when event ends hence [1]
                    monthAndDay = dateString.split('–')[1].trim().split(',')[0].trim()
                } else { // the last event date type case "June 8, 2023"
                    monthAndDay = $el[0].innerText.split(',')[0].trim();
                }

                const eventMonth = monthAndDay.split(' ')[0];
                const eventDay = parseInt(monthAndDay.split(' ')[1]);
                const eventYear = parseInt(($el[0].innerText.split(','))[1].trim());
                // get index of month that matches event month
                const monthOffset = months.findIndex(element => element === eventMonth);
                //start with verifying the year - if year is less than current fail
                if (eventYear < currYear) {
                    throw new Error("event displayed is from the past year")
                    // next check month : if the year is current and month is older than current month then fail
                } else if ((monthOffset < currMonth) && (eventYear == currYear)) {
                    throw new Error(`event displayed is from the previous month/months: ${eventMonth}`)
                    //lastly if year and month passes, check the day - if the month and year are current, fail if its older day
                } else if (((eventDay) < currDay) && (monthOffset == currMonth) && (eventYear == currYear)) {
                    throw new Error(`event displayed is from the previous day/days: ${monthAndDay}`)
                } else {
                    //if all above check passes then pass the test
                    expect(true).to.be.true
                }

            })
        }
    })
});