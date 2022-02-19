import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_score/app/cubit/app_cubit.dart';
import 'package:football_score/features/home/cubit/home_cubit.dart';
import 'package:football_score/features/home/cubit/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        var cubit = context.read<HomeCubit>();
        if (state is InitHomeState) {
          _tabController ??=
              TabController(length: cubit.tabs!.length, vsync: this);
        }
      },
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();

        _tabController ??=
            TabController(length: cubit.tabs!.length, vsync: this);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Scores'),
            actions: [
              IconButton(
                onPressed: () => context.read<AppCubit>().changeTheme(context),
                icon: const Icon(
                  Icons.brightness_4,
                ),
              ),
            ],
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              enableFeedback: true,
              controller: _tabController,
              tabs: cubit.tabs!,
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: cubit.tabScreen!.values.toList(),
          ),
        );
      },
    );
  }
}
