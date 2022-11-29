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
    cy.get('div.cgdp-page-options').should('be.visible')
    .and('have.length',2);
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

Then('all displayed events have a future date', () => {
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


    cy.get('div.event-date-time').each(($el) => {
        const monthAndDay = ($el[0].innerText.split(','))[0];
        const eventMonth = monthAndDay.split(' ')[0];
        const eventDay = parseInt(monthAndDay.split(' ')[1]);
        const eventYear =parseInt(($el[0].innerText.split(','))[1].trim());
        // get index of month that matches event month
        const monthOffset = months.findIndex( element => element === eventMonth);
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
});