import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:new_project/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String? email = "";
  String? password = '';
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                buildphoto(),
                SizedBox(
                  height: 25.0,
                ),
                buildEmail(),
                const SizedBox(
                  height: 25.0,
                ),
                buildPassword(),
                const SizedBox(
                  height: 25.0,
                ),
                loginButton(),
                Expanded(
                    child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: signupWidget(),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email),
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        const pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
        final regExp = RegExp(pattern);

        if (value!.isEmpty) {
          return 'Enter your university email';
        } else if (!regExp.hasMatch(value)) {
          return 'Enter a valid university email';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => setState(() => email = value),
    );
  }

  Widget buildPassword() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Yor Password',
        prefixIcon: Icon(Icons.password),
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: !isPasswordVisible
              ? Icon(Icons.visibility)
              : Icon(Icons.visibility_off),
          onPressed: () =>
              setState(() => isPasswordVisible = !isPasswordVisible),
        ),
      ),
      validator: (value) {
        if (value!.length < 7) {
          return 'Password must be at least 7 characters long';
        }
        return null;
      },
      onSaved: (value) => setState(() => password = value),
      keyboardType: TextInputType.visiblePassword,
      obscureText: isPasswordVisible,
    );
  }

  Widget loginButton() {
    return Builder(
      builder: (context) => RaisedButton(
        shape: const StadiumBorder(),
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        textColor: Colors.white,
        onPressed: () {
          final isValid = formKey.currentState?.validate();
          // FocusScope.of(context).unfocus();

          if (isValid == true) {
            formKey.currentState!.save();

            final message = '\nPassword: $password\nEmail: $email';
            final snackBar = SnackBar(
              content: Text(
                message,
                style: const TextStyle(fontSize: 20),
              ),
              backgroundColor: Colors.green,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: const Text(
          "Login",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  buildphoto() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Image.asset('assest/images/logo_caffeteriamangment.PNG',
          height: MediaQuery.of(context).size.height / 3),
    );
  }

  signupWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const RegisterScreen()));
      },
      child: Container(
        alignment: Alignment.center,
        color: Theme.of(context).primaryColor,
        height: 80.0,
        child: const Text(
          "Don/'t Have Account? Signup",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
