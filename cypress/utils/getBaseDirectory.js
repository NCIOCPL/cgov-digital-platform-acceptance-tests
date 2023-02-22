export function getBaseDirectory() {
    const baseURL = Cypress.config('baseUrl');
    const baseUrlPath = baseURL.endsWith(".com") || baseURL.endsWith(".devbox") ? "" : baseURL.replace(new RegExp(".*\.gov"), "");
    return baseUrlPath;
}