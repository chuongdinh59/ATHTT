const getElement = (selector, parent = document) => {
  return parent.querySelector(selector);
};

export default getElement;
