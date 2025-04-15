describe("Product Details", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("Should navigate to the product detail page when a product is clicked", () => {
    cy.get(".products article").first().find("a").click();
    cy.get(".product-detail").should("be.visible");
  });
});
