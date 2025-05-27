/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';


let imageSrc;
And('user selects {int} Cancer Center Image from the list of images', (num) => {
    cy.get('summary:contains("Cancer Center Image")').click();
    cy.get('input[id^="edit-field-image-promotional"][value="Select Image"]').click({ force: true });
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-entity-browser-select-media']").eq(num -1).check();
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true });
});
And('user remembers the source of selected image for further verification', () => {
    cy.get('details img').then($el => {
        imageSrc = $el[0].getAttribute('src').replace('.webp','');
    });
});

And('user removes Cancer Center Image', () => {
    cy.get('input[id^="edit-field-image-promotional-current-items-"]').click();
});

And('institution title reads {string}', (title) => {
    cy.get('div.profile-title').should('include.text', title);
});
And('cancer center type is {string}', (type) => {
    cy.get('div.profile-title').should('include.text', type);
})
And('head name and title reads {string} and {string}', (headName, title) => {
    cy.get(`.profile-panel-content p`).first().should('be.visible').and('include.text',headName).and('include.text',title);
});
And('the address reads {string}', (streetAddress) => {
    cy.get(`p.address`).should('include.text', streetAddress);
});
And('city, state and zipcode reads {string}', (cityStateZCode) => {
    cy.get(`p.address`).then($el=>{
        const str = $el[0].innerText;
        expect(str).to.include(cityStateZCode)
    })
});
And('phone label is {string}', (lbl) => {
    cy.get(`.profile-panel-content > p:contains("${lbl}")`).should('be.visible');
});
And('phone number is {string}', (num) => {
    cy.get(`.profile-panel-content a[href="tel:${num}"]`).should('be.visible').and('have.text',num);
});
And('secondary phone label is {string}', (lbl) => {
    cy.get(`.profile-panel-content > p:contains("${lbl}")`).should('be.visible');
});
And('secondary phone number is {string}', (num) => {
    cy.get(`.profile-panel-content a[href="tel:${num}"]`).should('be.visible').and('have.text',num);
});

And('website title {string} is a link with href {string}', (websiteTitle, href) => {
    cy.get(`.profile-panel-content a[href="${href}"]`).should('be.visible').and('have.text',websiteTitle);
})
And('description reads {string}', (descr) => {
cy.get('div#cgvBody p').should('have.text',descr);
})
And('the cancer center image matching the earlier selected image', () => {
cy.get('.profile-panel-image img').then($el=>{
const source = $el[0].getAttribute('src');
const actSrc = source.replace(/\?itok=[\S]+/,'').replace(/^(.*?)\/public/,'')
const expectedSrc = (imageSrc.replace(/\?itok=[\S]+/,'')).replace(/^(.*?)\/public/,'')
expect(actSrc).to.include(expectedSrc);
})
});
