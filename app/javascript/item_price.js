window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price" );
const actualProfit = document.getElementById("profit" );

priceInput.addEventListener("input", function() {
  const inputValue = priceInput.value;


   addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
   actualProfit.innerHTML = Math.floor(inputValue - Math.floor(inputValue * 0.1))
}, false)
});
