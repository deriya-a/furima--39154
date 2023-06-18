// HTML要素の取得
const inputField = document.getElementById('item-price');
const resultElement = document.getElementById('add-tax-price');

// イベントリスナーの設定
inputField.addEventListener('input', calculateTax);

// 10%の税金を計算する関数
function calculateTax() {
  // 入力された値を取得
  const inputValue = parseFloat(inputField.value);
  
  // 10%の税金を計算
  const taxAmount = inputValue * 0.1;
  
  // 結果を表示
  resultElement.textContent = taxAmount.toFixed(2);
}

