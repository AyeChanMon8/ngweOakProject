// @dart=2.9

import 'dart:convert';

class Customer {
  int id;
  String name = "";
  String pricelist = "";
  String payment_terms = "";
  Customer({
    this.id,
    this.name,
    this.pricelist,
    this.payment_terms,
  });

  Customer copyWith({
    int id,
    String name,
    String pricelist,
    String payment_terms,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      pricelist: pricelist ?? this.pricelist,
      payment_terms: payment_terms ?? this.payment_terms,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'pricelist': pricelist,
      'payment_terms': payment_terms,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Customer(
      id: map['id'],
      name: map['name'] ??'',
      pricelist: map['pricelist'] ??'',
      payment_terms: map['payment_terms'] ??'',
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) => Customer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Customer(id: $id, name: $name, pricelist: $pricelist, payment_terms: $payment_terms)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Customer &&
      o.id == id &&
      o.name == name &&
      o.pricelist == pricelist &&
      o.payment_terms == payment_terms;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      pricelist.hashCode ^
      payment_terms.hashCode;
  }
}
  