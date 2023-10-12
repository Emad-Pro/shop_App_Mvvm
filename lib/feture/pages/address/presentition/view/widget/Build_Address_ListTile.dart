import 'package:flutter/material.dart';

import '../../../data/model/address_model/datum.dart';

class BuildAddressListTile extends StatelessWidget {
  const BuildAddressListTile({Key? key, required this.data}) : super(key: key);
  final DataAddress? data;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: ListTile(
        visualDensity: VisualDensity(vertical: 3),
        isThreeLine: true,
        leading: CircleAvatar(
          radius: 35,
          backgroundColor: Colors.deepOrangeAccent,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Text(
              data!.name!.toUpperCase().toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17 * MediaQuery.textScaleFactorOf(context)),
            ),
          ),
        ),
        title: Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          "${data!.city!},${data!.region},${data!.details}",
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: 15 * MediaQuery.textScaleFactorOf(context)),
        ),
        subtitle: Text(
          data!.notes!.toUpperCase().toString(),
          maxLines: 1,
          style: TextStyle(
              fontSize: 18 * MediaQuery.textScaleFactorOf(context), fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
