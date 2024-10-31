/// <reference types="Cypress" />
import { When } from "cypress-cucumber-preprocessor/steps";
import { getBaseDirectory } from '../../../utils';
When('the following imageless cards are displayed', (dataTable) => {
    for (let { cardIndex, componentVariant, cardType, linkHref, title, description } of dataTable.hashes()) {
        cy.get(`[class='cgdp-imageless-card-group cgdp-imageless-card-group--${componentVariant}']`)
            .find('.nci-card').eq(cardIndex).as('card')

        cy.get('@card').find('a').should('have.attr', 'data-eddl-landing-item-link-type', cardType);

        cy.get('@card').find('a').invoke('attr', 'href').then(href => {
            if (href.startsWith('http')) {
                expect(href).to.eq(linkHref)
            } else {
                expect(href).to.eq(`${getBaseDirectory()}${linkHref}`)
            }
        })
        cy.get('@card').find('.nci-card__body').find('.nci-card__title').should('have.text', title)
        if (description !== 'none')
            cy.get('@card').find('.nci-card__body').find('.nci-card__description').should('have.text', description)
        else
            cy.get('@card').find('.nci-card__body').find('.nci-card__description').should('not.exist')
    }
})

When('user clicks on {int} link on a {int} NCIDS imageless card row', (linkIndex, cardRowIndex) => {
    cy.get(`[class*='cgdp-imageless-card-group cgdp-imageless-card-group']`).eq(cardRowIndex - 1).find('.nci-card__title')
    .eq(linkIndex - 1).trigger('click')
})