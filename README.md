# CGov Digital Platform Acceptance Tests
This repository holds all the behavioral test for testing the default content for CGDP, creation of content in CMS and visual regression tests 

The behavioral tests use [cypress-cucumber-preprocessor](https://github.com/TheBrainFamily/cypress-cucumber-preprocessor) and [cypress](https://docs.cypress.io/guides/overview/why-cypress.html#In-a-nutshell). For more information on the folder structures, etc, you should familiarize yourself with cypress.

Visual regression tests use [backstopjs](https://github.com/garris/BackstopJS). 
Reference images live under backstop_data/reference, test scenarios under backstop_data/scenarios 

# Cypress behavioral tests
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

# Backstopjs visual regression
## Creating Tests
To add a scenario, create NameOfContentTypeOrPage.js file under backstop_data/scenarios
Test parameters:
 - label: concise description of a test page,
 - testPath: path to a page,
   Optional params
   - hoverSelector: css selector of an element to hover over
   - clickSelector: as the name suggest, css selector of an element to click on (like expanding accordion)
## Running Tests
1. `npm ci` ( if haven't run already)
2. `testBaseUrl=https://www-dev-ac.cancer.gov npm run backstop:test`, where testBaseUrl is a baseHost of an environment to test