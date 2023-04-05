part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class CreateContactSubmitted extends ContactEvent {

  final String name;
  final String phone;

  const CreateContactSubmitted(this.name, this.phone);

  @override
  List<Object> get props => [name, phone];
}