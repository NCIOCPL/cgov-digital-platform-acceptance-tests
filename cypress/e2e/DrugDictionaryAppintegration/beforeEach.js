
import { InitializeAnalyticsInterceptingImage } from "../../utils/analyticsInterceptingImage";

beforeEach(() => {
  cy.CaptureDrugDictionarySearchBeacon = false;
  cy.DrugDictionarySearchStorage = [];

  // Create an image proxy to handle intercepting
  // analytics calls.

  Cypress.on('window:before:load', (win) => {
    InitializeAnalyticsInterceptingImage(win);

  });

});



