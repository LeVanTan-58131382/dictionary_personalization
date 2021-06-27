class UnitKnowledgeModel {

  int id;
  int idType;
  String subject;
  String content;
  String author;
  String image;
  String created_at;
  String updated_at;

  UnitKnowledgeModel({
    required this.id,
    required this.idType,
    required this.subject,
    required this.content,
    required this.author,
    required this.image,
    required this.created_at,
    required this.updated_at,
  });

  factory UnitKnowledgeModel.fromJson(Map<String, dynamic> json){
    //print("json: $json");

    return UnitKnowledgeModel(
      id : json["id"],
      idType : json["id_type"],
      subject : json["subject"],
      content : json["content"],
      author : json["author"],
      image : json["image"],
      created_at: json["created_at"],
      updated_at: json["updated_at"],
    );
  }
}