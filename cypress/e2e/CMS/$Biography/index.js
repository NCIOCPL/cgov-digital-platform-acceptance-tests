/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';

And('user clicks on {string} to a title section', (buttonLable) => {
    cy.get('#edit-field-title-add-more').contains(buttonLable).click({ force: true })
})

let imageSrc;
And('user selects {int} Biography Image from the list of images', (number) => {
    cy.get('summary:contains("Biography Image")').click();
    cy.get('input[value="Select Image"]').click({ force: true });
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(number - 1).check();
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true });
});
And('user remembers the source of selected biography image for further verification', () => {
    cy.get('details img').then($el => {
        imageSrc = $el[0].getAttribute('src');
    })
})

And('user selects {string} checkbox', (dateDisplay) => {
    cy.get(`div#edit-field-date-display-mode label:contains("${dateDisplay}")`).parent().find('input.form-checkbox').check({ force: true })
})

And("{string} date is displaying today's date", (date) => {
    cy.get('ul.clearfix li strong').should('be.visible').and('include.text', date)

})
And('description reads {string}', (description) => {
    cy.get(`[class='resize-content'] p:contains("${description}")`).should('be.visible')

})
And('the Biography image is matching the earlier selected image', () => {
    cy.get('.profile-panel-image img').then($el => {
        const source = $el[0].getAttribute('src');
        const actSrc = source.replace(/\?itok=[\S]+/, '').replace(/^(.*?)\/public/, '')
        const expectedSrc = (imageSrc.replace(/\?itok=[\S]+/, '')).replace(/^(.*?)\/public/, '')
        expect(actSrc).to.include(expectedSrc);
    })
})
And('the individual {int} title is displayed as {string}', (num, option1) => {
    cy.get(`#nvcgSlProfilePanel div:contains("${option1}")`).eq(num).should('be.visible')
})

And('the following organizations with links are listed for this individual', (dataTable) => {
    for (const { organization, url } of dataTable.hashes()) {
        cy.get(`#nvcgSlProfilePanel a:contains('${organization}')`).should('have.attr', 'href', url)
    }
})
And('individuals office is at {string}', (address) => {
    cy.document().then(doc => {
        const addressInnerText = doc.querySelector("div[class='profile-panel-content'] p").innerText;
        expect(addressInnerText).to.be.eq(address)
        cy.get("div[class='profile-panel-content'] p").should('be.visible')
    });
})
And('contact phone number is {string}', (phone) => {
    cy.get('.profile-contact-info').should('be.visible').and('include.text', phone)
})
And('contact email is {string}', (email) => {
    cy.get(`a:contains("${email}")`).should('be.visible').and('include.text', email)
})
And('the following social media links are present', (dataTable) => {
    for (const { socialMedia, href } of dataTable.hashes()) {
        cy.get(`a[href="${href}"]`).should('be.visible')
    }
})
And('user removes the Biography Image', () => {
    cy.get('summary:contains("Biography Image")').click();
    cy.get('#edit-field-image-promotional-current-items-0-remove-button').click({ force: true })
})