
after(() => {
    cy.visit('/admin/structure/block');
    cy.get('a[href="/admin/structure/block/manage/ncids_trans_ncidsalert/delete?destination=/admin/structure/block');
    cy.get('#edit-submit').click();
    cy.visit('/admin/structure/block/block-content');
    cy.get('td>a:contains("NCIDS Alert")').then($el => {
        let id = $el[0].getAttribute('href');
        cy.get(`a[href="${id}/delete?destination=/admin/content/block`).click({ force: true });
    })
    cy.get('div.ui-dialog-buttonset.form-actions button:contains("Delete")').click();
});