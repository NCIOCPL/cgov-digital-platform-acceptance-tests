# CGov Digital Platform Acceptance Tests
This repository holds all the behavioral test for testing the default content for CGDP.

The tests use [cypress-cucumber-preprocessor](https://github.com/TheBrainFamily/cypress-cucumber-preprocessor) and [cypress](https://docs.cypress.io/guides/overview/why-cypress.html#In-a-nutshell). For more information on the folder structures, etc, you should familiarize yourself with cypress.

## Creating Tests
...other steps...
Please add `/// <reference types="Cypress" />` to the top of each JS file to get Cypress intellesense. There is some issue where [the Cypress documentation](https://docs.cypress.io/guides/tooling/intelligent-code-completion.html#Reference-type-declarations-via-jsconfig) is nor working correctly. 

## Adding credentials
Please create cypress.env.json file in the root folder and add the following
{
  "user_name": "admin",
  "user_password": "" --> value can be found in the digital_platform slack channel in the topic description/ provided by request
}

## Running Tests
1. `npm ci`
1. `CYPRESS_BASE_URL=https://www-dev-ac.cancer.gov npm test`
