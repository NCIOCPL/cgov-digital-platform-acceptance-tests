export function enrichUrl(url, siteSection, randomStr) {
    var replacedTestSiteSection = url
    if (replacedTestSiteSection.includes("{TEST_SITE_SECTION}")) {
        replacedTestSiteSection = url.replace("{TEST_SITE_SECTION}", siteSection);
        replacedTestSiteSection = replacedTestSiteSection + '-' + randomStr
    }
    return replacedTestSiteSection;
}