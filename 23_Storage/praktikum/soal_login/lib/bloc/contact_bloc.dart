import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:soal_login/models/contact_model.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(const ContactState(contacts: [])) {
    on<ContactEvent>((event, emit) {
      // TODO: implement event handler
    });
    
    on<CreateContactSubmitted>((event, emit) {
      //emit(state.copyWith(contacts: List.of(state.contacts)..add(Contact(name: event.name, phone: event.phone))));
      emit(state.createContact(name: event.name, phone: event.phone));
    });

    on<DeleteContactByIndex>((event, emit) {
      //emit(state.copyWith(contacts: List.of(state.contacts)..removeAt(event.index)));
      emit(state.deleteContact(event.index));
    });

    on<UpdateContactByIndex>((event, emit) {
      emit(state.updateContact(index: event.index, name: event.name, phone: event.phone));
    });

  }
}
