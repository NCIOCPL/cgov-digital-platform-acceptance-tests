module.exports = async (page, scenario, viewport, isReference, browserContext) => {
  console.log('SCENARIO > ' + scenario.label);

  // Attempt to force all images on the page to load.
  await page.evaluate(async () => {
    document.querySelectorAll('[loading="lazy"]').forEach((element) => {
      element.loading = 'eager';
    });

    document.querySelectorAll('[decoding="async"]').forEach((element) => {
      element.decoding = 'sync';
    });
  });

  await require('./clickAndHoverHelper')(page, scenario);

  // add more ready handlers here...
};
