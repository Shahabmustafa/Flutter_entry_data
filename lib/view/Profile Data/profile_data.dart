

import 'package:flutter/material.dart';
import 'package:flutter_entry_data/res/component/custom_button.dart';
import 'package:flutter_entry_data/view%20model/Data%20Update/update_data.dart';
import 'package:provider/provider.dart';

class ProfileData extends StatefulWidget {
  const ProfileData({Key? key}) : super(key: key);

  @override
  State<ProfileData> createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {
  final industryController = TextEditingController();
  final locationController = TextEditingController();
  final phoneNumber = TextEditingController();
  final registration = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Data'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: industryController,
              decoration: InputDecoration(
                hintText: "Industry Name",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: locationController,
              decoration: InputDecoration(
                  hintText: "Location",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: phoneNumber,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Phone No",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: registration,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Registration No",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ChangeNotifierProvider(
              create: (_) => updataData(),
              child: Consumer<updataData>(
                  builder: (context,provider,child){
                    return CustomButton(
                        title: 'Add',
                        loading: provider.loading,
                        onTap: (){
                          provider.Update(
                              context,
                              industryController.text,
                              locationController.text,
                              phoneNumber.text,
                              registration.text,
                          );
                        }
                    );

                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
