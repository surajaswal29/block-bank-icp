import {dbank_backend} from "../../declarations/dbank_backend"

let loading = false;

// loading current available balance whenever the application loads
window.addEventListener("load", async ()=>{
  const currentBalance = await dbank_backend.checkBalance();

  document.getElementById("current-balance-amount").innerText = Math.round(currentBalance * 100) / 100;
})


// addMoneyButton.addEventListener("click", async (e)=>{
//   e.preventDefault();

//   const money_to_add = Number(addMoneyInput.value)

//   await dbank_backend.updateUserBalance(money_to_add)

//   currentBalance = await dbank_backend.checkBalance();
//   alert("Money Added success")
// })

document.querySelector("form").addEventListener("submit", async (e)=>{

  e.preventDefault()

  if(document.getElementById("add-money-input").value.length !== 0 || document.getElementById("withdraw-money-input").value.length !== 0){
    
      loading = true;

      const addInput = parseFloat(document.getElementById("add-money-input").value);
      const withdrawInput = parseFloat(document.getElementById("withdraw-money-input").value);
      const button_ele = e.target.querySelector("#finalise-transaction-button");

      button_ele.setAttribute("disbaled", true)

      if(document.getElementById("add-money-input").value.length !== 0){
        document.getElementById("loader").innerText = "Adding money..."
        await dbank_backend.updateUserBalance(addInput)
      }
      
      if(document.getElementById("withdraw-money-input").value.length !== 0){
        document.getElementById("loader").innerText = "Withdrawing money..."
        await dbank_backend.withdrawUserBalance(withdrawInput)
      }

      await dbank_backend.calCompoundInterest()

      const currentBalance = await dbank_backend.checkBalance();

      loading = false
      document.getElementById("loader").innerText = ""

      button_ele.removeAttribute("disbaled")

      document.getElementById("add-money-input").value = ""
      document.getElementById("withdraw-money-input").value = ""


      document.getElementById("current-balance-amount").innerText = Math.round(currentBalance * 100) / 100;

      e.target.reset()
  }
})