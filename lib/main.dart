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
      body: Center(
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(25),
            children: [
              const LogoContainer(),
              Center(child: Text('Welcome to the APP')),
              buildEmail(),
              const SizedBox(height: 16),
              buildPassword(),
              const SizedBox(height: 16),
              buildSubmit(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmail() => TextFormField(
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
  );

  Widget buildPassword() => TextFormField(
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
  );

  Widget buildSubmit() => Container(
    color: Colors.indigo,
    child: TextButton(
      style: TextButton.styleFrom(
          primary: Colors.amber
      ),
      child: Text('Login'),
      onPressed: () {
        final isValid = formKey.currentState!.validate();

      },
    ),
  );
}






