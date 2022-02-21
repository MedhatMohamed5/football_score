class TeamModel {
  int? id;
  String? name;
  String? crestUrl;

  TeamModel({this.id, this.name, this.crestUrl});

  TeamModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    crestUrl = json['crestUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['crestUrl'] = crestUrl;
    return data;
  }
}
