import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_basic/utils/getUserData.dart';
import 'package:shared_preferences/shared_preferences.dart';


void saveUserData(String phoneNumber, String name, BuildContext context) async {
  if (phoneNumber.trim() != "" && name.trim() != "") {
    await setUserData({"phoneNumber": phoneNumber, "name": name});
    context.go("/");
  }
}


class Auth extends StatefulWidget {
  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  String phoneNumber = "";
  String name = "";
  
  onChangeName(String text) {
     setState(() {
      name = text;
    });
  }

  onChangePhoneNumber(String text) {
    setState(() {
      phoneNumber = text;
    });
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: const Text("Authenticated")),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                onChanged: onChangeName,
                initialValue: name,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Enter your Name"
                ),
              ),
              const SizedBox(height: 16),
               TextFormField(
                onChanged: onChangePhoneNumber,
                initialValue: phoneNumber,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Enter your phone"
                ),
              ),
              const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => saveUserData(phoneNumber, name, context),
                    child: const Text("Confirm"),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

