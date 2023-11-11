// @dart=2.9

import 'dart:convert';

class Product {
  int id;
  int customer_id;
  String name;
  Product({
    this.id,
    this.customer_id,
    this.name,
  });

  Product copyWith({
    int id,
    int customer_id,
    String name,
  }) {
    return Product(
      id: id ?? this.id,
      customer_id: customer_id ?? this.customer_id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customer_id': customer_id,
      'name': name,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Product(
      id: map['id'],
      customer_id: map['customer_id'],
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id,customer_id: $customer_id)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Product &&
        o.id == id &&
        o.customer_id == customer_id &&
        o.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^ customer_id.hashCode ^ name.hashCode;
  }
}
