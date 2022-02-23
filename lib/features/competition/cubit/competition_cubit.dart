// import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_score/features/competition/cubit/competition_state.dart';
import 'package:football_score/features/competition/model/competition_model.dart';
import 'package:football_score/features/competition/model/standings_model.dart';
import 'package:football_score/network/remote/dio_helper.dart';

class CompetitionCubit extends Cubit<CompetitionState> {
  CompetitionCubit() : super(CompetitionInitState());

  List<CompetitionModel> competitions = [];

  Future<void> initCompetitions() async {
    emit(CompetitionLoadingState());

    try {
      var response = await DioHelper().get(path: 'competitions');
      if (response.statusCode == 200) {
        final dataDecoded = response.data as Map<String, dynamic>;

        for (var element in (dataDecoded['competitions'] as List)) {
          var currentCompetition = CompetitionModel.fromJson(element);

          var competitionStandings =
              await getStandings(currentCompetition.id ?? 0);

          currentCompetition.standings = competitionStandings;
          competitions.add(currentCompetition);
        }
        emit(CompetitionSuccessState());
      } else {
        emit(ComptitionErrorState(error: response.data['message']));
      }
    } catch (e) {
      emit(ComptitionErrorState(error: e.toString()));
    }
  }

  Future<List<StandingModel>> getStandings(int competitionId) async {
    var standings = <StandingModel>[];
    try {
      var response =
          await DioHelper().get(path: 'competitions/$competitionId/standings');

      if (response.statusCode == 200) {
        final dataDecoded = response.data as Map<String, dynamic>;
        var standingsDecoded = dataDecoded['standings'][0]['table'] as List;
        for (var element in standingsDecoded) {
          standings.add(StandingModel.fromJson(element));
        }
      }
    } catch (e) {
      standings = [];
    }
    return standings;
  }

  void sortStandings(int? id) {
    CompetitionModel? competition = competitions.firstWhere(
      (element) => element.id == id,
      orElse: () => CompetitionModel(),
    );

    if (competition.id != null && competition.standings != null) {
      List<StandingModel>? standings = competition.standings;

      standings = standings!.reversed.toList();

      competition.standings = standings;
      emit(CompetitonStandingSortedState());
    }
  }
}
