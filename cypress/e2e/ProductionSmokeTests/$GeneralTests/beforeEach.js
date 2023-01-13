
import { InitializeAnalyticsInterceptingImage } from "../../../utils/analyticsInterceptingImage";

beforeEach(() => {
  
  Cypress.config('baseUrl', 'https://www.cancer.gov');
  
  // Create an image proxy to handle intercepting
  // analytics calls.

  cy.on('window:before:load', (win) => {
    InitializeAnalyticsInterceptingImage(win);
  })

});





