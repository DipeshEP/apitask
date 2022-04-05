
import 'package:flutter/material.dart';
import 'package:apitask/src/pages/dashboard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _LoginPageState();
}

class _LoginPageState extends State<MyHomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
        resizeToAvoidBottomInset: true,
        body: Center(
            child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                        child:
                        Column(mainAxisSize: MainAxisSize.min, children: [
                         Container(
                           width: 100,
                           height: 100,
                           decoration: BoxDecoration(
                             border: Border.all(color: Colors.pink),
                              borderRadius: BorderRadius.circular(20.0),
                             color:Colors.pink,
                           ),
                           child: Center(
                             child: const Text("Login", style: TextStyle(
                               fontSize: 30,
                               fontWeight: FontWeight.bold,
                               color: Colors.white
                             ),),
                           ),
                         ),
                          const SizedBox(height: 30.0),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.email,color: Colors.pink,),
                              hintText: "Enter your email",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter email';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 30.0),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.vpn_key, color: Colors.pink,),
                              hintText: "EnterYourPassword",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30.0),
                          ElevatedButton(
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "SIGN IN",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const DashboardPage()));
                              } else {}
                            },
                          ),
                        ]))))));
  }
}