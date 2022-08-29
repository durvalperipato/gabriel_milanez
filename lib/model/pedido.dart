import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Pedido {
  int? id;
  String cliente;
  String data;
  String status;
  String valor;
  List<String> itens;
  Pedido({
    this.id,
    required this.cliente,
    required this.data,
    required this.status,
    required this.valor,
    required this.itens,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cliente': cliente,
      'data': data,
      'status': status,
      'valor': valor,
      'itens': itens,
    };
  }

  factory Pedido.fromMap(Map<String, dynamic> map) {
    return Pedido(
      id: map['id'] != null ? map['id'] as int : null,
      cliente: map['cliente'] as String,
      data: map['data'] as String,
      status: map['status'] as String,
      valor: map['valor'] as String,
      itens: List<String>.from(
        (map['itens'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Pedido.fromJson(String source) =>
      Pedido.fromMap(json.decode(source) as Map<String, dynamic>);
}
