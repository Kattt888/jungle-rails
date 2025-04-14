describe('Add to Cart', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('adds a product to the cart and updates the cart count', () => {
    cy.get('.nav-link').contains('My Cart').should('contain', '(0)');

    cy.get('.products article').first().within(() => {
      cy.contains('Add').click();
    });

    cy.get('.nav-link').contains('My Cart').should('contain', '(1)');
  });
});
