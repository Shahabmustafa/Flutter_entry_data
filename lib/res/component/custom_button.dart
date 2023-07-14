import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_entry_data/res/color.dart';

class CustomButton extends StatelessWidget {
  String title;
  VoidCallback? onTap;
  CustomButton({Key? key,required this.title,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: ColorApp.primaryColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: ColorApp.primaryColor,
          )
        ),
        child: Center(child: Text(title,style: Theme.of(context).textTheme.titleMedium,)),
      ),
    );
  }
}
