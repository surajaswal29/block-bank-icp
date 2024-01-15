import Debug "mo:base/Debug";

actor DBank {
  var myBank = "My bank name is xyz";

  var myBalance = 100000;

  let myAccountNumber = 3732737832783426;

  Debug.print(myBank);
  Debug.print(debug_show(myBalance));
  Debug.print(debug_show(myAccountNumber));
}