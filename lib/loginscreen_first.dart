// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_application_2/secondscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { // Changed to Stateless since it doesn't change
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool show = false; 
  GlobalKey<FormState> formstate = GlobalKey();

TextEditingController namecont= TextEditingController();
TextEditingController usernamecont= TextEditingController();
TextEditingController passwordcont= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,), 
      backgroundColor: Colors.white,
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formstate,
          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              children: [ Text("Let's get you started!", style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),), SizedBox(height: 8),
              Text("Start your journey with us.",style: TextStyle(
                color: const Color.fromARGB(255, 97, 95, 95),
                fontSize: 20,
                fontWeight: FontWeight.w200)),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: namecont,  //remember
                    validator: (value) {
                      if (value == null || value.isEmpty) 
                      return "Name is empty";
                      if (value.length < 2) 
                      return "Name is too short";
                      return null; 
                    },
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.person, color: Color.fromARGB(255, 197, 190, 190)),
                      hintText: "Enter your Name",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ), Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: usernamecont ,  //remmeber
                    validator: (value) {
                      if (value == null || value.isEmpty) 
                      return "Username is empty";
                      if (value.length < 5) 
                      return "Username is too short\nMin of 5 characters are required";
                      return null; 
                    },
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.person, color:Color.fromARGB(255, 197, 190, 190)),
                      hintText: "Enter your Username",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordcont,
                    obscureText: !show, 
                    validator: (value) {
                      if (value == null || value.isEmpty)
                       return "Password is empty";
                      if (value.length < 8) return 
                      "Min 8 characters required";
                      return null; 
                    },
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            show = !show;
                          });
                        },
                        
                        child: Icon(
                          show ? Icons.visibility : Icons.visibility_off,
                          color: Color.fromARGB(255, 197, 190, 190),
                        ),
                      ),
                      hintText: "Enter your Password",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
            
                const SizedBox(height: 20),
                
                MaterialButton(
                  color: const Color.fromARGB(255, 7, 29, 68),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  height: 50,
                  minWidth: 300,
                  onPressed: () { 
                    String thename= namecont.text ;
                    String username = usernamecont.text;
                    String password = passwordcont.text ;
                    print(thename);
                    print(username);
                    print(password);
                    if (formstate.currentState!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondScreen(thename: namecont.text,
        username: usernamecont.text,
        password: passwordcont.text,), ));
                  }
                  }, 
                  child: const Text("Sign Up", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                    ),
                ), SizedBox(height: 10),
                Center(
                  child: Column(children: [
                    Text("Or login with",style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: Colors.black))
                  ],),
                ), SizedBox(height: 10),
                
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Expanded(
                  child: MaterialButton(
                    height: 55,
                    color: Colors.white,
                    elevation: 0, 
                    shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: const Color.fromARGB(255, 190, 189, 189)),
                ), onPressed: (){},
                child: Image.asset('assets/google.webp', height: 25),
                )
                ), SizedBox(width: 15),
                 Expanded(
                  child: MaterialButton(
                    height: 55,
                    color: Colors.white,
                    elevation: 0, 
                    shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Colors.grey.shade300),
                ), onPressed: (){},
                child: Image.asset('assets/facebook.png', height: 25),
                )
                )
                ],
                ), SizedBox(height: 10,),
                Center(
                  child: Column(
                    children: [
                    Text("Already have an account?",style: TextStyle(color: const Color.fromARGB(255, 122, 122, 122),
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
                    ), SizedBox(height: 3),
                    Text("Login",style: TextStyle(color: const Color.fromARGB(255, 7, 29, 68),
                    fontSize: 12,
                    fontWeight: FontWeight.bold))

                  ],),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}