import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();

  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('We will send you an e-mail with the registered password', style: TextStyle(fontSize: 15)),
              buildEmail(),
              buildRecoverPassword(),
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

  Widget buildRecoverPassword() => Container(
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
      child: Text('Recover Password', style: TextStyle(fontSize: 19)),
      onPressed: () {
        final isValid = formKey.currentState!.validate();

        if (isValid) formKey.currentState!.save();
      },
    ),
  );
}