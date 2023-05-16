// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../providers/auth_provider.dart';
import 'package:email_validator/email_validator.dart';

import '../providers/user_provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController firstnameController = TextEditingController();
    TextEditingController lastnameController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final firstname = TextFormField(
      controller: firstnameController,
      decoration: const InputDecoration(
        hintText: "First Name",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your firstname.';
        }
      },
    );

    final lastname = TextFormField(
      controller: lastnameController,
      decoration: const InputDecoration(
        hintText: "Last Name",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your lastname.';
        }
      },
    );

    final email = TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
        hintText: "Email",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email.';
        } else if (!EmailValidator.validate(value)) {
          return 'Invalid email address.';
        }
      },
    );

    final password = TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Password',
      ),
      validator: (value) {
        if (value.toString().length < 7) {
          return 'Password should have minimum of 6 characters.';
        }
      },
    );

    final SignupButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            User temp = User(
                email: emailController.text,
                firstname: firstnameController.text,
                lastname: lastnameController.text);

            context.read<UsersProvider>().addUser(temp);

            await context
                .read<AuthProvider>()
                .signUp(emailController.text, passwordController.text);

            if (context.mounted) Navigator.pop(context);
          }
        },
        child: const Text('Sign up', style: TextStyle(color: Colors.white)),
      ),
    );

    final backButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () async {
          Navigator.pop(context);
        },
        child: const Text('Back', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            children: <Widget>[
              const Text(
                "Sign Up",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
              firstname,
              lastname,
              email,
              password,
              SignupButton,
              backButton
            ],
          ),
        ),
      ),
    );
  }
}
