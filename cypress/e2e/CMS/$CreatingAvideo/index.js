/// <reference types="Cypress" />
import { And } from 'cypress-cucumber-preprocessor/steps';

const siteSection = Cypress.env('test_site_section');
const frontEndBaseUrl = Cypress.env('front_end_base_url');
const randomStr = Cypress.env('randomStr');


And('user selects {string} option from {string} dropdown', (dropdwon, section) => {
    cy.get(`.placeholder:contains("${section}")`).parent().find(`input[value="${dropdwon}"]`).click({ force: true })
})

And('user clicks on {string} link in the {string} text area', (link, linkOption) => {
    cy.get(`div:contains("${linkOption}")`).parent().parent().find(`summary:contains("${link}")`).click({ force: true })
})

And('user clicks on {string} button item', (title) => {
    cy.get(`input[value="${title}"]`).click({ force: true })
})

And('user selects {string} from the list of media', (titleVideo) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[name='name']").type(titleVideo)
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find("input[id^='edit-submit-cgov-video-media-browser']").click()
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`td:contains(${titleVideo})`).parent().find('input').eq(0).click({ foce: true })
})

And('user clicks on {string} button to select media', (listBtn) => {
    cy.getIframeBody('iframe.entity-browser-modal-iframe').find(`input[value="${listBtn}"]`).click({ force: true })
})

And('the {string} titles video is displayed', (title) => {
    cy.get(`p:contains("${title}")`).should('be.visible')
})

Then('user selects {string} option from Operations dropdown for media with title {string}', (translateOption, title) => {
    cy.get(`td:contains('${title}')`).siblings('td').find(`ul.dropbutton >li> a:contains("${translateOption}")`).click({ force: true });
});

Given('user is navigating to the front end site with spanish path {string} site section plus {string}', (spPath, purl) => {
    cy.visit(`${frontEndBaseUrl}${spPath}${siteSection}/${purl}-${randomStr}`, { retryOnStatusCodeFailure: true });
});

And('user selects a checkbox next to the title with spanish path {string} with url {string} from the list of content', (spPath, purl) => {
    cy.get(`a[href='${spPath}${siteSection}/${purl}-${randomStr}']`).parent().parent().find('input.form-checkbox').check();
});

And('user clicks on title with url spanish path {string} site section plus {string}', (spPath, purl) => {
    cy.get(`a[href='${spPath}${siteSection}/${purl}-${randomStr}']`).click();
});
And('user clicks the {string} button {int} in the WYSIWYG editor', (toolTip, position) => {
    cy.get(`table[id*='field-article-body-value'] button[data-cke-tooltip-text*='${toolTip}']`).eq(position - 1).click()
    
});

And('user enters {string} into content title search box and clicks {string}', (nameToSearch, applyBtn) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_embedded_video_browser').find(`input[id*="edit-name"]`).type(nameToSearch);
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_embedded_video_browser').find(`input[id*="edit-submit-cgov-video-media-browser"][value=${applyBtn}]`).click({ force: true });
    cy.wait(2000)
});

And('user selects {string} option from the list of media', (titleVideo) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_embedded_video_browser').find(`input[name*="entity_browser_select"][type='checkbox']`).eq(0).check()
    
})

And('user clicks on {string} button to select video', (videoBtn) => {
    cy.getIframeBody('iframe#entity_browser_iframe_cgov_embedded_video_browser').find(`input[value="${videoBtn}"]`).click({ force: true })
})

And('{string} dropdown displays {string}', (labelText, displayOption) => {
    cy.get(`select[id*="edit-attributes-data-entity-embed-display"] option:contains("${displayOption}")`).should('have.attr', 'selected', 'selected');
});

And('{string} dropdown has the following options', (labelText, dataTable) => {
    cy.get("label[for*='edit-attributes-data-entity-embed-display']").should('have.text',labelText);
    for (const { options } of dataTable.hashes()) {
        cy.get(`select[id*="edit-attributes-data-entity-embed-display"] option:contains("${options}")`).should('exist');
    }
});

And('user selects {string} radio button under {string}', (label, fieldText) => {
    cy.get(`label[for*="edit-attributes-data-align"]:contains("${label}")`).click({ force: true });
});

And('{int} section heading reads {string}', (num, title) => {
    cy.get(`section >h2 p:contains('${title}')`).should('be.visible');
});

And('{int} video has title {string}', (num, title) => {
    cy.get('figure.cgdp-video__figure ').eq(num-1).find('span').should('contain.text', title);
});

And('{int} video has no title',(index)=>{
cy.get('figure.cgdp-video__figure ').eq(index-1).find('span').should('not.exist');
});

And('{int} video has alignment set to {string}',(index, value)=>{
cy.get('div[data-embed-button="cgov_video_button"]').eq(index-1).invoke('attr','class').then((classVal)=>{
   expect(classVal).to.include(`${value}embedded-entity cgdp-embed-video cgdp-embed-video`)
})
})

And('user selects {string} from style dropdown', (option) => {
    cy.get('select[name="field_page_style"]').select(option);
});
