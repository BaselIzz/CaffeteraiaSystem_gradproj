import 'package:flutter/material.dart';
import 'package:new_project/screens/login_screen.dart';
import 'package:new_project/screens/verify_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email = '';
  String? name = '';
  String? password = '';
  bool isPasswordVisible = false;
  String? phone = '';
  String? major = '';
  String? username = '';

  final formKey = GlobalKey<FormState>();
  final items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: Form(
        key: formKey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: <Widget>[
              _buildimage(),
              const SizedBox(height: 20.0),
              _buildDropdownlist(),
              const SizedBox(height: 20.0),
              _buildEmail(),
              const SizedBox(height: 20.0),
              _buildPassword(),
              const SizedBox(height: 15.0),
              _buildName(),
              const SizedBox(height: 15.0),
              _buildUserName(),
              const SizedBox(height: 20.0),
              _buildNumber(),
              const SizedBox(height: 20.0),
              _buildSignupButton(),
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuitem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Theme.of(context).primaryColor,
          ),
        ),
      );

  Widget _buildimage() {
    return Image.asset(
      'assest/images/logo_caffeteriamangment.PNG',
      height: MediaQuery.of(context).size.height / 3,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _buildDropdownlist() {
    return DropdownButton<String>(
      items: items.map(buildMenuitem).toList(),
      borderRadius: BorderRadius.circular(10),
      menuMaxHeight: 150.2,
      value: value,
      isExpanded: true,
      hint: Text(
        "Your Major",
        style: TextStyle(
            color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500),
      ),
      icon: const Icon(Icons.arrow_drop_up),
      onChanged: (value) {
        setState(() {
          this.value = value;
          major = value;
        });
      },
    );
  }

  Widget _buildEmail() {
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

  Widget _buildPassword() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      maxLength: 16,
      obscureText: isPasswordVisible,
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
        if (value!.length < 8) {
          return 'Password must be at least 8 characters long';
        }
        return null;
      },
    );
  }

  Widget _buildName() {
    return TextFormField(
      onSaved: (value) => setState(() => name = value),
      maxLength: 10,
      decoration: InputDecoration(
        labelText: 'Name',
        hintText: 'Your name',
        prefixIcon: Icon(Icons.person),
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter your name ';
        }
        return null;
      },
      autofillHints: [AutofillHints.name],
      keyboardType: TextInputType.name,
    );
  }

  Widget _buildNumber() {
    return TextFormField(
      onSaved: (value) => setState(() => phone = value),
      maxLength: 10,
      decoration: InputDecoration(
        labelText: 'Number',
        hintText: 'Your number',
        prefixIcon: Icon(Icons.phone),
        border: const OutlineInputBorder(),
      ),
      autofillHints: [AutofillHints.telephoneNumber],
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.length < 10) {
          return 'Your phone number must be digit ';
        } else if (value.contains(',')) {
          return 'your number must not contain a character';
        } else if (value.contains('.')) {
          return 'Your number must not contain a character';
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildSignupButton() {
    return Builder(
      builder: (context) => RaisedButton(
        shape: const StadiumBorder(),
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        textColor: Colors.white,
        onPressed: () {
          final isValid = formKey.currentState?.validate();

          if (isValid == true) {
            formKey.currentState!.save();

            final message =
                '\nPassword: $password\nEmail: $email \nname: $name\nphone: $phone\nmajor $major ';
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
          "Register",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  Widget _buildUserName() {
    return TextFormField(
      onSaved: (value) => setState(
        () {
          username = value;
        },
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'UserName',
        hintText: 'Your UserName',
        prefixIcon: Icon(Icons.person),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter Username';
        } else
          return null;
      },
      autofillHints: [AutofillHints.username],
      keyboardType: TextInputType.name,
    );
  }
}
