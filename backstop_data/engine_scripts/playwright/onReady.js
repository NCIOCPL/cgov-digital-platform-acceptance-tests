module.exports = async (page, scenario, viewport, isReference, browserContext) => {
  console.log('SCENARIO > ' + scenario.label);

  // Attempt to scroll to the bottom of a page first to force all images on the page to load.
  await page.evaluate(async () => {
    await new Promise((resolve, reject) => {
      var totalHeight = 0;
      var distance = 200;
      var timer = setInterval(() => {
        var scrollHeight = document.body.scrollHeight;
        window.scrollBy(0, distance);
        totalHeight += distance;

        if(totalHeight >= scrollHeight){
          clearInterval(timer);
          resolve();
        }
      }, 100);
    });
  });

  await require('./clickAndHoverHelper')(page, scenario);

  // add more ready handlers here...
};
