part of 'address_bloc.dart';

class AddressState extends Equatable {
  final AddressModel? getAddressModel;
  final RequestState getAddressState;
  final String getAddressMessage;
  final AddressModificationModel? addressNewModel;
  final RequestStateCart addressNewState;
  final String addressNewMessage;
  final AddressModificationModel? addressDeleteModel;
  final RequestStateCart addressDeleteState;
  final String addressDeleteMessage;
  final AddressModificationModel? addressUpdateModel;
  final RequestStateCart addressUpdateState;
  final String addressUpdateMessage;
  const AddressState(
      {this.getAddressModel,
      this.getAddressState = RequestState.loadingState,
      this.getAddressMessage = '',
      this.addressNewModel,
      this.addressNewState = RequestStateCart.normalState,
      this.addressNewMessage = '',
      this.addressDeleteModel,
      this.addressDeleteState = RequestStateCart.normalState,
      this.addressDeleteMessage = '',
      this.addressUpdateModel,
      this.addressUpdateState = RequestStateCart.normalState,
      this.addressUpdateMessage = ''});

  AddressState copyWith({
    AddressModel? getAddressModel,
    RequestState? getAddressState,
    String? getAddressMessage,
    AddressModificationModel? addressNewModel,
    RequestStateCart? addressNewState,
    String? addressNewMessage,
    AddressModificationModel? addressDeleteModel,
    RequestStateCart? addressDeleteState,
    String? addressDeleteMessage,
    AddressModificationModel? addressUpdateModel,
    RequestStateCart? addressUpdateState,
    String? addressUpdateMessage,
  }) {
    return AddressState(
      getAddressModel: getAddressModel ?? this.getAddressModel,
      getAddressState: getAddressState ?? this.getAddressState,
      getAddressMessage: getAddressMessage ?? this.getAddressMessage,
      addressNewModel: addressNewModel ?? this.addressNewModel,
      addressNewState: addressNewState ?? this.addressNewState,
      addressNewMessage: addressNewMessage ?? this.addressNewMessage,
      addressDeleteModel: addressDeleteModel ?? this.addressDeleteModel,
      addressDeleteState: addressDeleteState ?? this.addressDeleteState,
      addressDeleteMessage: addressDeleteMessage ?? this.addressDeleteMessage,
      addressUpdateModel: addressUpdateModel ?? this.addressUpdateModel,
      addressUpdateState: addressUpdateState ?? this.addressUpdateState,
      addressUpdateMessage: addressUpdateMessage ?? this.addressUpdateMessage,
    );
  }

  @override
  List<Object?> get props => [
        getAddressModel,
        getAddressState,
        getAddressMessage,
        addressNewModel,
        addressNewState,
        addressNewMessage,
        addressDeleteModel,
        addressDeleteState,
        addressDeleteMessage,
        addressUpdateModel,
        addressUpdateState,
        addressUpdateMessage,
      ];
}
