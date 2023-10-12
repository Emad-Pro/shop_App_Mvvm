import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';

import '../../../../../../../../../core/widget/custom_textFormFild.dart';

class FiledAddress extends StatefulWidget {
  const FiledAddress({
    super.key,
    required this.nameAddress,
    required this.cityAddress,
    required this.regionAddress,
    required this.detailsAddress,
    required this.phoneAddress,
    required this.lateAddress,
    required this.longAddress,
  });

  final TextEditingController nameAddress;
  final TextEditingController cityAddress;
  final TextEditingController regionAddress;
  final TextEditingController detailsAddress;
  final TextEditingController phoneAddress;
  final TextEditingController lateAddress;
  final TextEditingController longAddress;

  @override
  State<FiledAddress> createState() => _FiledAddressState();
}

class _FiledAddressState extends State<FiledAddress> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          CustomTextFormFiled(
            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'pleaseEnterYourNameAddress'.tr(context).toUpperCase();
              }
              return null;
            },
            hintText: "nameAddress".tr(context).toUpperCase(),
            formFieldController: widget.nameAddress,
            maxLength: 5,
          ),
          const SizedBox(
            height: 7,
          ),
          CustomTextFormFiled(
            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'pleaseEnterCityName'.tr(context).toUpperCase();
              }
              return null;
            },
            hintText: "city".tr(context).toUpperCase(),
            formFieldController: widget.cityAddress,
          ),
          const SizedBox(
            height: 7,
          ),
          CustomTextFormFiled(
            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'pleaseEnterRegionName'.tr(context).toUpperCase();
              }
              return null;
            },
            hintText: "region".tr(context).toUpperCase(),
            formFieldController: widget.regionAddress,
          ),
          const SizedBox(
            height: 7,
          ),
          CustomTextFormFiled(
            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'pleaseEnterDetails'.tr(context).toUpperCase();
              }
              return null;
            },
            hintText: "details".tr(context).toUpperCase(),
            formFieldController: widget.detailsAddress,
          ),
          const SizedBox(
            height: 7,
          ),
          CustomTextFormFiled(
            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'pleaseEnterYourPhoneNumber'.tr(context).toUpperCase();
              }
              return null;
            },
            hintText: "phone".tr(context).toUpperCase(),
            formFieldController: widget.phoneAddress,
          ),
          const SizedBox(
            height: 7,
          ),
          CustomTextFormFiled(
            typekeyboard: TextInputType.number,
            hintText: "latitude".tr(context).toUpperCase(),
            formFieldController: widget.lateAddress,
          ),
          const SizedBox(
            height: 7,
          ),
          CustomTextFormFiled(
            typekeyboard: TextInputType.number,
            hintText: "longitude".tr(context).toUpperCase(),
            formFieldController: widget.longAddress,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9-.]')),
            ],
          ),
        ],
      ),
    );
  }
}
