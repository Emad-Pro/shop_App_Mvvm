part of 'address_bloc.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

class NewAddressEvent extends AddressEvent {
  final DataAddress dataAddress;

  const NewAddressEvent({required this.dataAddress});
}

class GetAddressEvent extends AddressEvent {
  final bool isReload;

  const GetAddressEvent({required this.isReload});
}

class UpdateAddressEvent extends AddressEvent {
  final DataAddress data;
  final int id;

  const UpdateAddressEvent({required this.data, required this.id});
}

class DeleteAddressEvent extends AddressEvent {
  final int id;

  const DeleteAddressEvent(this.id);
}
