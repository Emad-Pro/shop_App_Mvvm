import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../view_model/cubit/setting_cubit.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({Key? key, required this.title, required this.widget}) : super(key: key);
  final String title;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
        },
        trailing: Icon(
          BlocProvider.of<SettingCubit>(context).locale!.languageCode == "ar"
              ? IconBroken.Arrow___Left_2
              : IconBroken.Arrow___Right_2,
        ),
        titleAlignment: ListTileTitleAlignment.titleHeight,
        visualDensity: VisualDensity.comfortable,
        dense: false,
        horizontalTitleGap: MediaQuery.of(context).size.width * 0.5,
        leading: SizedBox(
          child: Text(
            title.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
