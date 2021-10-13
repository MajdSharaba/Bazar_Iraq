import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/model/attribute.dart';
import 'package:pazar_iraq/app/model/category.dart';
import 'package:pazar_iraq/app/model/option.dart';
import 'package:pazar_iraq/app/modules/controller/categories_controller.dart';
import 'package:pazar_iraq/app/modules/controller/create_product_controller.dart';

class CreateProductPage extends StatefulWidget {
  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final CategoryController categoryController = Get.find();
  final CreateProductController createProductController =
      Get.put(CreateProductController());
  CategoryElement? selectedCategory;
   List? attributesIds=[];
   List? attributesValues=[];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(flip: false),
            child: Container(
              height: 150,
              decoration: BoxDecoration(gradient: linearGradientColor),
              child: const Center(child: Text("Create Product",style: TextStyle(fontSize: 20,color: Colors.white),)),
            ),
          ),
          testDropDwon(),
          GetBuilder<CreateProductController>(
              init: createProductController,
              builder: (controller) {
                return controller.attributes.isEmpty
                    ? Container()
                    :   ListView.builder(
                    physics:
                    const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                    shrinkWrap: true,
                    itemCount: controller.attributes.value.length,
                    itemBuilder: (context, index) {
                      return controller.attributes.value[index].typeId ==
                          "1"
                          ? testDropDwon1(index)
                          : Container();
                    });
              }) ,
        ],
      ),
    );
  }
/*
  Widget dropdownButtonCategory(List<CategoryElement> options) {
    return DropdownButton<CategoryElement>(
      //isDense: true,
      hint: Text('Choose'),

      icon: Icon(Icons.check_circle_outline),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.blue[300],
      ),
      onChanged: (CategoryElement? newValue) {
        setState(() {
          selectedCategory = newValue;
        });
      },
      items: options
          .map<DropdownMenuItem<CategoryElement>>((CategoryElement? value) {
        return DropdownMenuItem<CategoryElement>(
          value: value,
          child: Text(value!.nameEn!),
        );
      }).toList(),
    );
  }

  Widget dropdownButton(var selectedOption, int index, List options) {
    return DropdownButton(
      // value: selectedOption ?? options[0].valueEn,
      isDense: true,
      onChanged: (newValue) {
        setState(() {
          selectedOption = newValue;
          print(selectedOption.id.toString());
          createProductController.variables[index] = newValue;
        });
      },
      items: options.map((option) {
        return DropdownMenuItem(
            value: option.valueEn,
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
              height: 100.0,
              padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0.0),
              //color: primaryColor,
              child: Text(option.valueEn!),
            ));
      }).toList(),
    );
  }

  */
  Widget testDropDwon() {
    return Padding(
     padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 30),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFCCCCCC).withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFCCCCCC), width: 1),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<CategoryElement>(
            isExpanded: true,
            borderRadius: BorderRadius.circular(20),
            hint: const Text(
              "  Category",
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
            elevation: 8,
            value: selectedCategory,
            onChanged: (CategoryElement? value) {
              setState(() {
                selectedCategory = value;
                //advertisment.subCategory = value.id;
                print(selectedCategory!.id);
                createProductController.categoryId.value = value!.id!;
                createProductController.fetchAttributes();
              });
            },
            items: categoryController.categoryelement!
                .map((CategoryElement? category) {
              return DropdownMenuItem<CategoryElement>(
                value: category,
                child: Row(
                  children: <Widget>[
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      category!.name!,
                      // style: fieldsHint,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget testDropDwon1(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 30),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFCCCCCC).withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFCCCCCC), width: 1),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<Option>(
            isExpanded: true,
            borderRadius: BorderRadius.circular(20),
            hint:  Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Text(
                createProductController.attributes[index].nameEn!,
              ),
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
            elevation: 8,
            value: createProductController.variables[index],
            onChanged: (Option? value) {
              setState(() {
                createProductController.variables[index] = value;
                if(false){

                }
                else{

                }
              });
            },
            items: createProductController.attributes[index].options!
                .map((Option? option) {
              return DropdownMenuItem<Option>(
                value: option!,
                child: Row(
                  children: <Widget>[
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      option.valueEn!,
                      // style: fieldsHint,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
