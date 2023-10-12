import 'package:flutter/material.dart';

import '../../../../pages/address/data/model/address_model/datum.dart';
import '../../view_model/cubit/payment_cubit.dart';

class BuildAddressItem extends StatelessWidget {
  const BuildAddressItem({Key? key, required this.state}) : super(key: key);
  final DataAddress state;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: PaymentCubit.get(context).idAddress == state.id ? Colors.deepOrangeAccent : null,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  state.name!.toUpperCase().toString(),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Icon(Icons.location_on_outlined, color: Colors.grey),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .6,
                  child: Text(
                    "${state.city!},${state.region},${state.details}",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 17),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Icon(Icons.phone),
                const SizedBox(
                  width: 10,
                ),
                if (state.notes != null)
                  Text(
                    state.notes!.toString(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 17),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
