import 'package:flutter/material.dart';
import 'package:login/Items.dart';
import 'myclipper.dart';
import 'package:login/register.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  late bool pass;
  final formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    pass = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Center(
            child: Column(
              children: [
                ClipPath(
                  clipper: mycustomclipper(),
                  child: Container(
                    color: const Color.fromARGB(203, 3, 10, 210),
                    width: 520,
                    height: 300,
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("please enter your Email");
                      } else if (emailcontroller.text.contains("@") == false ||
                          emailcontroller.text.contains(".") == false) {
                        return ("please enter a valid Email");
                      }
                      return null;
                    },
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: "Email",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 70, 68, 68)),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 70, 68, 68),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: passwordcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("please enter your Password");
                      } else if (value.length < 8) {
                        return ("Password must be at least 8 characters");
                      } else {
                        return null;
                      }
                    },
                    obscureText: pass,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      label: const Text(
                        "password",
                        style:
                            TextStyle(color: Color.fromARGB(255, 70, 68, 68)),
                      ),
                      suffixIcon: IconButton(
                          color: Colors.black,
                          onPressed: () {
                            setState(() {
                              pass = !pass;
                            });
                          },
                          icon: pass
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color.fromARGB(255, 70, 68, 68),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0),
                      color: const Color.fromARGB(203, 3, 10, 210),
                      borderRadius: BorderRadius.circular(10)),
                  width: 320,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        print(emailcontroller.text);
                        print(passwordcontroller.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Items()),
                        );
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 320,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const register()),
                      );
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 22, color: Color.fromARGB(203, 3, 10, 210)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
