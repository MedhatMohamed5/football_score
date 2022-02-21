class SeasonModel {
  int? id;
  String? startDate;
  String? endDate;
  int? currentMatchday;
  // Null? winner;

  SeasonModel({
    this.id,
    this.startDate,
    this.endDate,
    this.currentMatchday,
    // this.winner,
  });

  SeasonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    currentMatchday = json['currentMatchday'];
    // winner = json['winner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['currentMatchday'] = currentMatchday;
    // data['winner'] = this.winner;
    return data;
  }
}
