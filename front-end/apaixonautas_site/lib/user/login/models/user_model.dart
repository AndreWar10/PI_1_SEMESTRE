class UserModel {
  late final String? id;
  late final String name;
  late final String cpf;
  late final String password;
  late final String birth;
  late final String email;
  late final String telephone;
  late final List<int> likedPub;

  UserModel({
    this.id,
    required this.name,
    required this.cpf,
    required this.password,
    required this.birth,
    required this.email,
    required this.telephone,
    required this.likedPub,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['nome'];
    cpf = json['cpf'];
    password = json['senha'];
    birth = json['dataNascimento'];
    email = json['email'];
    telephone = json['telefone'];
    likedPub = json['publicacoesCurtidas'] ?? [];
  }

  Map<String, dynamic> toJson() {
    return {
      "nome": name,
      "cpf": cpf,
      "senha": password,
      "dataNascimento": birth,
      "email": email,
      "telefone": telephone,
      "publicacoesCurtidas": likedPub.map((id) => id).toList(),
    };
  }
}
