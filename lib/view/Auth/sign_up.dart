import 'package:flutter/material.dart';
import 'package:flutter_entry_data/view%20model/Auth%20Controller/auth_controller.dart';
import 'package:flutter_entry_data/view/Auth/login_screen.dart';
import 'package:provider/provider.dart';

import '../../res/component/custom_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: userNameController,
              decoration: InputDecoration(
                hintText: "Enter Your Full Name",
                hintStyle: Theme.of(context).textTheme.titleSmall,
                border: OutlineInputBorder(),
              ),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Enter Your Email",
                hintStyle: Theme.of(context).textTheme.titleSmall,
                border: OutlineInputBorder(),
              ),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter Your Password",
                hintStyle: Theme.of(context).textTheme.titleSmall,
                border: OutlineInputBorder(),
              ),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              height: 20,
            ),
            ChangeNotifierProvider(
                create: (_) => AuthController(),
              child: Consumer<AuthController>(
                  builder: (context,provider,child){
                    return CustomButton(
                      title: 'sign up',
                      loading: provider.loading,
                      onTap: (){
                        provider.Signup(
                            context,
                            userNameController.text,
                            emailController.text,
                            passwordController.text
                        );
                        print('object');
                      },
                    );
                  }
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("You Account has been Create?"),
                TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    }, child: Text('Login'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
