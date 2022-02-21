import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_score/features/competition/cubit/competition_cubit.dart';
import 'package:football_score/features/competition/cubit/competition_state.dart';
import 'package:football_score/features/competition/screens/competition_list_widget.dart';

class CompetitionScreen extends StatefulWidget {
  const CompetitionScreen({Key? key}) : super(key: key);

  @override
  _CompetitionScreenState createState() => _CompetitionScreenState();
}

class _CompetitionScreenState extends State<CompetitionScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompetitionCubit, CompetitionState>(
      builder: (context, state) {
        var cubit = context.read<CompetitionCubit>();
        if (state is CompetitionLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: CompetitionList(competitons: cubit.competitions),
        );
      },
      listener: (context, state) {},
    );
  }
}
