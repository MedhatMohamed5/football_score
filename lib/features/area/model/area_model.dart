class AreaModel {
  int? id;
  String? name;
  String? countryCode;
  String? ensignUrl;

  AreaModel({this.id, this.name, this.countryCode, this.ensignUrl});

  AreaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryCode = json['countryCode'];
    ensignUrl = json['ensignUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['countryCode'] = countryCode;
    data['ensignUrl'] = ensignUrl;
    return data;
  }
}
