window.addEventListener('load', () => {
  const inputField = document.getElementById('item-price')
  inputField.addEventListener("input", () => {
  
  const inputValue = inputField.value
  
  const addTaxDom = document.getElementById("add-tax-price")
  const addTaxPrice = inputValue * 0.1
  const roundedTaxPrice = Math.floor(addTaxPrice)
  addTaxDom.innerHTML = roundedTaxPrice
  

  const profitAmount = document.getElementById("profit")
  const salesProfit = inputValue - addTaxPrice
  const roundedProfit = Math.floor(salesProfit)
  profitAmount.innerHTML = roundedProfit
  
})
})

// HTML要素の取得
//const inputField = document.getElementById('item-price');

//const resultElement = document.getElementById('add-tax-price');

// イベントリスナーの設定
//inputField.addEventListener('input', calculateTax);

// 10%の税金を計算する関数
//function calculateTax() {
  // 入力された値を取得
  //const inputValue = parseFloat(inputField.value);
  
  // 10%の税金を計算
  //const taxAmount = inputValue * 0.1;
  
  // 結果を表示
  //resultElement.textContent = taxAmount.toFixed(2);
//}

