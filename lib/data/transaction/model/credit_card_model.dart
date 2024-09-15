class CreditCardModel {
  final int? id; // ID for SQLite
  final String cardNumber;
  final String owner;
  final String expiry;
  final bool isPrimary;

  CreditCardModel({
    this.id,
    required this.cardNumber,
    required this.owner,
    required this.expiry,
    this.isPrimary = false,
  });

  // Convert a CreditCardModel into a Map. The keys must correspond to the column names in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cardNumber': cardNumber,
      'owner': owner,
      'expiry': expiry,
      'isPrimary': isPrimary ? 1 : 0,
    };
  }

  // Convert a Map into a CreditCardModel.
  factory CreditCardModel.fromMap(Map<String, dynamic> map) {
    return CreditCardModel(
      id: map['id'],
      cardNumber: map['cardNumber'],
      owner: map['owner'],
      expiry: map['expiry'],
      isPrimary: map['isPrimary'] == 1,
    );
  }
}
