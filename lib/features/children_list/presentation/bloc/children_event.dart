part of 'children_bloc.dart';

// Child-related events
//
// ChildrenEvent - base class
// AddChildEvent - add new child
// ToggleChildStatusEvent - change status of child

@immutable
sealed class ChildrenEvent {}

class AddChildEvent extends ChildrenEvent {
  final Child child;

  AddChildEvent(this.child);
}

class ToggleChildStatusEvent extends ChildrenEvent {
  final String id;

  ToggleChildStatusEvent(this.id);
}
