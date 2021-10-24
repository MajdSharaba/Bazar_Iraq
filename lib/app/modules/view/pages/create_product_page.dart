import 'dart:ui';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:pazar_iraq/app/core/languages/locale_keys.g.dart';
import 'package:pazar_iraq/app/modules/view/widgets/slidertheme.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/model/category.dart';
import 'package:pazar_iraq/app/model/option.dart';
import 'package:pazar_iraq/app/modules/controller/auth_controller.dart';
import 'package:pazar_iraq/app/modules/controller/categories_controller.dart';
import 'package:pazar_iraq/app/modules/controller/create_product_controller.dart';
import 'package:pazar_iraq/app/modules/view/widgets/buttonwidget.dart';
import 'package:pazar_iraq/app/modules/view/widgets/fieldwidget.dart';

class CreateProductAttributePage extends StatefulWidget {
  @override
  State<CreateProductAttributePage> createState() => _CreateProductAttributePageState();
}

class _CreateProductAttributePageState extends State<CreateProductAttributePage> {
  final CategoryController categoryController = Get.find();
  final CreateProductController createProductController =
      Get.put(CreateProductController());
  final AuthController authController = Get.find();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  CategoryElement? selectedCategory;
  List attributesIds = [];
  List attributesValues = [];
  List<XFile>? images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(flip: true),
            child: Container(
              height: 150,
              decoration: BoxDecoration(gradient: linearGradientColor),
              child:  Center(
                  child: Text(
                      LocaleKeys.createProduct.translations(),
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
            ),
          ),
          //  categoryDropDwon(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: FieldWidget(
              title: LocaleKeys.name.translations(),
              controller: nameController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27.0, vertical: 10),
            child: FieldWidget(
              title: LocaleKeys.price.translations(),
              controller: priceController,
              keyboardType: TextInputType.number,
            ),
          ),
          GetBuilder<CreateProductController>(
              init: createProductController,
              builder: (controller) {
                return controller.attributes.isEmpty
                    ? Container()
                    : Expanded(
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          // to disable GridView's scrolling
                          shrinkWrap: true,
                          itemCount: controller.attributes.value.length,
                          itemBuilder: (context, index) {
                            return controller.attributes.value[index].typeId ==
                                    "1"
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 27.0, vertical: 10),
                                    child: InkWell(
                                        onTap: () {
                                          bottomSheet(controller
                                              .attributes.value[index].options!);
                                        },
                                        child: Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFCCCCCC)
                                                .withOpacity(0.05),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            border: Border.all(
                                                color: const Color(0xFFCCCCCC),
                                                width: 1),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 16.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Obx(() {
                                                  return Text(
                                                    createProductController
                                                                    .variables[
                                                                index] !=
                                                            null
                                                        ? createProductController
                                                            .variables[index]
                                                            .value
                                                        : controller.attributes
                                                            .value[index].name!,
                                                    style: const TextStyle(
                                                        fontSize: 16),
                                                  );
                                                })
                                              ],
                                            ),
                                          ),
                                        )),
                                  )
                                : Obx(() {
                                   int indexOfDuplicatedOption =
                                        attributesIds.indexOf(createProductController.attributes[index].id);
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 27.0, vertical: 10),
                                      child: SliderTheme(
                                          data: SliderThemeData(
                                            trackShape:
                                                GradientRectSliderTrackShape(
                                                    gradient: linearGradientColor,
                                                    darkenInactive: false),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(createProductController
                                                  .attributes[index].min!.toString()),
                                              Expanded(
                                                child: Slider(
                                                  min: createProductController
                                                      .attributes[index].min!,
                                                  max: createProductController
                                                      .attributes[index].max!,
                                                    onChangeEnd: (double value) {
                                                    if (indexOfDuplicatedOption == -1) {
                                                      attributesIds.add(controller
                                                          .attributes.value[index].id);
                                                      attributesValues.add(value);
                                                    } else {
                                                      attributesValues[
                                                              indexOfDuplicatedOption] =
                                                          value;
                                                    }
                                                    setState(() {
                                                    });
                                                  },
                                                  value: indexOfDuplicatedOption == -1
                                                      ? createProductController
                                                          .attributes[index].min
                                                      : attributesValues[
                                                          indexOfDuplicatedOption], onChanged: (double value) {  },
                                                ),
                                              ),
                                              Text(createProductController
                                                  .attributes[index].max!.toString()),
                                            ],
                                          )),
                                    );
                                  });
                          }),
                    );
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27.0, vertical: 10),
            child: FieldWidget(
              title: LocaleKeys.description.translations(),
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              controller: descriptionController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27.0, vertical: 10),
            child: ButtonWidget(
                title: LocaleKeys.pickImages.translations(),
                function: () async {
                  images = await createProductController.getImages();
                  setState(() {});
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27.0, vertical: 10),
            child: ButtonWidget(
                title: LocaleKeys.addYourAdvertisment.translations(),
                function: () async {
                  await createProductController.createProduct(
                      nameController.text,
                      categoryController.childCategoryId,
                      categoryController.parentCategoryId,
                      priceController.text,
                      attributesIds,
                      attributesValues,
                      "attribute_id",
                      "attribute_value",
                      authController.user.value.id.toString(),
                      images!,
                      descriptionController.text);
                }),
          )
        ],
      ),
    );
  }

/*
  Widget testDropDwon1(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
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
            hint: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                createProductController.attributes[index].name!,
              ),
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
            elevation: 8,
            value: createProductController.variables[index],
            onChanged: (Option? value) {
              int indexOfDuplicatedOption;
              setState(() {
                createProductController.variables[index] = value;
                indexOfDuplicatedOption =
                    attributesIds.indexOf(value!.attributeId);
                if (indexOfDuplicatedOption == -1) {
                  attributesIds.add(value.attributeId);
                  attributesValues.add(value.id);
                } else {
                  attributesIds.removeAt(indexOfDuplicatedOption);
                  attributesValues.removeAt(indexOfDuplicatedOption);
                  attributesIds.add(value.attributeId);
                  attributesValues.add(value.id);
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
                      option.value!,
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


 */
  bottomSheet(List<Option> options) {
    showModalBottomSheet(
      barrierColor: Colors.transparent,
      elevation: 8,
      constraints: BoxConstraints(maxWidth: deviceWidth - 20),
      isDismissible: true,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.indigo),
        borderRadius: BorderRadius.circular(30),
      ),
      enableDrag: false,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      int indexOfDuplicatedOption;
                      setState(() {
                        indexOfDuplicatedOption =
                            attributesIds.indexOf(options[index].attributeId);
                        if (indexOfDuplicatedOption == -1) {
                          createProductController.variables[index] =
                              options[index];
                          attributesIds.add(options[index].attributeId);
                          attributesValues.add(options[index].id);
                        } else {
                          createProductController
                                  .variables[indexOfDuplicatedOption] =
                              options[index];

                          attributesValues[indexOfDuplicatedOption] =
                              options[index].id;
                        }
                      });
                      Get.back();
                    },
                    child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFFCCCCCC).withOpacity(0.05),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: const Color(0xFFCCCCCC), width: 1),
                        ),
                        child: Center(child: Text(options[index].value!))),
                  ),
                );
              },
            ),
          ),
        );
      },
      context: context,
    );
  }
}
