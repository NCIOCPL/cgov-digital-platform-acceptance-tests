# CGov Digital Platform Acceptance Tests
This repository holds all the behavioral test for testing the default content for CGDP.

The tests use [cypress-cucumber-preprocessor](https://github.com/TheBrainFamily/cypress-cucumber-preprocessor) and [cypress](https://docs.cypress.io/guides/overview/why-cypress.html#In-a-nutshell). For more information on the folder structures, etc, you should familiarize yourself with cypress.

## Creating Tests
...other steps...
Please add `/// <reference types="Cypress" />` to the top of each JS file to get Cypress intellesense. There is some issue where [the Cypress documentation](https://docs.cypress.io/guides/tooling/intelligent-code-completion.html#Reference-type-declarations-via-jsconfig) is nor working correctly. 

## Adding credentials
`admin_username` is already provided
The `admin_password` value needs to be added via command line 
to open cypress UI console
`CYPRESS_admin_password='value' npx cypress open`
to run in a headless mode
`CYPRESS_admin_password='value' npx cypress run`
where value is the password ( can be found in digital-platform slack channel topic )
## Running Tests
1. `npm ci`
2. `CYPRESS_BASE_URL='https://www-dev-ac.cancer.gov' CYPRESS_admin_password='value' npx cypress run`
where value is the password ( can be found in digital-platform slack channel topic )
