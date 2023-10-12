import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/core/AppLocalizations/app_localizations.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class HowImWidget extends StatelessWidget {
  const HowImWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppBar(
            backgroundColor: const Color.fromARGB(255, 61, 138, 201),
            title: Text(""),
          ),
          Stack(
            children: [
              CustomPaint(
                painter: HeaderCurvedContainer(),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Profile'.tr(context),
                      style: const TextStyle(
                        fontSize: 35.0,
                        letterSpacing: 1.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  WidgetCircularAnimator(
                    size: MediaQuery.of(context).size.width / 1.7,
                    innerIconsSize: 3,
                    outerIconsSize: 3,
                    innerAnimation: Curves.easeInOutBack,
                    outerAnimation: Curves.easeInOutBack,
                    innerColor: const Color.fromARGB(255, 181, 172, 196),
                    outerColor: const Color.fromARGB(255, 211, 165, 106),
                    innerAnimationSeconds: 10,
                    outerAnimationSeconds: 10,
                    child: Container(
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[200]),
                        child: const CircleAvatar(
                          backgroundImage: NetworkImage("https://i.ibb.co/30spf5z/DSC-8316.jpg"),
                        )),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Emad Younis",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Flutter Devopor",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  const SizedBox(height: 5),
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: Text("email".tr(context)),
                    subtitle: const Text("emadeadev@gmail.com"),
                  ),
                  Divider(
                    color: Colors.grey[400],
                    height: 0.01,
                    indent: 20.5,
                    endIndent: 20.5,
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: Text("phone".tr(context)),
                    subtitle: const Text("+201121744266"),
                  ),
                  Divider(
                    color: Colors.grey[400],
                    height: 0.01,
                    indent: 20.5,
                    endIndent: 20.5,
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_on_rounded),
                    title: Text("address1".tr(context)),
                    subtitle: const Text(
                      "Egypt,Sohag",
                    ),
                  ),
                  Divider(
                    color: Colors.grey[400],
                    height: 0.01,
                    indent: 20.5,
                    endIndent: 20.5,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color.fromARGB(255, 61, 138, 201);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 250.0, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
