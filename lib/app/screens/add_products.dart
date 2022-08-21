import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:my_souq/app/widgets/custom_button.dart';
import 'package:my_souq/app/widgets/custom_text.dart';
import 'package:my_souq/components/declarations.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  static const String routeName = '/addProduct';

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController qtyController = TextEditingController();

  String category = 'Mobiles';

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    qtyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: Declarations.appBarGradient
          ),
        ),
        title: const Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child:Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [10, 4],
                    strokeCap: StrokeCap.round,
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.folder_open,
                            size: 40
                          ),
                          const SizedBox(height: 15,),
                          Text(
                            'Select Product Image',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade400
                            ),
                          ),
                        ],
                      ),
                    )
                ),
                const SizedBox(height: 20,),
                CustomText(controller: productNameController, hinTxt: 'product name'),
                const SizedBox(height: 10,),
                CustomText(controller: descriptionController, hinTxt: 'description', maxLines: 4,),
                const SizedBox(height: 10,),
                CustomText(controller: priceController, hinTxt: 'price'),
                const SizedBox(height: 10,),
                CustomText(controller: qtyController, hinTxt: 'qty'),
                const SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: Declarations.catImages.map((e) {
                      return DropdownMenuItem(
                          value: e['title']!,
                          child: Text(e['title']!),
                      );
                    }).toList(),
                    onChanged: (String? val) {
                      setState(() {
                        category = val!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10,),
                CustomButton(
                    text: "Save",
                    onTap: () {}
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ) ,
      ),
    );
  }
}
