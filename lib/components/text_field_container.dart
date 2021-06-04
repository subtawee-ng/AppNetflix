import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final double cir;
  const TextFieldContainer({
    Key key,
    this.child,
    this.cir,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(cir),
      ),
      child: child,
    );
  }
}
