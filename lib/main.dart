import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

void main() {
  runApp( const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const LoginPage(),
    );
  }
}

class LogoContainer extends StatelessWidget {
  const LogoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 150,
      width: 150,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'images/T_T.jpg'),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.amber,
      body: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LogoContainer(),
              buildEmail(),
              buildPassword(),
              buildForgotPassword(),
              buildSubmit(),
              buildRegister(),
            ],
          ),
        )
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

  Widget buildForgotPassword() => Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          child: const Text('Forgot password', style: TextStyle(decoration: TextDecoration.underline)),
          onPressed: () {},
        ),
      ],
    )
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
          primary: Colors.amber
      ),
      child: Text('Sign in', style: TextStyle(fontSize: 19)),
      onPressed: () {
        final isValid = formKey.currentState!.validate();

        if (isValid) formKey.currentState!.save();
      },
    ),
  );

  Widget buildRegister() => Container(
    margin: EdgeInsets.only(top: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('...or you can', textAlign: TextAlign.center, style: TextStyle(fontSize: 17)),
        Container(
          margin: EdgeInsets.only(top: 13),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            child: Text('Sign up', style: TextStyle(fontSize: 19)),
            onPressed: () {},
          ),
        )
      ],
    ),
  );
}






