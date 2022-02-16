import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildEmail(),
              buildPassword(),
              buildSubmit(),
            ],
          ),
        ),
      )
    );
  }

  Widget buildEmail() => Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
            labelText: 'E-mail',
            border: OutlineInputBorder()
        ),
        validator: (value) => EmailValidator.validate(value) ? null : "Please, enter a valid e-mail",
        onSaved: (value) => setState(() => email = value!),
      )
  );

  Widget buildPassword() => Container(
    margin: EdgeInsets.only(top: 8),
    child: TextFormField(
      autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder()
      ),
      validator: (value) {
        if (value != null) {
          if (value.length < 6) {
            return 'Less than 6 characters';
          } else {
            return null;
          }
        }
      },
      onSaved: (value) => setState(() => password = value!),
      obscureText: true,
    ),
  );

  Widget buildSubmit() => Container(
    margin: EdgeInsets.only(top: 8),
    width: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.indigo,
    ),
    child: TextButton(
      style: TextButton.styleFrom(
          primary: Colors.amberAccent
      ),
      child: Text('Register', style: TextStyle(fontSize: 19)),
      onPressed: () {
        final isValid = formKey.currentState!.validate();

        if (isValid) formKey.currentState!.save();
      },
    ),
  );
}