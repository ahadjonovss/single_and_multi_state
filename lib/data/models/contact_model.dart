class ContactModel {
  String name;
  String number;
  String createdAt;

  ContactModel(
      {required this.name, required this.number, required this.createdAt});

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      name: json["name"]??"No name",
      number: json["number"]??"No number",
      createdAt: json["createdAt"]??"No date",
    );
  }

  toJson(){
    return {
      "name":name,
      "number":number,
      "createdAt":createdAt
    };
  }
}
