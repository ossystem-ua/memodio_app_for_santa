import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santa_app/features/children_list/domain/entities/child.dart';
import 'package:santa_app/features/children_list/presentation/bloc/children_bloc.dart';
import 'package:santa_app/features/children_list/presentation/widgets/child_tile.dart';
import 'package:santa_app/features/children_list/presentation/widgets/dialogs/add_child_dialog.dart';

// Representing screen with list of children
class ChildrenListScreen extends StatelessWidget {
  const ChildrenListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Child List'),
      ),
      body: BlocBuilder<ChildrenBloc, ChildrenListState>(
        builder: (context, state) {
          if (state.children.isNotEmpty) {
            return ListView.builder(
              itemCount: state.children.length,
              itemBuilder: (context, index) {
                Child child = state.children[index];
                return ChildTile(child: child);
              },
            );
          } else {
            return const Center(
              child: Text("No children in the list."),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open a dialog to add a new child
          showDialog(
            context: context,
            builder: (BuildContext dialogContext) {
              return BlocProvider.value(
                value: context.read<ChildrenBloc>(),
                child: AddChildDialog(),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
