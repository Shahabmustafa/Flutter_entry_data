import 'package:flutter/material.dart';
import 'package:flutter_entry_data/res/component/custom_button.dart';
import 'package:provider/provider.dart';

import '../../view model/Data Update/update_data.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  final name =TextEditingController();
  final phoneNumber = TextEditingController();
  final CNICNumber = TextEditingController();
  final Category = TextEditingController();
  final Description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entry'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder()
                ),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: phoneNumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  border: OutlineInputBorder(),
                ),
                style: Theme.of(context).textTheme.titleSmall,

              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: CNICNumber,
                maxLength: 13,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "CNIC Number",
                    border: OutlineInputBorder()
                ),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: Category,
                decoration: InputDecoration(
                    hintText: "Category",
                    border: OutlineInputBorder()
                ),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: Description,
                decoration: InputDecoration(
                    hintText: "Description",
                    border: OutlineInputBorder()
                ),
                maxLines: 6,
                style: Theme.of(context).textTheme.titleSmall,

              ),
              SizedBox(
                height: 30,
              ),
              ChangeNotifierProvider(
                create: (_) => updataData(),
                child: Consumer<updataData>(
                    builder: (context,provider,child){
                      return CustomButton(
                          title: "Add",
                          loading: provider.loading,
                          onTap: (){
                            provider.AddIndustryData(
                              context,
                              name.text,
                              phoneNumber.text,
                              CNICNumber.text,
                              Category.text,
                              Description.text,
                            );
                            name.clear();
                            phoneNumber.clear();
                            CNICNumber.clear();
                            Category.clear();
                            Description.clear();
                          }
                      );

                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
