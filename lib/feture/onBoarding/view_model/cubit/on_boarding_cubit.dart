import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/core/shared_preferences/CacheHelper.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());
  List<OnBoardModel> onBoardData(context) => [
        OnBoardModel(
          title: "Explore Products".tr(context),
          description:
              "Ease of shopping, as customers can compare and contrast different products, prices and offers and choose the best without the slightest effort."
                  .tr(context),
          imgUrl: "assets/onBoarding/imges/Untitled-1.png",
        ),
        OnBoardModel(
          title: "Esey Payment".tr(context),
          description:
              "Many online stores offer a range of different payment methods, such as credit card payment or cash on delivery"
                  .tr(context),
          imgUrl: 'assets/onBoarding/imges/Untitled-2.png',
        ),
        OnBoardModel(
          title: "Quick Delivery".tr(context),
          description:
              "Purchasing does not require any fatigue, hardship, or leaving the house. All you have to do is press the purchase button and you can choose all the products or services you want inside the store, which greatly facilitated the purchasing process."
                  .tr(context),
          imgUrl: 'assets/onBoarding/imges/Untitled-3.png',
        ),
      ];
  dounCachedBoarding() {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      emit(OnBoardingDoneScreenState());
    });
  }
}
