class TransactionTypeModel {
  const TransactionTypeModel({required this.title, required this.iconPath});

  final String title;
  final String iconPath;
}

const List<TransactionTypeModel> transactionTypes = [
  TransactionTypeModel(
    title: "Transaction via card number",
    iconPath: "assets/icons/credit-card.svg",
  ),
  TransactionTypeModel(
    title: "Transaction to the same bank",
    iconPath: "assets/icons/user.svg",
  ),
  TransactionTypeModel(
    title: "Transaction to another bank",
    iconPath: "assets/icons/bank.svg",
  ),
];
