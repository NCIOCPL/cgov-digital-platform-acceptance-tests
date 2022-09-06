
after(() => {
    cy.visit('/admin/structure/block');
    cy.get('a[href="/admin/structure/block/manage/ncidsalert/delete?destination=/admin/structure/block"]');
    cy.get('#edit-submit').click();
    cy.visit('/admin/structure/block/block-content');
    cy.get('td>a:contains("NCIDS Alert")').then($el => {
       let id = $el[0].getAttribute('href');
        cy.get(`a[href="${id}/delete?destination=/admin/structure/block/block-content"]`).click({ force: true });
    })
    cy.get('#edit-submit').click();
});