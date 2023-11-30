import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santa_app/features/children_list/presentation/bloc/children_bloc.dart';
import 'package:santa_app/features/children_list/presentation/widgets/screens/children_list_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ChildrenBloc>(create: (context) => ChildrenBloc()),
        ],
        child: const ChildrenListScreen(),
      ),
    );
  }
}
