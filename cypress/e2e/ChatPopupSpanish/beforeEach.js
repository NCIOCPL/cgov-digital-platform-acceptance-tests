
import { InitializeAnalyticsInterceptingImage } from "../../utils/analyticsInterceptingImage";

beforeEach(() => {

  // Create an image proxy to handle intercepting
  // analytics calls.

  cy.on('window:before:load', (win) => {
    InitializeAnalyticsInterceptingImage(win);
  })

});





