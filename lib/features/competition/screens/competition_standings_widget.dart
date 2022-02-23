import 'package:flutter/material.dart';
import 'package:football_score/features/competition/model/standings_model.dart';

class StandingsWidget extends StatelessWidget {
  const StandingsWidget({Key? key, this.standings, this.onSort})
      : super(key: key);

  final List<StandingModel>? standings;
  final Function(int, bool)? onSort;

  @override
  Widget build(BuildContext context) {
    bool sortAsc = standings == null
        ? true
        : (standings!.isNotEmpty && standings!.length < 2)
            ? true
            : standings![0].position! < standings![1].position!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: standings!.isNotEmpty
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: DataTable(
                    headingTextStyle:
                        Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                    sortColumnIndex: 0,
                    sortAscending: sortAsc,
                    columns: [
                      DataColumn(
                        label: const Text('Pos'),
                        numeric: true,
                        onSort: onSort,
                      ),
                      const DataColumn(label: Text('Name')),
                      const DataColumn(label: Text('PG')),
                      const DataColumn(label: Text('P')),
                      const DataColumn(label: Text('W')),
                      const DataColumn(label: Text('L')),
                      const DataColumn(label: Text('D')),
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
