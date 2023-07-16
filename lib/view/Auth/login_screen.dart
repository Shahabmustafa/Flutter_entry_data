import 'package:flutter/material.dart';
import 'package:flutter_entry_data/res/component/custom_button.dart';
import 'package:flutter_entry_data/view%20model/Auth%20Controller/auth_controller.dart';
import 'package:flutter_entry_data/view/Auth/sign_up.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login',style: Theme.of(context).textTheme.titleMedium,),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: email,
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
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter Your Password",
                hintStyle: Theme.of(context).textTheme.titleSmall,
                border: OutlineInputBorder(),
              ),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: 20,
            ),
            ChangeNotifierProvider(
                create: (_) => AuthController(),
              child: Consumer<AuthController>(
                  builder: (context,provider,child){
                    return CustomButton(
                      title: 'Login',
                      loading: provider.loading,
                      onTap: (){
                        provider.Login(
                            context,
                            email.text,
                            password.text,
                        );
                      },
                    );
                  }
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("You Create an Account?"),
                TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                    }, child: Text('Sign Up'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
