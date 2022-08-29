import 'dart:convert';

class Cliente {
  String nomeEmpresarial;
  String cnpj;
  String cidade;
  String uf;
  String? nomeFantasia;
  String? telefoneContato;
  String? nomeRepresentante;

  Cliente({
    required this.nomeEmpresarial,
    required this.cnpj,
    required this.cidade,
    required this.uf,
    this.nomeFantasia,
    this.telefoneContato,
    this.nomeRepresentante,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome_empresarial': nomeEmpresarial,
      'cnpj': cnpj,
      'nome_fantasia': nomeFantasia,
      'cidade': cidade,
      'uf': uf,
      'telefone_contato': telefoneContato,
      'nome_representante': nomeRepresentante,
    };
  }

  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      nomeEmpresarial: map['nome_empresarial'] as String,
      cnpj: map['cnpj'] as String,
      nomeFantasia: map['nome_fantasia'] != null ? map['nome_fantasia'] as String : null,
      cidade: map['cidade'] as String,
      uf: map['uf'] as String,
      telefoneContato: map['telefone_contato'] != null ? map['telefone_contato'] as String : null,
      nomeRepresentante:
          map['nome_representante'] != null ? map['nome_representante'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cliente.fromJson(String source) =>
      Cliente.fromMap(json.decode(source) as Map<String, dynamic>);
}
