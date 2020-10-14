
class CreditCard {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  CreditCard({this.cardNumber, this.expiryDate, this.cardHolderName,
    this.cvvCode, this.isCvvFocused});
}


List<CreditCard> creditCards = [
  CreditCard(
    cardNumber: "4348 7374 8374 9873",
    expiryDate: "09/22",
    cvvCode: "333",
    cardHolderName: "Huynh Cong Tien"
  ),
  CreditCard(
      cardNumber: "5500 0000 0000 0004",
      expiryDate: "09/22",
      cvvCode: "34",
      cardHolderName: "Huynh Cong Tien"
  ),
  CreditCard(
      cardNumber: "3400 0000 0000 009",
      expiryDate: "09/22",
      cvvCode: "65",
      cardHolderName: "Huynh Cong Tien"
  ),
];