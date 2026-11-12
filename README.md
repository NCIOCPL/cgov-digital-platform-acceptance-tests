# CGov Digital Platform Acceptance Tests

This repository tests CGov Digital Platform default content, public-facing behavior, analytics, application integrations, and Drupal CMS content workflows.

Behavioral tests use [Cypress](https://www.cypress.io/) with [cypress-cucumber-preprocessor](https://github.com/TheBrainFamily/cypress-cucumber-preprocessor). Visual regression tests use [BackstopJS](https://github.com/garris/BackstopJS).

See [Cypress Test Framework: Setup and Maintenance](https://github.com/NCIOCPL/cgov-digital-platform-acceptance-tests/wiki/Cypress-maintenance-documentation) for the framework structure, configuration, CI workflows, troubleshooting, and maintenance details.

## Setup

Use the Node.js version specified in [.nvmrc](.nvmrc) (currently Node.js 20), then install dependencies from the lockfile:

```sh
nvm use
npm ci
```

If you do not use nvm, select the version in `.nvmrc` with your preferred version manager. Tests run against an existing, reachable site with the content expected by the selected suite; these commands do not start the application.

## Cypress behavioral tests

### Configuration and credentials

[cypress.config.js](cypress.config.js) defaults both `baseUrl` and `front_end_base_url` to `https://www-dev-ac.cancer.gov`. Override both when targeting another environment. CMS tests use `baseUrl` for CMS navigation and `front_end_base_url` for public-site checks.

Supply `CYPRESS_admin_password` for CMS login and `CYPRESS_ocpl_password` for SSO tests. The configuration provides username defaults, but individual scenarios may specify other accounts, such as `author`. Obtain credentials through the team's approved credential-sharing process.

You can also keep test environment settings in a local `cypress.env.json`, which is ignored by Git. Do not commit credentials. CI supplies passwords through GitHub secrets named `admin_password` and `ocpl_password`.

### Running tests

Open the interactive runner:

```sh
CYPRESS_baseUrl='https://www-dev-ac.cancer.gov' \
CYPRESS_front_end_base_url='https://www-dev-ac.cancer.gov' \
npm run cypress:open
```

Add the password variables required by the selected tests. To run functional regression headlessly:

```sh
CYPRESS_baseUrl='https://www-dev-ac.cancer.gov' \
CYPRESS_front_end_base_url='https://www-dev-ac.cancer.gov' \
CYPRESS_admin_password='<password>' \
CYPRESS_ocpl_password='<sso-password>' \
npm test
```

Replace password placeholders before running locally. The passwords stored in github secrets ( https://github.com/NCIOCPL/cgov-digital-platform-acceptance-tests/settings/secrets/actions)

| Command | Test selection |
| --- | --- |
| `npm test` | Features whose filenames do not start with `$`; includes underscore-prefixed features |
| `npm run cypress:acsf` | ACSF functional selection; excludes filenames starting with `$`, `_`, or `\|` |
| `npm run cypress:cms` | All features under `cypress/e2e/CMS/` |
| `npm run cypress:smoke` | Production smoke features under `cypress/e2e/ProductionSmokeTests/` |
| `npm run cypress:run` | All features, including CMS and production smoke tests |

CMS tests create, modify, publish, and delete content; run them against a test environment intended for those changes. Production smoke hooks set production URLs. Choose a suite explicitly before running the general `cypress:run` command.

For ACSF functional tests, set both URL variables to the site's `/automation-installed` URL. For CMS tests, use the CMS and front-end root URLs without `/automation-installed`.

Run a single feature with the same environment overrides as needed:

```sh
npm run cypress:run -- --spec 'cypress/e2e/Article.feature'
```

Quote paths containing spaces or `$`. A leading `_` does not disable a feature for every command; selection depends on the script's glob in [package.json](package.json).

### Creating tests

1. Add a Gherkin `.feature` file under the appropriate folder in `cypress/e2e/`.
2. Reuse existing step definitions in `cypress/e2e/common/`. Put feature-specific steps and hooks in a matching directory, such as `Article.feature` and `Article/index.js`.
3. Import step functions from `cypress-cucumber-preprocessor/steps` and add `/// <reference types="Cypress" />` to JavaScript files for editor support.
4. Place test uploads and other fixture files under `cypress/fixtures/`.
5. Run the affected feature and the relevant suite before submitting changes.

CMS tests can depend on resources created earlier in the suite. Preserve setup and cleanup dependencies, and check for leftover content after interrupted runs. The detailed guide covers shared state, generated content suffixes, and analytics hooks.

### GitHub Actions and failure results

In the repository's **Actions** tab, select a regression workflow, choose **Run workflow**, select the branch, and enter the requested environment URLs. Separate workflows support functional, CMS, ACSF, and combined regression runs.

Production smoke tests also run daily at 12:00 UTC. Regression workflows upload screenshots on failure; the production smoke workflow currently has no screenshot-upload step. Check job logs and available artifacts when diagnosing failures. Cypress video recording is disabled.

## BackstopJS visual regression

### Creating tests

Add a scenario module under `backstop_data/scenarios/`, following an existing module's export format. Reference images live under `backstop_data/reference/`.

| Scenario property | Purpose |
| --- | --- |
| `label` | Concise description of the test page |
| `testPath` | Page path appended to the reference and test base URLs |
| `hoverSelector` | Optional element to hover over |
| `clickSelector` | Optional element to click, such as an accordion control |

See https://github.com/NCIOCPL/cgov-digital-platform-acceptance-tests/wiki/Backstopjs-visual-regression-maintenance-docs 

### Running tests

After `npm ci`, install the Playwright browsers used by BackstopJS:

```sh
npx playwright install --with-deps
```

Generate references from the intended baseline, then compare the target environment:

```sh
refBaseUrl='https://www-dev-ac.cancer.gov' npm run backstop:reference
testBaseUrl='https://www-dev-ac.cancer.gov' npm run backstop:test
```

Replace the URLs as needed to compare different environments. Reports are written under `backstop_data/html-report/`. Review differences before running `npm run backstop:approve`, which replaces references with test results. GitHub Actions also provides reference-generation and visual-regression workflows.

## Maintenance

- Keep selectors, expected content, fixtures, and analytics assertions aligned with application changes.
- When updating dependencies, commit `package.json` and `package-lock.json` together and verify installation with `npm ci`.
- Keep `.nvmrc`, suite scripts, configuration, and GitHub Actions workflows aligned.
- Run affected features and relevant suites; changes to shared steps or support code need checks across their consumers.

