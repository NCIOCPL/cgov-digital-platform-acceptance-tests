/// <reference types="Cypress" />
import { Then } from "cypress-cucumber-preprocessor/steps";
import { getClickBeacon } from "../../utils/getClickBeacon.js"
import { getLoadBeacon } from "../../utils/getLoadBeacon.js"

let loadOrClick;
const baseURL = Cypress.config('baseUrl');
const hostName = baseURL.replace(new RegExp('(https:\/\/)|(http:\/\/)'), "")

//date, months and weekDays are used to generate date and time value for prop29
const systemDate = new Date();
const dateStr = systemDate.toLocaleString('en-US', {
    timeZone: 'America/New_York'
})
const date = new Date(dateStr);

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

const weekDays = [
    'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday',
]

Then('the following parameters should be captured', dataTable => {
    let beacon = getBeacon();
    let mapOfEvents = new Map();

    if (beacon?.events) {
        const allEvents = beacon?.events.split(',');
        allEvents.forEach(eventValue => {
            if (eventValue.includes('=')) {
                const splitted = eventValue.split('=');
                mapOfEvents.set(splitted[0].toString(), splitted[1]);
            } else {
                mapOfEvents.set(eventValue.toString(), '');
            }
        });
    }

    // assertions for each entry parameter provided
    if (beacon) {
        for (const { parameter, value } of dataTable.hashes()) {
            if (value.length > 1 && value.startsWith('/') && value.endsWith('/') && !parameter.includes('event')) {
                const regex = new RegExp(value.substring(1, value.length - 1));
                expect(beacon[parameter]).to.match(regex);

            } else if (value.includes('{CANONICAL_HOST}')) {
                let madeUpValue;
                madeUpValue = value.replace('{CANONICAL_HOST}', hostName);
                cy.location('protocol').then(protocol => {
                    madeUpValue = madeUpValue.replace('{PROTOCOL}:', protocol);
                    if (parameter === 'prop1' && beacon['prop2']) {
                        expect(`${beacon[parameter]}${beacon['prop2']}`).to.be.equal(madeUpValue);
                    } else {
                        expect(beacon[parameter]).to.eq(madeUpValue);
                    }
                });
            } else if (parameter.includes('event')) {
                if (value.startsWith("/")) {
                    const regex = new RegExp(value.substring(1, value.length - 1))
                    expect(mapOfEvents.get(parameter)).to.match(regex);
                } else
                    expect(mapOfEvents.get(parameter)).to.be.eq(value);

            } else if (parameter === 'prop29') {
                const year = date.getFullYear();
                const month = months[date.getMonth()];
                const day = date.getDate();
                const weekDay = weekDays[date.getDay()];
                const hours24 = date.getHours();
                let dayMode = hours24 < 12 ? 'AM' : 'PM';
                const hours12 = hours24 <= 12 ? (hours24 === 0 ? 12 : hours24) : hours24 - 12;
                const minutes = (date.getMinutes() < 10) ? `0${date.getMinutes()}` : date.getMinutes();
                // in case test will be run right when the clock turns extra minute,
                //so that beacon will record a value of 16 mins, but date executes before the beacon,
                //it will be 15 minutes
                //we will account for that minute by adding one to currently captured time
                let extraMin = (typeof minutes === 'string' && minutes !== '09') ? `0${parseInt(minutes) + 1}` :
                    (minutes === '09') ? '10' :
                        minutes + 1;
                //so we need to add an option when the time might be 02:00 vs 01:59
                //plus the case when it's 11:59 AM turning into 12:00 PM
                let extraHour = hours12;
                if (extraMin === 60) {
                    extraHour += 1;
                    extraMin = '00';
                    if (extraHour === 12) {
                        dayMode = dayMode === 'AM' ? 'PM' : 'AM';
                    }
                }
                const finalString = new RegExp(`(year=${year} \| month=${month} \| date=${day} \| day=${weekDay} \| time=)(${hours12}|${extraHour}):([0-9]|[0-5][0-9]) ${dayMode}`);
                expect(beacon[parameter]).to.match(finalString);
            } else if (value.includes('{or}')) {
                const options = value.split('{or}');
                const check = beacon[parameter] === options[0] || beacon[parameter] === options[1];
                expect(check).to.be.true;
            } else if (value.startsWith('/') && !value.endsWith('/')) {
                expect(beacon[parameter]).to.include(value);
            } else if (value === '/') {
                expect(beacon[parameter]).to.include(value);
            } else
                expect(beacon[parameter]).to.be.equal(value);
        }
    }
});

Then('page click request is sent', () => {
    loadOrClick = getClickBeacon(cy.AnalyticsStorage);
});

When('page load request is sent', () => {
    loadOrClick = getLoadBeacon();
});


function getBeacon() {
    return loadOrClick;
}


Then('user is navigating to {string} with added wait', (url) => {
    cy.visit(url);
    cy.wait(2000)
});


And('analytics storage is cleared', () => {
    cy.AnalyticsStorage = [];
});

Then('page click request is sent right before page unload', () => {
    loadOrClick = getClickBeacon(cy.AnalyticsStorageBeforeUnload);
});


Then('page click request is sent for cts chat', () => {
    const storage =  cy.AnalyticsStorage
    let clickBeacon;
    for (let i = 0; i < storage.length; i++) {
        const singleBeacon =  storage[i];
        console.log(singleBeacon)
        if (!(singleBeacon.linkType === undefined)) {
            if (singleBeacon.linkType.includes('lnk_o') && !singleBeacon.pev2.includes('Resized')) {
                if (singleBeacon.pev2 === 'Legacy:ProactiveChat')
                    clickBeacon = singleBeacon;
            }
        }
    }
    loadOrClick = clickBeacon
});

