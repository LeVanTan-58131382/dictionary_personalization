class AccountModel {

  String name;
  String email;

  AccountModel({
    required this.name,
    required this.email,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json){

    return AccountModel(
      name : json["name"],
      email : json["email"],
    );
  }
}