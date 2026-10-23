import { When, Then } from 'cypress-cucumber-preprocessor/steps';

const redirectStatuses = [301, 302, 303, 307, 308];

const siteUrl = (path) => new URL(path, `${Cypress.config('baseUrl')}/`).href;

// Environments may serve the same mapped page with or without a trailing slash.
const comparableUrl = (url) => {
    const parsedUrl = new URL(url);
    parsedUrl.pathname = parsedUrl.pathname.replace(/\/$/, '') || '/';
    return parsedUrl.href;
};

const requestWithoutRedirects = (url) => cy.request({
    method: 'GET',
    url,
    followRedirect: false,
    failOnStatusCode: false,
});

// Follow each Location explicitly so the final URL is checked even across hosts.
const followRedirects = (url, remainingRedirects = 10) => {
    return requestWithoutRedirects(url).then((response) => {
        if (redirectStatuses.includes(response.status)) {
            expect(remainingRedirects, `redirect limit for ${url}`).to.be.greaterThan(0);
            expect(response.headers.location, `Location header for ${url}`).to.be.a('string').and.not.be.empty;
            return followRedirects(new URL(response.headers.location, url).href, remainingRedirects - 1);
        }

        return { status: response.status, url };
    });
};

When('I request the CCG URL {string} without following redirects', (path) => {
    const requestUrl = siteUrl(path);
    requestWithoutRedirects(requestUrl)
        .then((response) => ({ ...response, requestUrl }))
        .as('ccgRedirectResponse');
});

Then('the CCG response status code is {int}', (statusCode) => {
    cy.get('@ccgRedirectResponse').its('status').should('eq', statusCode);
});

Then('the CCG redirect location is {string}', (path) => {
    return cy.get('@ccgRedirectResponse').then((response) => {
        expect(response.headers.location, 'Location header').to.be.a('string').and.not.be.empty;
        const redirectUrl = new URL(response.headers.location, response.requestUrl).href;
        const expectedUrl = comparableUrl(siteUrl(path));

        if (comparableUrl(redirectUrl) === expectedUrl) {
            return;
        }

        // Some environments add a trailing slash before applying the CCG redirect.
        const normalizedUrl = new URL(response.requestUrl);
        expect(normalizedUrl.pathname, 'source path before slash normalization').not.to.match(/\/$/);
        normalizedUrl.pathname += '/';
        expect(redirectUrl, 'optional trailing-slash redirect').to.eq(normalizedUrl.href);

        return requestWithoutRedirects(redirectUrl).then((normalizedResponse) => {
            expect(normalizedResponse.status, 'mapped redirect status code').to.eq(301);
            expect(normalizedResponse.headers.location, 'mapped Location header')
                .to.be.a('string').and.not.be.empty;
            expect(comparableUrl(new URL(normalizedResponse.headers.location, redirectUrl).href), 'mapped redirect URL')
                .to.eq(expectedUrl);
        });
    });
});

When('I follow the CCG redirects from {string}', (path) => {
    followRedirects(siteUrl(path)).as('ccgDestinationResponse');
});

Then('the CCG destination status code is {int} at {string}', (statusCode, path) => {
    return cy.get('@ccgDestinationResponse').then((response) => {
        expect(response.status, 'destination status code').to.eq(statusCode);
        expect(comparableUrl(response.url), 'final destination URL').to.eq(comparableUrl(siteUrl(path)));
    });
});
