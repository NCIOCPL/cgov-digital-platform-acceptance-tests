module.exports = async (page, scenario) => {
  const hoverSelector = scenario.hoverSelectors || scenario.hoverSelector;
  const clickSelector = scenario.clickSelectors || scenario.clickSelector;
  const focusSelector = scenario.focusSelectors || scenario.focusSelector;
  const keyPressSelector = scenario.keyPressSelectors || scenario.keyPressSelector;
  const scrollToSelector = scenario.scrollToSelector;
  const postInteractionWait = scenario.postInteractionWait; // selector [str] | ms [int]
  const chainedActions = scenario.chainedActionSelectors;

  if (keyPressSelector) {
    for (const keyPressSelectorItem of [].concat(keyPressSelector)) {
      await page.waitForSelector(keyPressSelectorItem.selector);
      await page.type(keyPressSelectorItem.selector, keyPressSelectorItem.keyPress);
    }
  }

  if (hoverSelector) {
    for (const hoverSelectorIndex of [].concat(hoverSelector)) {
      await page.waitForSelector(hoverSelectorIndex);
      await page.hover(hoverSelectorIndex);
    }
  }

  if (focusSelector) {
    for (const focusSelectorIndex of [].concat(focusSelector)) {
      await page.waitForSelector(focusSelectorIndex);
      await page.focus(focusSelectorIndex);
    }
  }

  if (clickSelector) {
    for (const clickSelectorIndex of [].concat(clickSelector)) {
      await page.waitForSelector(clickSelectorIndex);
      await page.click(clickSelectorIndex);
      if (postInteractionWait) {
        await page.waitForTimeout(postInteractionWait)
      }
    }
  }

  if (postInteractionWait) {
    if (parseInt(postInteractionWait) > 0) {
      await page.waitForTimeout(postInteractionWait);
    } else {
      await page.waitForSelector(postInteractionWait);
    }
  }

  if (scrollToSelector) {
    await page.waitForSelector(scrollToSelector);
    await page.evaluate(scrollToSelector => {
      document.querySelector(scrollToSelector).scrollIntoView();
    }, scrollToSelector);
  }

  if (chainedActions) {
    for (const action of [].concat(chainedActions)) {
      if (action.action === 'click') {
        await page.waitForSelector(action.selector);
        await page.click(action.selector);
      }
      if (action.action === 'hover') {
        await page.waitForTimeout(2000)
        await page.waitForSelector(action.selector);
        await page.hover(action.selector);
      }
      if (action.action === 'focus') {
        await page.waitForSelector(action.selector);
        await page.focus(action.selector);
      }
    }
  }
};
