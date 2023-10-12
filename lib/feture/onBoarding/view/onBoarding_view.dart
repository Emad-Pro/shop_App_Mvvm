import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:shop_app_mvvm/core/widget/BuildDrawerWidget.dart';
import 'package:shop_app_mvvm/feture/auth/login/presentition/view/login_view.dart';
import 'package:shop_app_mvvm/feture/home/view/home.dart';
import 'package:shop_app_mvvm/feture/onBoarding/view_model/cubit/on_boarding_cubit.dart';

// ignore: must_be_immutable
class OnBoarding extends StatelessWidget {
  OnBoarding({Key? key}) : super(key: key);
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<OnBoardingCubit, OnBoardingState>(
      listener: (context, state) {
        if (state is OnBoardingDoneScreenState) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (BuildContext context) => const LoginView()));
        }
      },
      child: Builder(builder: (context) {
        context.select((OnBoardingCubit bloc) => bloc.state);
        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text("مرحباً بك".tr(context))),
          ),
          drawer: BuildDrawerWidget(),
          body: OnBoard(
            pageController: pageController,
            onSkip: () {},
            onDone: () {},
            onBoardData: BlocProvider.of<OnBoardingCubit>(context).onBoardData(context),
            titleStyles: const TextStyle(
              color: Colors.deepOrange,
              fontSize: 18,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.15,
            ),
            descriptionStyles: TextStyle(
              fontSize: 16,
              color: Colors.brown.shade300,
            ),
            imageWidth: MediaQuery.of(context).size.width / 1.2,
            pageIndicatorStyle: const PageIndicatorStyle(
              width: 100,
              inactiveColor: Colors.deepOrangeAccent,
              activeColor: Colors.deepOrange,
              inactiveSize: Size(8, 8),
              activeSize: Size(12, 12),
            ),
            skipButton: Container(),
            nextButton: OnBoardConsumer(
              builder: (context, ref, child) {
                final state = ref.watch(onBoardStateProvider);
                if (!state.isLastPage) {
                  return WidgetNextScreenBoadring(state: state, pageController: pageController);
                } else {
                  return const WidgetDoneScreenBoadring();
                }
              },
            ),
          ),
        );
      }),
    );
  }
}

class WidgetDoneScreenBoadring extends StatelessWidget {
  const WidgetDoneScreenBoadring({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<OnBoardingCubit>(context).dounCachedBoarding();
      },
      child: Container(
        width: 230,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [Colors.redAccent, Colors.deepOrangeAccent],
          ),
        ),
        child: Text(
          "Done".tr(context),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class WidgetNextScreenBoadring extends StatelessWidget {
  const WidgetNextScreenBoadring({
    super.key,
    required this.state,
    required this.pageController,
  });

  final OnBoardState state;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        {
          if (!state.isLastPage) {
            pageController.animateToPage(
              state.page + 1,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOutSine,
            );
          } else {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
          }
        }
      },
      child: Container(
        width: 230,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [Colors.redAccent, Colors.deepOrangeAccent],
          ),
        ),
        child: Text(
          "Next".tr(context),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
