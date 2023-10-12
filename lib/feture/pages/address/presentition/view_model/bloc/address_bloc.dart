import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_mvvm/core/enum.dart';

import '../../../data/model/address_model/address_model.dart';
import '../../../data/model/address_model/datum.dart';
import '../../../data/model/address_modifie_model/address_modification_model.dart';
import '../../../data/repository/address_repoistory.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRepoistory addressRepoistory;
  AddressBloc(this.addressRepoistory) : super(const AddressState()) {
    on<NewAddressEvent>(_fetchNewAddress);
    on<GetAddressEvent>(_fetchGetAddress);
    on<UpdateAddressEvent>(_fetchUpdateAddress);
    on<DeleteAddressEvent>(_fetchDeleteAddress);
  }

  FutureOr<void> _fetchNewAddress(NewAddressEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(
        addressNewState: RequestStateCart.loadingState,
        addressUpdateState: RequestStateCart.normalState,
        addressDeleteState: RequestStateCart.normalState));
    final result = await addressRepoistory.fetchNewAddress(dataAddress: event.dataAddress);
    result.fold(
        (l) => emit(state.copyWith(
            addressNewState: RequestStateCart.erorrState,
            addressUpdateState: RequestStateCart.normalState,
            addressDeleteState: RequestStateCart.normalState,
            addressNewMessage: l.erorrMessage)), (r) {
      emit(state.copyWith(
          addressNewState: RequestStateCart.loadedState,
          addressUpdateState: RequestStateCart.normalState,
          addressDeleteState: RequestStateCart.normalState,
          addressNewModel: r));
    });
  }

  FutureOr<void> _fetchGetAddress(GetAddressEvent event, Emitter<AddressState> emit) async {
    if (event.isReload == true) {
      emit(state.copyWith(
          getAddressState: RequestState.loadingState,
          addressNewState: RequestStateCart.normalState,
          addressUpdateState: RequestStateCart.normalState,
          addressDeleteState: RequestStateCart.normalState));
    }
    final result = await addressRepoistory.fetchGetAddress();
    result.fold(
        (l) => emit(state.copyWith(
            getAddressState: RequestState.erorrState,
            getAddressMessage: l.erorrMessage,
            addressNewState: RequestStateCart.normalState,
            addressUpdateState: RequestStateCart.normalState,
            addressDeleteState: RequestStateCart.normalState)),
        (r) => emit(state.copyWith(
            getAddressState: RequestState.loadedState,
            getAddressModel: r,
            addressNewState: RequestStateCart.normalState,
            addressUpdateState: RequestStateCart.normalState,
            addressDeleteState: RequestStateCart.normalState)));
  }

  FutureOr<void> _fetchUpdateAddress(UpdateAddressEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(
        addressNewState: RequestStateCart.normalState,
        addressUpdateState: RequestStateCart.loadingState,
        addressDeleteState: RequestStateCart.normalState));
    final result =
        await addressRepoistory.fetchUpdateAddress(addressId: event.id, dataAddress: event.data);
    result.fold(
        (l) => emit(state.copyWith(
            addressNewState: RequestStateCart.normalState,
            addressUpdateState: RequestStateCart.erorrState,
            addressDeleteState: RequestStateCart.normalState,
            addressNewMessage: l.erorrMessage)),
        (r) => emit(state.copyWith(
            addressNewState: RequestStateCart.normalState,
            addressUpdateState: RequestStateCart.loadedState,
            addressDeleteState: RequestStateCart.normalState,
            addressUpdateModel: r)));
  }

  FutureOr<void> _fetchDeleteAddress(DeleteAddressEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(
        addressNewState: RequestStateCart.normalState,
        addressUpdateState: RequestStateCart.normalState,
        addressDeleteState: RequestStateCart.loadingState));
    final result = await addressRepoistory.fetchDeleteAddress(addressId: event.id);
    result.fold(
        (l) => emit(state.copyWith(
            addressNewState: RequestStateCart.normalState,
            addressUpdateState: RequestStateCart.normalState,
            addressDeleteState: RequestStateCart.erorrState,
            addressNewMessage: l.erorrMessage)), (r) {
      return emit(state.copyWith(
          addressNewState: RequestStateCart.normalState,
          addressUpdateState: RequestStateCart.normalState,
          addressDeleteState: RequestStateCart.loadedState,
          addressDeleteModel: r));
    });
  }
}
