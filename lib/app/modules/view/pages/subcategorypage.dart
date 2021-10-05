import 'package:flutter/material.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/core/data.dart';
import 'package:pazar_iraq/app/model/category.dart';
import 'package:pazar_iraq/app/modules/view/widgets/subcategorycard.dart';
import 'package:pazar_iraq/app/modules/view/widgets/title_text.dart';


class SubCategoryPage extends StatelessWidget {
  const SubCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var conntroller;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFCFCFC),
       appBar: AppBar(
         elevation: 0,
         backgroundColor: Colors.transparent,
         leading:BackButton(),
         centerTitle: true,
         title:  const TitleText(
           text:"Cars",
           fontSize: 30,
         ),

       ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          // controller: conntroller,
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              height: deviceHeight / 3 + 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // MySearch(),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://bellinghamautoacservice.com/wp-content/uploads/2019/10/what-is-the-cheapest-car-insurance.jpg", scale: 1.0
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff37475A).withOpacity(0.2),
                              blurRadius: 20.0,
                              offset: const Offset(0, 10),
                            )
                          ]),
                    ),
                  )
                ],
              ),
            ),

            GridView.builder(
              shrinkWrap: true,
              itemCount: AppData.subCategure.length,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                Category subCategory = AppData.subCategure[index];

                return SubCategoryCard(
                  subCategory: subCategory,
                  // onSelected: (model) {
                  //   setState(() {
                  //     AppData.productList.forEach((item) {
                  //       item.isSelected = false;
                  //     });
                  //     model.isSelected = true;
                  //   });
                  // },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
