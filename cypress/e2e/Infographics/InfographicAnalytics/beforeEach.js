
import { InitializeAnalyticsInterceptingImage } from "../../../utils/analyticsInterceptingImage";

beforeEach(() => {

  // Create an image proxy to handle intercepting
  // analytics calls.

  Cypress.on('window:before:load', (win) => {
    InitializeAnalyticsInterceptingImage(win);
  });
});
