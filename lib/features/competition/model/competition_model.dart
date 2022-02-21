import 'package:football_score/features/area/model/area_model.dart';
import 'package:football_score/features/competition/model/standings_model.dart';
import 'package:football_score/features/season/model/season_model.dart';

class CompetitionModel {
  int? id;
  AreaModel? area;
  String? name;
  String? code;
  String? emblemUrl;
  String? plan;
  SeasonModel? currentSeason;
  int? numberOfAvailableSeasons;
  String? lastUpdated;
  List<StandingModel>? standings;

  CompetitionModel({
    this.id,
    this.area,
    this.name,
    this.code,
    this.emblemUrl,
    this.plan,
    this.currentSeason,
    this.numberOfAvailableSeasons,
    this.lastUpdated,
    this.standings,
  });

  CompetitionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    area = json['area'] != null ? AreaModel.fromJson(json['area']) : null;
    name = json['name'];
    code = json['code'];
    emblemUrl = json['emblemUrl'];
    plan = json['plan'];
    currentSeason = json['currentSeason'] != null
        ? SeasonModel.fromJson(json['currentSeason'])
        : null;
    numberOfAvailableSeasons = json['numberOfAvailableSeasons'];
    lastUpdated = json['lastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (area != null) {
      data['area'] = area!.toJson();
    }
    data['name'] = name;
    data['code'] = code;
    data['emblemUrl'] = emblemUrl;
    data['plan'] = plan;
    if (currentSeason != null) {
      data['currentSeason'] = currentSeason!.toJson();
    }
    data['numberOfAvailableSeasons'] = numberOfAvailableSeasons;
    data['lastUpdated'] = lastUpdated;
    if (standings != null) data['standings'] = standings;
    return data;
  }
}
