export function getSubTotal(products: any) {
  let sub = 0;
  products.map((item) => {
    sub += item?.price * item?.quantity;
  });
  return sub;
}
