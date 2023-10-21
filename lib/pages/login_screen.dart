import 'package:e_comarcas_app/auth/auth_service.dart';
import 'package:e_comarcas_app/pages/dashbord.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailControler = TextEditingController();
  final _passControler = TextEditingController();
  final _fromKey = GlobalKey<FormState>();
  bool isVisible = true;
  String errMsg = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal[500],
        body: Form(
          key: _fromKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                //image
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 100,
                      child: Image.asset(
                        'assets/admin.png',
                        fit: BoxFit.fitWidth,
                      )),
                ),
                //Text
                const Center(
                    child: Text(
                  'Login Admin',
                  style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1,
                    wordSpacing: 1,
                    textBaseline: TextBaseline.ideographic,
                    height: 1,
                    leadingDistribution: TextLeadingDistribution.proportional,
                    locale: Locale('_'),
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                )),
                 //TextFormField
                Center(
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 40),
                            child: TextFormField(
                              controller: _emailControler,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  labelText: 'Email Address',
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This Field Can`t Empty';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 40),
                            child: TextFormField(
                              obscureText: isVisible,
                              controller: _passControler,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isVisible = !isVisible;
                                        });
                                      },
                                      icon: Icon(isVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility))),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This Field Can`t Empty';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: _loginAdmin,
                  child: const Text('Login'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(errMsg,style: TextStyle(fontSize: 30),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _loginAdmin() async {
    if (_fromKey.currentState!.validate()) {
      final email = _emailControler.text;
      final password = _passControler.text;
      try {
        final status = await AuthService.loginAdmin(email, password);
       if (status){
         Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
       } else {
         await AuthService.logout();
         setState(() {
           errMsg = 'This email is not associated with an  admin';
         });
       }
      } on FirebaseAuthException catch (error) {
        setState(() {
          errMsg= error.message!;
        });
      }
    }
  }
}
