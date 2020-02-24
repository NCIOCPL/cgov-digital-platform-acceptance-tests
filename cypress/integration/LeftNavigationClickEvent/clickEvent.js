/// <reference types="Cypress" />

import { Then } from "cypress-cucumber-preprocessor/steps";

Then('user is clicking on a menu section with href {string}', (hrefAttr) => {
    cy.Beacons = [];
    cy.document().then($document => {
        $document.addEventListener('click', (e) => { e.preventDefault(); return false; })
    })
    // Make the browser desktop viewport so left nav shows.
    // Do this BEFORE tracking analytics call since it also
    // makes a call.
    cy.viewport(1025, 600);
    // Click the left nav to trigger the event, which the above eventListener
    // will listen for.
    let locator = '#nvcgSlSectionNav a[href="' + hrefAttr + '"]';
    cy.get(locator).click();
    cy.wait(2000);   
});

Then('the common click event properties are captured', () => {
    const clickBeacon = getClickBeacon();
    cy.url().should('be.eq', clickBeacon.pageURL);
    cy.url().should('contain', clickBeacon.pageName);
    expect(clickBeacon.evar2).to.be.equal(clickBeacon.prop8);
    expect(clickBeacon.prop67).to.be.equal('D=pageName');
    expect(clickBeacon.prop4).to.be.equal('D=pev1');
    const intermidiate = clickBeacon.prop8;
    let language;
    //to dynamically compare values, prop8 event capture language as 'english' or 'spanish'
    //whereas metatag holds 'en' and 'es' 
    if (intermidiate === 'english') {
        language = 'en';
    }
    else if (intermidiate === 'spanish') {
        language = 'es';
    }
    cy.get("meta[http-equiv='content-language'").invoke('attr', 'content').should('be.equal', language)
        ;

});

Then('the following analytics variables should be captured', dataTable => {
    const rawTable = dataTable.rawTable.slice();
    const clickBeacon = getClickBeacon();
    for (let j = 0; j < rawTable.length; j++) {
        const row = rawTable[j];
        expect(clickBeacon[row[0]]).to.be.equal(row[1]);
    }
});



function getClickBeacon() {
    let clickBeacon;
    for (let i = 0; i < cy.AnalyticsStorage.length; i++) {
        const singleBeacon = cy.AnalyticsStorage[i];
        if (!(singleBeacon.linkType === undefined)) {
            if (singleBeacon.linkType.includes('lnk_o') && !singleBeacon.pev2.includes('ResizedToDesktop')) {
                clickBeacon = singleBeacon;
            }
        }
    }    
    return clickBeacon;
}




