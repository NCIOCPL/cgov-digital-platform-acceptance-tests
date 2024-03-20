
beforeEach(() => {

  // listen for console log calls
  cy.on('window:before:load', (win) => {
    cy.spy(win.console, 'log');
  })

});