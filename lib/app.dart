import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_graph_ql/constants/app_route.dart';
import 'package:todo_app_graph_ql/cubit/main_cubit/main_cubit.dart';

class LearnGQL extends StatelessWidget {
  const LearnGQL({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainCubit()),
      ],
      child: MaterialApp.router(
        theme: ThemeData.light(useMaterial3: true),
        routerConfig: AppRoute.route,
      ),
    );
  }
}
