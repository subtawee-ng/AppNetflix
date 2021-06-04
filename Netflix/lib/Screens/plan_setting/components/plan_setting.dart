import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/plan_setting/components/background.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/models/Payment.dart';

import 'package:flutter_auth/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Plan_setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "SIGNUP",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            RoundedInputField(
              hintText: "First Name",
              icon: Icons.account_circle_outlined,
              rr: 0,
              onChanged: (value) {},
            ),
            RoundedInputField(
              icon: Icons.lock_open_outlined,
              hintText: "Last Name",
              rr: 0,
              onChanged: (value) {},
            ),
            RoundedInputField(
              icon: Icons.credit_card,
              hintText: "Card number",
              rr: 0,
              onChanged: (value) {},
            ),
            RoundedInputField(
              icon: Icons.info,
              hintText: "Expiration date (month/years)",
              rr: 0,
              onChanged: (value) {},
            ),
            RoundedInputField(
              icon: Icons.lock_rounded,
              hintText: "Security",
              rr: 0,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> signUpHandler(UserRegister user, Payment payment) async {
  try {
    var dio = Dio();
    var response = await dio.post("https://netflix-cpe231.herokuapp.com/login",
        data: user.toJson());

    if (response.statusCode != 200) {
      return "";
    }
    var token = response.data['token'];

    response =
        await dio.post("https://netflix-cpe231.herokuapp.com/user/payment",
            data: payment.toJson(),
            options: Options(headers: {
              'Authorization': 'Bearer $token',
            }));
    if (response.statusCode != 200) {
      return "";
    }

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('tokenUser', token);

    return token;
  } catch (e) {
    return "";
  }
}
