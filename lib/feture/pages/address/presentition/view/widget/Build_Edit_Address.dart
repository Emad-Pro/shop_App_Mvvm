import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/core/widget/custom_buttom.dart';
import 'package:shop_app_mvvm/feture/home/view_model/cubit/home_cubit.dart';

import '../../../data/model/address_model/datum.dart';
import '../../view_model/bloc/address_bloc.dart';
import 'Failed_address_widget.dart';

class BuildEditAddress extends StatelessWidget {
  const BuildEditAddress({super.key, this.data});
  final DataAddress? data;
  @override
  Widget build(BuildContext context) {
    TextEditingController nameAddress = TextEditingController();
    TextEditingController cityAddress = TextEditingController();
    TextEditingController regionAddress = TextEditingController();
    TextEditingController detailsAddress = TextEditingController();
    TextEditingController phoneAddress = TextEditingController();
    TextEditingController lateAddress = TextEditingController();
    TextEditingController longAddress = TextEditingController();
    fillValueMethod(nameAddress, cityAddress, regionAddress, detailsAddress, phoneAddress,
        lateAddress, longAddress);
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeBottomNavigatorBarChangeState) {
          Navigator.pop(context);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 1,
          child: SingleChildScrollView(
            child: Column(
              children: [
                FiledAddress(
                  nameAddress: nameAddress,
                  cityAddress: cityAddress,
                  regionAddress: regionAddress,
                  detailsAddress: detailsAddress,
                  phoneAddress: phoneAddress,
                  lateAddress: lateAddress,
                  longAddress: longAddress,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButtom(
                  widget: Text("update".tr(context).toUpperCase()),
                  color: Colors.deepOrangeAccent,
                  width: MediaQuery.of(context).size.width,
                  onPressed: () {
                    BlocProvider.of<AddressBloc>(context).add(UpdateAddressEvent(
                        data: DataAddress(
                          id: data!.id,
                          name: nameAddress.text,
                          city: cityAddress.text,
                          region: regionAddress.text,
                          details: detailsAddress.text,
                          notes: phoneAddress.text,
                          latitude: lateAddress.text.isEmpty ? "0" : lateAddress.text,
                          longitude: longAddress.text.isEmpty ? "0" : longAddress.text,
                        ),
                        id: data!.id!));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void fillValueMethod(
      TextEditingController nameAddress,
      TextEditingController cityAddress,
      TextEditingController regionAddress,
      TextEditingController detailsAddress,
      TextEditingController phoneAddress,
      TextEditingController lateAddress,
      TextEditingController longAddress) {
    nameAddress.text = data!.name!;
    cityAddress.text = data!.city!;
    regionAddress.text = data!.region!;
    detailsAddress.text = data!.details!;
    phoneAddress.text = data!.notes!.toString();
    lateAddress.text = data!.latitude!.toString();
    longAddress.text = data!.longitude!.toString();
  }
}
