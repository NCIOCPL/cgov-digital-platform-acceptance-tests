/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';

And('user clicks on Image content type', () => {
    cy.get("dl.admin-list a[href='/media/add/cgov_image']").click();
});

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
    cy.get(`span:contains('Crop image')`).click({ force: true })
})

And('user sets the following crops', (dataTable) => {
    for (let { crop, cropcase, locator } of dataTable.hashes()) {
        cy.get(locator).should('contain.text',crop).click({force:true});
        cy.wait(500);
        cy.get(`div[class*="crop-preview-wrapper"][id='${cropcase}']`).trigger('mouseover',{force:true}).find('span.cropper-face').click({force: true});
        
        }
});

And('user selects {string} option from Operations dropdown for media with title {string}', (translate, title) => {
    cy.get(`td:contains('${title}')`).siblings('td').find(`ul.dropbutton >li> a:contains("${translate}")`).click({ force: true });
});

And('user selects {string} Lead Image from the list of images', (image) => {
    cy.get('summary:contains("Lead Image")').click()
    cy.get('input[name="field_image_article_entity_browser_entity_browser"]').click({ force: true })
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input#edit-name").type(image);
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input#edit-submit-cgov-image-media-browser").click();
    cy.wait(2000)
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_image_browser').find("input[type=checkbox]").eq(0).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true })
});


And('user selects {string} content item', (dropDown) => {
    cy.get(`input[value='${dropDown}']`).click({ force: true })
})

And('user clicks on {string} link in the {string} text area', (title, cartOption) => {
    cy.get(`summary[aria-expanded='false']:contains('${title}')`).click({ force: true })
})

And('user clicks on {string} button to select item', (title) => {
    cy.getIframeBody('iframe[name="entity_browser_iframe_cgov_content_browser"]').find(`input[value="${title}"]`).click({ force: true })
})

And('user clicks on {string} link in the Internal Link text area within List Items', (linkBtn) => {
    cy.get(`summary[role='button']:contains('${linkBtn}')`).click({ force: true });
})


And('user selects {int} item from the media list', (num) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find('input.form-checkbox').eq(num - 1).check();
});


And('user selects {string} as Promotional Image from the list of images', (image) => {
    cy.get('summary:contains("Promotional Image")').parent().click()
    cy.get('input[name="field_image_promotional_entity_browser_entity_browser"]').click({ force: true })
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input#edit-name").type(image);
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input#edit-submit-cgov-image-media-browser").click();
    cy.wait(2000)
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_image_browser').find("input[type=checkbox]").eq(0).check()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id='edit-submit'][value='Select image']").click({ force: true })
})

And('user selects {string} from the list of media', (image) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input#edit-name").type(image);
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("#edit-submit-cgov-media-browser").click();
    cy.getIframeBody('iframe.entity-browser-modal-iframe').click().find("input[name*='entity_browser_select'][class='form-checkbox']").check();
    });

And('user clicks on {string} button to select media', (media) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`input#edit-submit[value="${media}"]`).click({ force: true })
})

And('user selects {string} from Contents dropdown', (selectOption) => {
    cy.get(`.placeholder:contains("Contents")`).parent().find(`input[value="${selectOption}"]`).click({ force: true });
    
})

And('user selects {string} from {string} dropdown {string} section', (dropDown, option, section) => {
    cy.get(`div:contains("${section}")`).parent().parent().find(`.placeholder:contains("${option}")`).parent().find(`input[value="${dropDown}"]`).eq(0).click({ force: true })
})

Then('lead image is displayed with source {string}', (image) => {
    cy.get('.centered-element img').should('have.attr','src').then((attrSrc) => {
        expect(attrSrc).to.include(image);
    })
});

And('caption reads {string}', (caption) => {
    cy.get('.caption-container p').should('include.text',caption);
});

And('credit reads {string}', (credit) => {
    cy.get('.image-photo-credit').should('include.text',credit);
});

And('{string} button is displayed', (enlarge) => {
    cy.get('.article-image-enlarge').should('be.visible').should('have.text', enlarge);
});

Then('feature card image is displaying {string}', (image) => {
    cy.get('.feature-primary.flex-columns.row img').should('have.attr','src').then((attrSrc) => {
        expect(attrSrc).to.include(image);
    })
});

Then('item in the list has an image {string}', (image) => {
    cy.get('.image.item-image > img').should('have.attr','src').then((attrSrc) => {
        expect(attrSrc).to.include(image);
    })
});

Then('the {string} appear as override', (override) => {
     cy.get('div.multimedia-slot img').first().should('have.attr','src').then((attrSrc) => {
        expect(attrSrc).to.include(override);
     
    })
});
