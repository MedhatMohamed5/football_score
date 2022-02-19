import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_score/app/cubit/app_cubit.dart';
import 'package:football_score/app/cubit/app_states.dart';
import 'package:football_score/features/home/cubit/home_cubit.dart';
import 'package:football_score/features/home/screens/home_screen.dart';

class AppStart extends StatelessWidget {
  const AppStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (context) => AppCubit()..changeTheme(context),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit()..initTabs(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: context.read<AppCubit>().currentTheme,
              home: const HomeScreen(),
            );
          },
          listener: (context, state) {}),
    );
  }
}
