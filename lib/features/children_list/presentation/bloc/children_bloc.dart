import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:santa_app/features/children_list/domain/entities/child.dart';

part 'children_event.dart';
part 'children_state.dart';

class ChildrenBloc extends Bloc<ChildrenEvent, ChildrenListState> {
  // Constructor initializes the bloc with an initial state of ChildrenListState containing an empty list of children
  ChildrenBloc() : super(const ChildrenListState([])) {
    // Defining event handlers for AddChildEvent and ToggleChildStatusEvent
    on<AddChildEvent>(_onAddChildEvent);
    on<ToggleChildStatusEvent>(_onToggleChildStatusEvent);
  }

  // Event handler for AddChildEvent
  _onAddChildEvent(AddChildEvent event, Emitter emit) {
    List<Child> childrenList = List.from((state).children);
    childrenList.insert(0, event.child);
    emit(ChildrenListState(childrenList));
  }

  // Event handler for ToggleChildStatusEvent
  _onToggleChildStatusEvent(ToggleChildStatusEvent event, Emitter emit) {
    List<Child> childrenList = List.from((state).children);
    int index = childrenList.indexWhere((child) => child.id == event.id);
    if (index != -1) {
      Child updatedChild =
          childrenList[index].copyWith(status: !childrenList[index].status);
      childrenList[index] = updatedChild;
      emit(ChildrenListState(childrenList));
    }
  }
}
