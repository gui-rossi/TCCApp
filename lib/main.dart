import 'package:flutter/material.dart';

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
  int _counter = 0;
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  void _incrementCounter() {
    setState(() {
      _counter = _counter + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              buildSubmit()
            ],
          ),
        )
      )
    );
  }

  Widget buildEmail() => Container(
    margin: EdgeInsets.only(top: 8, bottom: 8),
    child: TextFormField(
      decoration: InputDecoration(
          labelText: 'E-mail',
          border: OutlineInputBorder()
      ),
      validator: (value) {
        if (value!.length < 4) {
          return 'Less than 4 characters';
        } else {
          return null;
        }
      },
      onSaved: (value) => setState(() => email = value!),
    )
  );

  Widget buildPassword() => Container(
    margin: EdgeInsets.only(top: 8, bottom: 8),
    child: TextFormField(
      decoration: InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder()
      ),
      validator: (value) {
        if (value != null) {
          if (value.length < 4) {
            return 'Less than 4 characters';
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
          primary: Colors.amber
      ),
      child: Text('Login', style: TextStyle(fontSize: 19)),
      onPressed: () {
        final isValid = formKey.currentState!.validate();

      },
    ),
  );
}






