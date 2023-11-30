import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santa_app/features/children_list/domain/entities/child.dart';
import 'package:santa_app/features/children_list/presentation/bloc/children_bloc.dart';

// Representing a ListTile for displaying information about a child
class ChildTile extends StatelessWidget {
  const ChildTile({super.key, required this.child});

  final Child child;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Name: ${child.name}"),
      subtitle: Text(
          'Country: ${child.country}\nStatus: ${child.status ? 'Nice' : 'Naughty'}'),
      onTap: () {
        BlocProvider.of<ChildrenBloc>(context)
            .add(ToggleChildStatusEvent(child.id));
      },
    );
  }
}
