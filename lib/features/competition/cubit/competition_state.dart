abstract class CompetitionState {}

class CompetitionInitState extends CompetitionState {}

class CompetitionLoadingState extends CompetitionState {}

class CompetitionSuccessState extends CompetitionState {}

class ComptitionErrorState extends CompetitionState {
  final String? error;

  ComptitionErrorState({this.error});
}
