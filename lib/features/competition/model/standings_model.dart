import 'package:football_score/features/team/model/team_model.dart';

class StandingModel {
  int? position;
  TeamModel? team;
  int? playedGames;
  String? form;
  int? won;
  int? draw;
  int? lost;
  int? points;
  int? goalsFor;
  int? goalsAgainst;
  int? goalDifference;

  StandingModel({
    this.position,
    this.team,
    this.playedGames,
    this.form,
    this.won,
    this.draw,
    this.lost,
    this.points,
    this.goalsFor,
    this.goalsAgainst,
    this.goalDifference,
  });

  StandingModel.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    team = json['team'] != null ? TeamModel.fromJson(json['team']) : null;
    playedGames = json['playedGames'];
    form = json['form'];
    won = json['won'];
    draw = json['draw'];
    lost = json['lost'];
    points = json['points'];
    goalsFor = json['goalsFor'];
    goalsAgainst = json['goalsAgainst'];
    goalDifference = json['goalDifference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['position'] = position;
    if (team != null) {
      data['team'] = team!.toJson();
    }
    data['playedGames'] = playedGames;
    data['form'] = form;
    data['won'] = won;
    data['draw'] = draw;
    data['lost'] = lost;
    data['points'] = points;
    data['goalsFor'] = goalsFor;
    data['goalsAgainst'] = goalsAgainst;
    data['goalDifference'] = goalDifference;
    return data;
  }
}
