export function getSubTotal(products: any) {
  let sub = 0;
  products.map((item) => {
    sub += item?.price * item?.quantity;
  });
  return sub;
}

export function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min) + min); // The maximum is exclusive and the minimum is inclusive
}
export const generateCodeOrder = () => {
  const dateObj = new Date();
  const fullYear = dateObj.getFullYear().toString().replace('20', '');
  const month = dateObj.getMonth() + 1;
  const day = dateObj.getDate();
  const hour = dateObj.getHours();
  const minus = dateObj.getMinutes();
  const second = dateObj.getSeconds();
  return `OD-${getRandomInt(
    10,
    99,
  )}${hour}${minus}${second}${day}${month}${fullYear}`;
};
export const ranDomUID = () => {
  return 'OD-' + new Date().getTime();
};

export const checkISObject = (yourVariable) => {
  return typeof yourVariable === 'object' && yourVariable !== null;
};
