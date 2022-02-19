import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_score/features/competition/screens/competition_screen.dart';
import 'package:football_score/features/home/cubit/home_state.dart';
import 'package:football_score/features/team/screens/team_screen.dart';
import 'package:football_score/themes/app_constants.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitHomeState());

  List<Tab>? tabs;
  Map<Tab, Widget>? tabScreen;

  void initTabs() {
    tabs = [
      Tab(
        icon: tabIcon(Icons.sports_soccer_outlined),
      ),
      Tab(
        icon: tabIcon(Icons.groups),
      ),
    ];

    tabScreen = {
      tabs![0]: const CompetitionScreen(),
      tabs![1]: const TeamScreen(),
    };
    emit(InitHomeState());
  }

  Container tabIcon(IconData iconData) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(64),
        border: Border.all(
          width: 2,
          color: defaultColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 64, right: 64),
        child: Icon(
          iconData,
        ),
      ),
    );
  }
}
