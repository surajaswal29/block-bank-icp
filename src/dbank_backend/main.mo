import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  // current time
  stable var start_time : Time.Time = Time.now();
  let user_id : Text = "7c2r27383bc3rcb832873c8";
  let avail_bank : Text = "Abc bank limited";

  Debug.print(debug_show(start_time / 1000000000));

  stable var avail_balance : Float = 1000;

  // avail_balance := 20100;

  var user : Text = "Suraj Aswal";

  let avail_account = 1234567890;

  Debug.print(debug_show({
    user_id = user_id;
    user = user;
    bank = avail_bank;
    balance = avail_balance;
    account = avail_account
    }));


  public func updateUserBalance(value: Float) : async() {
    avail_balance += value;

    Debug.print(debug_show({
        message = "Amount added successfully";
        amount_added = value;
        final_balance = avail_balance;
    }));
  };

  public func withdrawUserBalance(value: Float) : async() {

    let temp_value : Float = avail_balance - value;

    if(temp_value >= 0){
      avail_balance -= value;

      Debug.print(debug_show({
          message = "Amount withdrawn successfully";
          amount_withdrawn = value;
          final_balance = avail_balance;
      }));
    }else{
      Debug.print(debug_show({
        message = "Amount too large. Available balance is lower than the entered amount"
      }))
    }

      
  };

  public query func checkBalance() : async Float{
    Debug.print(debug_show(avail_balance));
    return avail_balance;
  };


  public func calCompoundInterest(){
    let current_time = Time.now();
    let time_elapsed_NS = current_time - start_time;
    let time_elapsed_S = time_elapsed_NS / 1000000000;

    avail_balance := avail_balance * (1.01 ** Float.fromInt(time_elapsed_S));

    start_time := current_time;
  }

  // updateUserBalance();
}