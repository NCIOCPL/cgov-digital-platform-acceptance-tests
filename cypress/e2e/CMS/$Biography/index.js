/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';

And('user clicks on {string} to a title section', (buttonLable) => {
    cy.get('#edit-field-title-add-more').contains(buttonLable).click({ force: true })
})


And('user selects Biography Image {string} from the list of images', (name) => {
    cy.get('summary:contains("Biography Image")').click();
    cy.get('input[value="Select Image"]').click({ force: true });
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-name']").type(name);
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit-cgov-image-media-browser']").click();
    cy.wait(1500)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input.form-checkbox").eq(0).click();
    cy.wait(1500)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click();
});

And('user remembers the source of selected biography image for further verification', () => {
    cy.get('details img').then($el => {
        Cypress.env('tempImg', $el[0].getAttribute('src').replace('.webp',''));
    })
})

And('user selects {string} checkbox', (dateDisplay) => {
    cy.get(`div#edit-field-date-display-mode label:contains("${dateDisplay}")`).parent().find('input.form-checkbox').check({ force: true })
})

And("{string} date is displaying today's date", (stampLabel) => {
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
    const date = new Date()
    const year = date.getFullYear()
    const month = months[date.getMonth()]
    const day = date.getDate()
    const expectedDate = `${month} ${day}, ${year}`
    cy.get('.cgdp-document-dates li').as('dateStamp').find('strong').should('have.text', stampLabel)
    cy.get('@dateStamp').find('time').should('include.text', expectedDate)
})
And('description reads {string}', (description) => {
    cy.get(`p:contains("${description}")`).should('be.visible')

})
And('the Biography image is {string} as {string}', (expectedSrc, imageName) => {
    cy.get('.cgdp-image img').then($el => {
        const source = $el[0].getAttribute('src');
        const actSrc = source.replace(/\?itok=[\S]+/, '').replace(/^(.*?)\/public/, '')
        expect(actSrc).to.include(expectedSrc);
           expect(actSrc).to.include(imageName);
    })
})
And('the individual {int} title is displayed as {string}', (num, option1) => {
    cy.get('li[class="cgdp-profile-box__title"]').eq(num-1).should('be.visible').and('have.text', option1);
})

And('the following organizations with links are listed for this individual', (dataTable) => {
    for (const { organization, url } of dataTable.hashes()) {
        cy.get(`ul[class='cgdp-profile-box__org'] li a:contains('${organization}')`).should('have.attr', 'href', url)
    }
})
And('individuals office is at {string}', (address) => {
    cy.document().then(doc => {
        const addressInnerText = doc.querySelector("div[class='cgdp-profile-box__field usa-prose'] div:first-of-type").innerText;
        expect(addressInnerText).to.be.eq(address)
        cy.get("div.cgdp-profile-box__address").should('be.visible');
    });
})
And('contact phone number is {string}', (phone) => {
    cy.get('.cgdp-profile-box__phone').should('be.visible').and('include.text', phone)
})
And('contact email is {string}', (email) => {
    cy.get(`a:contains("${email}")`).should('be.visible').and('include.text', email)
})
And('the following social media links are present', (dataTable) => {
    for (const { socialMedia, href } of dataTable.hashes()) {
        cy.get(`a[href="${href}"]`).should('be.visible');
    }
})
And('user removes the Biography Image', () => {
    cy.get('summary:contains("Biography Image")').click();
    cy.get('#edit-field-image-promotional-current-items-0-remove-button').click({ force: true })
})