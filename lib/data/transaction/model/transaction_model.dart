class Transaction {
  final int? id;
  final String iconUrl;
  final String name;
  final String date;
  final double nominal;

  Transaction({
    this.id,
    required this.iconUrl,
    required this.name,
    required this.date,
    required this.nominal,
  });

  // Convert a Transaction into a Map. The keys must correspond to the column names in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'iconUrl': iconUrl,
      'name': name,
      'date': date,
      'nominal': nominal,
    };
  }

  // Convert a Map into a Transaction.
  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      iconUrl: map['iconUrl'],
      name: map['name'],
      date: map['date'],
      nominal: map['nominal'],
    );
  }
}
