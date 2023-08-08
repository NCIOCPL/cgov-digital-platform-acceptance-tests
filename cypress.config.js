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
    randomStr: createRandomStr()
  },
  defaultCommandTimeout: 10000,
  e2e: {
    // We've imported your old cypress plugins here.
    // You may want to clean this up later by importing these.
    setupNodeEvents(on, config) {
      return require('./cypress/plugins/index.js')(on, config)
    },
    specPattern: 'cypress/e2e/**/*.feature',
    baseUrl: 'https://www-dev-ac.cancer.gov',
  },
})

function createRandomStr() {
  var result = '';
  var characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
  var charactersLength = characters.length;
  for (var i = 0; i < 5; i++) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
  }
  return result;
}