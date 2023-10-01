class Product {
  final String uid;
  final int l;

  Product({
    required this.uid,
    required this.l,
  });

  Product plus() => copyWith(l: l + 1);

  Product copyWith({
    String? uid,
    int? l,
  }) {
    return Product(
      uid: uid ?? this.uid,
      l: l ?? this.l,
    );
  }
}
