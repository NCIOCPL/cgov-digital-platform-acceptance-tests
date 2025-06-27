module.exports = async (page, scenario, viewport, isReference, browserContext) => {
  console.log('SCENARIO > ' + scenario.label);


  // Attempt to scroll to the bottom of a page first to force all images on the page to load.
  await page.evaluate(async () => {
    localStorage.setItem('USNIHNCI_38_subscribe_overlay', 1);
    await new Promise((resolve, reject) => {
      var totalHeight = 0;
      var distance = 200;
      var timer = setInterval(() => {
        var scrollHeight = document.body.scrollHeight;
        window.scrollBy(0, distance);
        totalHeight += distance;

        if (totalHeight >= scrollHeight) {
          clearInterval(timer);
          resolve();
        }
      }, 100);
    });
  });

  if (!scenario.enableBackToTop) {
    await page.evaluate(async () => {
      const selector = document.querySelector('div[class*="usa-footer__nci-return-to-top"]');
      selector.setAttribute('hidden', 'hidden');
    })
  }
  if (scenario.postInteractionWait) {
    await page.waitForTimeout(scenario.postInteractionWait)
  }
  await require('./clickAndHoverHelper')(page, scenario);
  // add more ready handlers here...
  if (scenario.pause === true) {
    await page.waitForTimeout(2500)
  }
};
