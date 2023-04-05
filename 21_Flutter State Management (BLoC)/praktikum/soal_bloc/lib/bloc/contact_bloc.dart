import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(const ContactState(contacts: [])) {
    on<ContactEvent>((event, emit) {
      // TODO: implement event handler
    });
    
    on<CreateContactSubmitted>((event, emit) {
      emit(state.copyWith(contacts: List.of(state.contacts)..add(Contact(name: event.name, phone: event.phone))));
    });
  }
}
