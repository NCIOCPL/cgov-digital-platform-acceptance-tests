/// <reference types="Cypress" />
import { When } from 'cypress-cucumber-preprocessor/steps';

When('user clicks on NCIDS feature card at position {int}', (cardIndex) => {
    cy.get('div.nci-card').eq(cardIndex - 1).find('a').trigger('click', { followRedirect: false })
})

When('user clicks on glossified link with id {string} in intro text', (glossId)=>{
    cy.get('div.cgdp-field-intro-text').find(`a[data-gloss-id='${glossId}']`).trigger('click')
})

When('user clicks on glossified link with id {string} in the body', (glossId)=>{
    cy.get('div.cgdp-article-body').find(`a[data-gloss-id='${glossId}']`).trigger('click')
})

When('popup loads',()=>{
    cy.get('button.cgdp_audiofile').should('be.visible')
})

When('user clicks on {int} video',(position)=>{
    cy.get('div.cgdp-video .video-preview__play-button').eq(position-1).trigger('click')
})

