import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _FormKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _FormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _FormKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("From Validation"),
        leading: Icon(Icons.filter_vintage),
      ),
      //body
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Form(
          key: _FormKey,
          child: Column(children: [
            Text(
              "Well Come.",
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            //styling
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
            ),

            TextFormField(
              decoration: InputDecoration(labelText: 'E-mail'),
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (value) {},
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                  return 'Enter a valid email!';
                }
                return null;
              },
            ),
            //styling
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (value) {},
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter a Password';
                }
                if (value.length < 6) {
                  return 'Enter a valid Password!';
                }
                return null;
              },
            ),
            //styling
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
            ),
            ElevatedButton(
                onPressed: () => _submit(),
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
