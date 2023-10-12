import 'package:paymob_payment/paymob_payment.dart';
import 'package:shop_app_mvvm/feture/onBoarding/view/onBoarding_view.dart';

import '../../feture/auth/login/presentition/view/login_view.dart';
import '../../feture/home/view/home.dart';
import '../shared_preferences/CacheHelper.dart';

class UserData {
  static bool? onBoarding;
  static String? uId = '';
  static String? userName = '';
  static init() async {
    onBoarding = await CacheHelper.getSaveData(key: 'onBoarding');
    uId = await CacheHelper.getSaveData(key: 'uId');
    userName = await CacheHelper.getSaveData(key: "userName");
  }

  static homewidget() {
    // ignore: unnecessary_null_comparison
    if (onBoarding != null) {
      if (uId != null) {
        return const Home();
      } else {
        return const LoginView();
      }
    } else {
      return OnBoarding();
    }
  }
}

class SettingApp {
  static bool darkMode = false;

  static Future settingDarkModeInit() async {
    if (CacheHelper.getSaveData(key: "darkMode") == null) {
      CacheHelper.saveData(key: "darkMode", value: false);
    }
    darkMode = await CacheHelper.getSaveData(key: "darkMode");
  }
}

class PayMob {
  static init() async {
    await PaymobPayment.instance.initialize(
      apiKey:
          "ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SndjbTltYVd4bFgzQnJJam8yTlRjd01qRXNJbTVoYldVaU9pSnBibWwwYVdGc0lpd2lZMnhoYzNNaU9pSk5aWEpqYUdGdWRDSjkuUkM1RW1pTFQ0NTVHLUQ2aTNROGhobG1FZTlkeE40MFQzdHloREFWNnhxUjd0ZUx0RkVHa3RDVUNQbHFqZjlQa1U5VHViRXQ0QnUyREVrakRQMjZZYlE=", // from dashboard Select Settings -> Account Info -> API Key
      integrationID: 3211405,
      iFrameID: 713302,
    );
  }
}
