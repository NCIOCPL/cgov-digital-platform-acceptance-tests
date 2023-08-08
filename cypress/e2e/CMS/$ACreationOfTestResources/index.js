
/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';

And('user clicks on Image content type', () => {
    cy.get("dl.admin-list a[href='/media/add/cgov_image']").click();
});

And('user types {string} into Caption text field', (value) => {
    cy.getIframeBody('iframe.cke_wysiwyg_frame.cke_reset').find('p').type(value);
})

And('user uploads test {string} image {string}', (imageType, fileName) => {
    cy.fixture(fileName, { encoding: null }).as('fixture')
    if (imageType === "main")
    {cy.get('input#edit-field-media-image-0-upload').selectFile('@fixture');}

    else if (imageType === "feature")
    {cy.get('input#edit-field-override-img-featured-0-upload').selectFile('@fixture');}

    else if (imageType === "thumbnail")
    {cy.get('input#edit-field-override-img-thumbnail-0-upload').selectFile('@fixture');}

    else if (imageType === "social media")
    {cy.get('input#edit-field-override-img-social-media-0-upload').selectFile('@fixture');}

    else if (imageType === "panoramic")
    {cy.get('input#edit-field-override-img-panoramic-0-upload').selectFile('@fixture');}

       
})

And('user selects {string} option from {string} dropdown', (dropdown, section) => {
    cy.get(`.placeholder:contains("${section}")`).parent().find(`input[value="${dropdown}"]`).click({ force: true })
})

And('user clicks on CROP IMAGE button', () => {
    cy.get(`summary:contains('Crop image')`).click({ force: true })
})

And('user sets the following crops', (dataTable) => {
    for (let { crop, cropcase, locator } of dataTable.hashes()) {
        cy.get(locator).should('contain.text',crop).click({force:true});
        cy.wait(500);
        cy.get(`div[class*="crop-preview-wrapper"][id='${cropcase}']`).trigger('mouseover',{force:true}).find('span.cropper-face').click({force: true});
        
        }
    })

    And('user selects {string} Promotional Image from the list of images', (name) => {
        cy.get('summary:contains("Promotional Image")').first().click()
        cy.get('input[name="field_image_promotional_entity_browser_entity_browser"]').click({ force: true })
        cy.getIframeBody('iframe.entity-browser-modal-iframe').find('input#edit-name').type(name)
        cy.getIframeBody('iframe.entity-browser-modal-iframe').find('input[id*="edit-submit-cgov-image-media-browser"]').click()
        cy.wait(1500)
        cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input.form-checkbox").eq(0).click()
        cy.wait(1500)
        cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click()
    });