import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';

import 'package:shop_app_mvvm/feture/order/presentation/view_model/bloc/order_bloc.dart';

import '../../../../../core/enum.dart';
import '../../../../../core/get_it/service_locator.dart';
import '../../../../../core/methods/snackBar.dart';
import '../../../../../core/widget/custom_loading.dart';
import '../../../../home/view/home.dart';
import '../../../../pages/Carts_Shop/presentation/view_model/bloc/carts_bloc.dart';
import '../../view_model/cubit/payment_cubit.dart';

class CompletedSelectionPayment extends StatelessWidget {
  const CompletedSelectionPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CartsBloc>()..add(CartsGetDataEvent(false)),
        ),
        BlocProvider(
          create: (context) => OrderBloc(getIt()),
        ),
      ],
      child: BlocBuilder<CartsBloc, CartsState>(
        builder: (cartsContext, cartsState) {
          return BlocBuilder<PaymentCubit, PaymentState>(
            builder: (context, state) {
              return Column(children: [
                PaymentCubit.get(context).addressData == null
                    ? const LoadingWidget()
                    : Column(
                        children: [
                          Text("orderDetails".tr(context).toUpperCase()),
                          const SizedBox(
                            height: 10,
                          ),
                          ListViewOrderDetailsWidget(cartsState: cartsState),
                          const CustomerInformationWidget(),
                          TotalPurchaseWidget(
                            cartsState: cartsState,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PaymentCubit.get(context).paymentMethod == "cache"
                              ? CompletedSelectionPaymentWidget(
                                  cartsState: cartsState,
                                )
                              : PayMentPaymobWidget(cartsState: cartsState)
                        ],
                      ),
              ]);
            },
          );
        },
      ),
    );
  }
}

class CompletedSelectionPaymentWidget extends StatelessWidget {
  const CompletedSelectionPaymentWidget({Key? key, required this.cartsState}) : super(key: key);
  final CartsState cartsState;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state.orderCreateState == RequestState.loadedState) {
          snackBarCustomMethod(
              context: context, textMessage: "yourPurchaseWasCompletedSuccessfully".tr(context));
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (context) => const Home()), (route) => false);
          });
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            state.orderCreateState == RequestState.loadingState
                ? const LinearProgressIndicator()
                : ElevatedButton(
                    child: Text(
                        '${'completeYourPurchase'.tr(context)} ${cartsState.cartsModel!.data!.total!}.00 ${'EGP'.tr(context)}'
                            .toUpperCase()),
                    onPressed: () => BlocProvider.of<OrderBloc>(context).add(CreateOrderNewEvent({
                          "address_id": PaymentCubit.get(context).idAddress,
                          "payment_method": 1,
                          'use_points': false
                        }))),
          ],
        );
      },
    );
  }
}

class PayMentPaymobWidget extends StatelessWidget {
  const PayMentPaymobWidget({super.key, required this.cartsState});
  final CartsState cartsState;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentPaymobErorr) {
          snackBarCustomMethod(
              context: context,
              textMessage: state.erorrMessage.tr(context),
              backgroundColor: Colors.red);
        }
        if (state is PaymentPaymob) {
          if (state.response.success == true) {
            BlocProvider.of<OrderBloc>(context).add(CreateOrderNewEvent({
              "address_id": PaymentCubit.get(context).idAddress,
              "payment_method": 2,
              'use_points': false
            }));
          }
          snackBarCustomMethod(
              context: context, textMessage: "thePaymentWasCompletedSuccessfully".tr(context));
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (context) => const Home()), (route) => false);
          });
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                state is PaymentPaymobLoading
                    ? const LinearProgressIndicator()
                    : ElevatedButton(
                        child:
                            Text(' ${cartsState.cartsModel!.data!.total!}.00 ${'EGP'.tr(context)}'),
                        onPressed: () => PaymentCubit.get(context).paymentPaymob(
                              context: context,
                              currency: "EGP",
                              amountInCents: "${cartsState.cartsModel!.data!.total!}00",
                            )),
              ],
            ),
          ],
        );
      },
    );
  }
}

class ListViewOrderDetailsWidget extends StatelessWidget {
  const ListViewOrderDetailsWidget({super.key, required this.cartsState});
  final CartsState cartsState;
  @override
  Widget build(BuildContext context) {
    return Card(child: Builder(builder: (context) {
      switch (cartsState.cartsRequestState) {
        case RequestState.loadingState:
          return const LinearProgressIndicator();
        case RequestState.loadedState:
          return BuildItemOrderDetailsListViewWidget(cartsState: cartsState);
        case RequestState.erorrState:
          return Text(cartsState.cartsErorrMessage);
      }
    }));
  }
}

class BuildItemOrderDetailsListViewWidget extends StatelessWidget {
  const BuildItemOrderDetailsListViewWidget({super.key, required this.cartsState});
  final CartsState cartsState;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return Container(width: 10);
          },
          scrollDirection: Axis.horizontal,
          itemCount: cartsState.cartsModel!.data!.cartItems!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Image(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.03,
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              cartsState.cartsModel!.data!.cartItems![index].product!.image!,
                              scale: 2)),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(cartsState.cartsModel!.data!.cartItems![index].product!.name!),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class CustomerInformationWidget extends StatelessWidget {
  const CustomerInformationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Text("customerInformation".tr(context).toUpperCase()),
        const SizedBox(
          height: 10,
        ),
        Card(
            child: Column(
          children: [
            CusotmListTileData(
              title:
                  "${PaymentCubit.get(context).addressData!.city!},${PaymentCubit.get(context).addressData!.region} ",
              trailingText: "address".tr(context).toUpperCase(),
            ),
            CusotmListTileData(
              title: "${PaymentCubit.get(context).paymentMethod} ".toUpperCase(),
              trailingText: "paymentMethod".tr(context).toUpperCase(),
            ),
          ],
        )),
      ],
    );
  }
}

class TotalPurchaseWidget extends StatelessWidget {
  final CartsState cartsState;

  const TotalPurchaseWidget({super.key, required this.cartsState});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Text("totalPurchase".tr(context).toUpperCase()),
        const SizedBox(
          height: 10,
        ),
        Card(
            child: Column(
          children: [
            CusotmListTileData(
              title: " 0 ",
              trailingText: "deliveryService".tr(context).toUpperCase(),
            ),
            CusotmListTileData(
              title: " 0 ",
              trailingText: "totalDiscount".tr(context).toUpperCase(),
            ),
            CusotmListTileData(
              title: "${cartsState.cartsModel!.data!.cartItems!.length}",
              trailingText: "countProduct".tr(context).toUpperCase(),
            ),
            CusotmListTileData(
              title: "${cartsState.cartsModel!.data!.total!.toString()} ${"EGP".tr(context)}",
              trailingText: "totalPrice".tr(context).toUpperCase(),
            ),
          ],
        )),
      ],
    );
  }
}

class CusotmListTileData extends StatelessWidget {
  const CusotmListTileData(
      {Key? key, required this.trailingText, required this.title, this.iconBool, this.icon})
      : super(key: key);
  final String trailingText;
  final String title;
  final bool? iconBool;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        visualDensity: const VisualDensity(vertical: -3),
        leading: Text(
          " $trailingText ".toUpperCase(),
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.025, fontWeight: FontWeight.w800),
          textAlign: TextAlign.end,
        ),
        trailing: Text(
          title,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.025, fontWeight: FontWeight.w800),
        ));
  }
}
