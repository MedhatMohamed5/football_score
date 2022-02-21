import 'package:flutter/material.dart';
import 'package:football_score/features/competition/model/standings_model.dart';

class StandingsWidget extends StatelessWidget {
  const StandingsWidget({Key? key, this.standings}) : super(key: key);

  final List<StandingModel>? standings;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: standings!.isNotEmpty
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    headingTextStyle:
                        Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                    sortColumnIndex: 0,
                    sortAscending: false,
                    columns: const [
                      DataColumn(label: Text('Pos')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('PG')),
                      DataColumn(label: Text('P')),
                      DataColumn(label: Text('W')),
                      DataColumn(label: Text('L')),
                      DataColumn(label: Text('D')),
                    ],
                    rows: standings!
                        .map(
                          (e) => DataRow(
                              key: ValueKey('${e.team!.name} - ${e.team!.id}'),
                              cells: [
                                DataCell(Text(e.position.toString())),
                                DataCell(Text(e.team!.name!)),
                                DataCell(Text(e.playedGames.toString())),
                                DataCell(Text(e.points.toString())),
                                DataCell(Text(e.won.toString())),
                                DataCell(Text(e.lost.toString())),
                                DataCell(Text(e.draw.toString())),
                              ]),
                        )
                        .toList(),
                  ),
                ),
              ),
            )
          : const Text('There is no data for this competition right now!'),
    );
  }
}
