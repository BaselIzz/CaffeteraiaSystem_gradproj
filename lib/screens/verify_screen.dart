import 'package:flutter/material.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: buildVerify(),
      ),
    );
  }

  Widget buildVerify() {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Verfication code"),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Verification code '),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
