import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
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
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Enter your Name"
                ),
              ),
              const SizedBox(height: 16),
               TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Enter your phone"
                ),
              ),
              const SizedBox(height: 32),
              const SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text("Confirm"),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

