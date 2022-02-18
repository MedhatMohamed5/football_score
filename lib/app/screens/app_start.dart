import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_score/app/cubit/app_cubit.dart';
import 'package:football_score/app/cubit/app_states.dart';

class AppStart extends StatelessWidget {
  const AppStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit()..changeTheme(context),
      child: BlocConsumer<AppCubit, AppState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: context.read<AppCubit>().currentTheme,
              home: Scaffold(
                appBar: AppBar(
                  title: const Text(
                    'Scores',
                  ),
                  actions: [
                    IconButton(
                      onPressed: () =>
                          context.read<AppCubit>().changeTheme(context),
                      icon: const Icon(
                        Icons.brightness_4,
                      ),
                    ),
                  ],
                ),
                body: const Center(
                  child: Text('Welcome to our App'),
                ),
              ),
            );
          },
          listener: (context, state) {}),
    );
  }
}
