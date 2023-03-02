import 'package:flutter/material.dart';
import 'Items.dart';
import 'myclipper.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  late bool pass;
  final keyform = GlobalKey<FormState>();
  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasscontroller = TextEditingController();

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
          key: keyform,
          child: Center(
            child: Column(
              children: [
                ClipPath(
                  clipper: mycustomclipper(),
                  child: Container(
                    color: const Color.fromARGB(203, 3, 10, 210),
                    width: 520,
                    height: 200,
                    child: const Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    controller: namecontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("please enter your name");
                      } else if (namecontroller.text.contains("0") ||
                          namecontroller.text.contains("1") ||
                          namecontroller.text.contains("2") ||
                          namecontroller.text.contains("3") ||
                          namecontroller.text.contains("4") ||
                          namecontroller.text.contains("5") ||
                          namecontroller.text.contains("6") ||
                          namecontroller.text.contains("7") ||
                          namecontroller.text.contains("8") ||
                          namecontroller.text.contains("9")) {
                        return ("please enter a valid name");
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      label: Text(
                        "Name",
                        style:
                            TextStyle(color: Color.fromARGB(255, 70, 68, 68)),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 70, 68, 68),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: phonecontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("please enter your phone number");
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      label: Text(
                        "Phone",
                        style:
                            TextStyle(color: Color.fromARGB(255, 70, 68, 68)),
                      ),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Color.fromARGB(255, 70, 68, 68),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: emailcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("please enter your Email");
                      } else if (emailcontroller.text.contains("@") == false ||
                          emailcontroller.text.contains(".") == false) {
                        return ("please enter a valid Email");
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      label: Text(
                        "Email",
                        style:
                            TextStyle(color: Color.fromARGB(255, 70, 68, 68)),
                      ),
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
                        "Password",
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
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: confirmpasscontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("please enter your Password");
                      } else if (value.length < 8) {
                        return ("Password must be at least 8 characters");
                      } else if (confirmpasscontroller.text !=
                          passwordcontroller.text) {
                        return ("please make sure your passwords match");
                      } else {
                        return null;
                      }
                    },
                    obscureText: pass,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      label: const Text(
                        "Confirm Password",
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
                  height: 10,
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
                      if (keyform.currentState!.validate()) {
                        print(namecontroller.text);
                        print(phonecontroller.text);
                        print(emailcontroller.text);
                        print(passwordcontroller.text);
                        print(confirmpasscontroller.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Items()),
                        );
                      }
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 22, color: Colors.white),
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
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 23, color: Color.fromARGB(203, 3, 10, 210)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
