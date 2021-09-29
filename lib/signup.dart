import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: 
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty || validateEmail(value)){
                    return "Username is invalid";
                  }
                  return null;
                },
                controller: _usernameController,
                decoration: const InputDecoration(
                filled: true,
                labelText: 'Username',
                ),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return "Please Enter Password";
                  }
                  
                  return null;
                },
                controller: _passwordController,
                decoration: const InputDecoration(
                filled: true,
                labelText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty ){
                    return "Please Enter Password";
                  }
                  if (_passwordController.text != value){
                    return "Confirm Password doesn't match Password";
                  }
                  return null;
                },
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                filled: true,
                labelText: 'Confirm Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty ){
                    return "Please enter Email Address";
                  }
                  return null;
                },
                controller: _emailController,
                decoration: const InputDecoration(
                filled: true,
                labelText: 'Email Address',
                ),
              ),
              const SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300)),
                  child: const Text('SIGN UP' , style: TextStyle(color:Colors.black87)),
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        Navigator.pop(context);
                      }
                      
                    },
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}

bool validateEmail(String value){
  int num =0;
  int charNum =0;
  value = value.toLowerCase();
  for (int i=0; i<value.length; i++){
    int c = value.codeUnitAt(i);
    if (c >= 97 && c <= 122){
      charNum ++;
    }
    else if(c>=48 && c<=57){
      num++;
    }
  }
  if (charNum < 3 || num < 3){
    return true;
  }
  return false;
}
