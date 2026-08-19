/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';

And('user selects Cancer Center Image {string} from the list of images', (name) => {
    cy.get('summary:contains("Cancer Center Image")').click();
    cy.get('input[value="Select Image"]').click({ force: true });
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-name']").type(name);
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit-cgov-image-media-browser']").click();
    cy.wait(1500)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input.form-checkbox").eq(0).click();
    cy.wait(1500)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click();
});

And('user remembers the source of selected image for further verification', () => {
    cy.get('details img').then($el => {
        Cypress.env('tempImg', $el[0].getAttribute('src').replace('.webp', ''))
    });
});

And('user removes Cancer Center Image', () => {
    cy.get('input[id^="edit-field-image-promotional-current-items-"]').click();
});

And('institution title reads {string}', (title) => {
    cy.get('li.cgdp-profile-box__title').should('include.text', title);
});
And('cancer center type is {string}', (type) => {
    cy.get('li.cgdp-profile-box__title').should('include.text', type);
})
And('head name and title reads {string} and {string}', (headName, title) => {
    cy.get(`div.cgdp-profile-box__address`).first().should('be.visible').and('include.text', headName).and('include.text', title);
});
And('the address reads {string}', (streetAddress) => {
    cy.get(`div.cgdp-profile-box__address div`).should('include.text', streetAddress);
});
And('city, state and zipcode reads {string}', (cityStateZCode) => {
    cy.get(`div.cgdp-profile-box__address div`).then($el => {
        const str = $el[0].innerText;
        expect(str).to.include(cityStateZCode)
    })
});
And('phone label is {string}', (lbl) => {
    cy.get(`div.cgdp-profile-box__address div:contains("${lbl}")`).should('be.visible');
});
And('phone number is {string}', (num) => {
    cy.get(`div.cgdp-profile-box__address div > a[href="tel:${num}"]`).should('be.visible').and('have.text', num);
});
And('secondary phone label is {string}', (lbl) => {
    cy.get(`div.cgdp-profile-box__address div:contains("${lbl}")`).should('be.visible');
});
And('secondary phone number is {string}', (num) => {
    cy.get(`div.cgdp-profile-box__address div > a[href="tel:${num}"]`).should('be.visible').and('have.text', num);
});

And('website title {string} is a link with href {string}', (websiteTitle, href) => {
    cy.get(`div.cgdp-profile-box__website > a[href="${href}"]`).should('be.visible').and('have.text', websiteTitle);
})
And('description reads {string}', (descr) => {
   cy.get(`p:contains("${descr}")`).should('be.visible')
})
And('the cancer center image matching the earlier selected image', () => {
    cy.get('.cgdp-image img').then($el => {
        const source = $el[0].getAttribute('src');
        const actSrc = source.replace(/\?itok=[\S]+/, '').replace(/^(.*?)\/public/, '')
        const expectedSrc = (Cypress.env('tempImg').replace(/\?itok=[\S]+/, '')).replace(/^(.*?)\/public/, '')
        expect(actSrc).to.include(expectedSrc);
    })
});

And('the cancer center image is {string} as {string}', (expectedSrc, imageName) => {
    cy.get('.cgdp-image img').then($el => {
        const source = $el[0].getAttribute('src');
        const actSrc = source.replace(/\?itok=[\S]+/, '').replace(/^(.*?)\/public/, '')
        expect(actSrc).to.include(expectedSrc);
        expect(actSrc).to.include(imageName);
    })
});

