import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_score/common_widgets/svg_picture_widget.dart';
import 'package:football_score/features/competition/cubit/competition_cubit.dart';
import 'package:football_score/features/competition/cubit/competition_state.dart';
import 'package:football_score/features/competition/model/competition_model.dart';
import 'package:football_score/features/competition/screens/competition_standings_widget.dart';
import 'package:football_score/themes/app_constants.dart';

class CompetitionList extends StatelessWidget {
  final List<CompetitionModel> competitons;
  const CompetitionList({
    Key? key,
    this.competitons = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompetitionCubit, CompetitionState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var competition = competitons[index];
              return Card(
                key: ValueKey(competition.id),
                child: ExpansionTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPictureWidget(
                          url: competition.emblemUrl, code: competition.code!),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              competition.name!,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: defaultColor,
                              ),
                            ),
                            Row(
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Matchday: ${competition.currentSeason!.currentMatchday!.toString()}',
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Season: ${DateTime.tryParse(competition.currentSeason!.startDate!)!.year}/${DateTime.tryParse(competition.currentSeason!.endDate!)!.year}',
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  children: [
                    StandingsWidget(
                      standings: competition.standings,
                      onSort: (index, ascending) {
                        context
                            .read<CompetitionCubit>()
                            .sortStandings(competition.id);
                      },
                    )
                  ],
                ),
              );
            },
            itemCount: competitons.length,
          ),
        );
      },
    );
  }
}
