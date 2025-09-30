const { defineConfig } = require('cypress')

module.exports = defineConfig({
  video: false,
  viewportWidth: 1025,
  viewportHeight: 600,
  retries: {
    runMode: 1,
    openMode: 0,
  },
  chromeWebSecurity: true,
  env: {
    trackingServer: ['2o7.net', 'metrics.cancer.gov'],
    admin_username: 'admin',
    admin_password: '',
    test_site_section: '/about-cancer/understanding',
    front_end_base_url: 'https://www-dev-ac.cancer.gov',
    ocpl_username: 'ocpl-test',
    ocpl_password: '',
    randomStr: createRandomStr(),
  },
  defaultCommandTimeout: 10000,
  e2e: {
    specPattern: 'cypress/e2e/**/*.feature',
    baseUrl: 'https://www-dev-ac.cancer.gov',

    // Pre-Cypress setup.
    setupNodeEvents(on, config) {
      // Remove any trailing slashes or spaces from base URL.
      // This runs before Cypress starts, but after overrides are applied.
      config.baseUrl = config.baseUrl.trim().replace(/\/+$/, '');

      // If a front end base URL is set, remove trailing slashes and spaces.
      // The Cypress object isn't available yet, so we use Node's process.env.
      const front_end_base_url = process.env.CYPRESS_front_end_base_url;
      if (front_end_base_url) {
        process.env.CYPRESS_front_end_base_url = front_end_base_url.trim().replace(/\/+$/, '');
      }

      // Delegate further configuration to plugin initialization.
      return require('./cypress/plugins/index.js')(on, config);
    },
  },
});

function createRandomStr() {
  var result = '';
  var characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
  var charactersLength = characters.length;
  for (var i = 0; i < 5; i++) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
  }
  return result;
}