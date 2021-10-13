import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/core/light_color.dart';
import 'package:pazar_iraq/app/model/productdetail.dart';
import 'package:pazar_iraq/app/modules/controller/chatmeesage_controller.dart';
import 'package:pazar_iraq/app/modules/controller/productdetail_controller.dart';
import 'package:pazar_iraq/app/modules/view/pages/chatdetailpage.dart';
import 'package:pazar_iraq/app/modules/view/widgets/commint_widget/comments_list.dart';
import 'package:pazar_iraq/app/modules/view/widgets/title_text.dart';




///image for CarouselSlider
final List<String> exampleImage = [
  'assets/shoe_tilt_2.png',
  'assets/shoe_tilt_2.png',
  'assets/shoe_tilt_2.png',
  'assets/shoe_tilt_2.png',
  'assets/shoe_tilt_2.png'
];


class ProductDetailPage extends StatefulWidget {
   //Product? product;
  ProductDetailPage({Key? key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  static ProductDetailController _productDetailController = Get.find();
  final ChatMessageController chatMessageController = Get.put(ChatMessageController());


  AnimationController? controller;
  Animation<double>? animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller!, curve: Curves.easeInToLinear));
    controller!.forward();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  bool isLiked = true;
  Widget _appBar() {
    return Container(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const BackButton(),
          _icon(isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? LightColor.red : LightColor.lightGrey,
              size: 15,
              padding: 12,
              isOutLine: false, onPressed: () {
            setState(() {
              isLiked = !isLiked;
            });
          }),
        ],
      ),
    );
  }
///// favorite icon
  Widget _icon(
    IconData icon, {
    Color color = LightColor.iconColor,
    double size = 20,
    double padding = 10,
    bool isOutLine = false,
    Function? onPressed,
  }) {
    return InkWell(
      child: Container(
        height: 40,
        width: 40,
        padding: EdgeInsets.all(padding),
        // margin: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          border: Border.all(
              color: LightColor.iconColor,
              style: isOutLine ? BorderStyle.solid : BorderStyle.none),
          borderRadius: BorderRadius.all(Radius.circular(13)),
          color:
              isOutLine ? Colors.transparent : Theme.of(context).backgroundColor,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Color(0xfff8f8f8),
                blurRadius: 5,
                spreadRadius: 10,
                offset: Offset(5, 5)),
          ],
        ),
        child: Icon(icon, color: color, size: size),
      ),
      onTap: (){if
      (onPressed != null) {
        onPressed();
      }},
    );
  }
//// productImage
  Widget _productImage() {
    return Expanded(
      child: AnimatedBuilder(
        builder: (context, child) {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: animation!.value,
            child: child,
          );
        },
        animation: animation!,
        child:
            Obx((){
    if (_productDetailController.isLoading.value) {
    return Center(child: const CircularProgressIndicator());
    } else {
        return Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[

       CarouselSlider(
      options: CarouselOptions(
      aspectRatio: 2.0,
      enlargeCenterPage: true,
      autoPlay: false,
      ),
      items: _productDetailController.productDetailData!.images!.map((item) =>
    Container(
    child: ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
    child:

     Image.network(item.originalUrl!, fit: BoxFit.fill,)
    ),
    ))
        .toList(),
      )]);}})

            // Image.asset(widget.product!.image!)

        ),

    );
  }
/////detailwidget
  Widget _detailWidget() {
    return DraggableScrollableSheet(
      maxChildSize: .8,
      initialChildSize: .53,
      minChildSize: .1,
      builder: (context, scrollController) {
        return Container(
          padding: padding.copyWith(bottom: 0),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: const BoxDecoration(
                        color: LightColor.iconColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                Obx(() {
                   if (_productDetailController.isLoading.value) {
                     return Center(child: const CircularProgressIndicator());
                   } else {
                     return TitleText
                    (text:_productDetailController.productDetailData!.name, fontSize: 25);
                   }}),
                    //productController.productData!.name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const TitleText(
                              text: "\$ ",
                              fontSize: 18,
                              color: LightColor.red,
                            ),
                            Obx(() {
                              if (_productDetailController.isLoading.value) {
                                return Center(child: const CircularProgressIndicator());
                              } else {
                                return  TitleText(
                                  text: _productDetailController.productDetailData!.price.toString(),

                                  fontSize: 25,
                                );
                              }})

                          ],
                        ),
                        // Obx(() {
                        //   if (productDetailController.isLoading.value) {
                        //     return Center(child: const CircularProgressIndicator());
                        //   } else {
                        //     return  RatingBarIndicator(
                        //       rating: 2.75,
                        //       itemBuilder: (context, index) => Icon(
                        //         Icons.star,
                        //         color: Colors.amber,
                        //       ),
                        //       itemCount: 5,
                        //       itemSize: 20.0,
                        //       direction: Axis.horizontal,
                        //     );
                        //   }})

                        // Row(
                        //   children: const <Widget>[
                        //     Icon(Icons.star,
                        //         color: LightColor.yellowColor, size: 17),
                        //     Icon(Icons.star,
                        //         color: LightColor.yellowColor, size: 17),
                        //     Icon(Icons.star,
                        //         color: LightColor.yellowColor, size: 17),
                        //     Icon(Icons.star,
                        //         color: LightColor.yellowColor, size: 17),
                        //     Icon(Icons.star_border, size: 17),
                        //   ],
                        // ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ///_availableSize(),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
        Obx(() {
        if (_productDetailController.isLoading.value) {
        return Center(child: const CircularProgressIndicator());
        } else {
        return
        ListView.builder(
            shrinkWrap: true,
            itemCount: _productDetailController.productDetailData!.attributes!.length,//
            physics: const BouncingScrollPhysics(),
// _productDetailController.productDetailData!.attributes!.length,
        itemBuilder: (context,index){
        return _availableColor(attributee: _productDetailController.productDetailData!.attributes![index]);


        });
        }}),

                const SizedBox(
                  height: 20,
                ),
        // Obx(() {
        // if (_productDetailController.isLoading.value) {
        // return Center(child: const CircularProgressIndicator());
        // } else {
        // return
        // ListView.builder(
        // itemCount: _productDetailController.productDetailData!.attributes!.length,
        // itemBuilder: (context,index) {
        //   return _availableColor(attributee:_productDetailController.productDetailData!.attributes![index]);
        //
        // });}}),
                _description(),
                CommentsList(),
               // _addcomment(),

              ],
            ),
          ),
        );
      },
    );
  }
////// widget for availableSize size
  Widget _availableSize() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const TitleText(
          text: "Available Size",
          fontSize: 14,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _sizeWidget("US 6"),
            _sizeWidget("US 7", isSelected: true),
            _sizeWidget("US 8"),
            _sizeWidget("US 9"),
          ],
        )
      ],
    );
  }
///// widget for size design
  Widget _sizeWidget(String text, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
            color: LightColor.iconColor,
            style: !isSelected ? BorderStyle.solid : BorderStyle.none),
        borderRadius: BorderRadius.all(const Radius.circular(13)),
        color:
            isSelected ? LightColor.orange : Theme.of(context).backgroundColor,
      ),
      child: TitleText(
        text: text,
        fontSize: 16,
        color: isSelected ? LightColor.background : LightColor.titleTextColor,
      ),
    );
  }
///// widget for color available
  Widget _availableColor( {Attribute? attributee}) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
               TitleText(text:attributee!.name,fontSize: 20,),
                SizedBox(width: 100,),
                TitleText(text:attributee.value,fontSize: 15,color: Colors.red,),
                SizedBox(height: 50,)
              ]);







  }

//// widget for clor design
  Widget _colorWidget(Color color, {bool isSelected = false}) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: color.withAlpha(150),
      child: isSelected
          ? Icon(
              Icons.check_circle,
              color: color,
              size: 18,
            )
          : CircleAvatar(radius: 7, backgroundColor: color),
    );
  }

  //// description widget
  Widget _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  <Widget>[

        const TitleText(
          text: "Description",
          fontSize: 20,
        ),
        const SizedBox(height: 20),
           Obx(() {
          if (_productDetailController.isLoading.value) {
            return Center(child: const CircularProgressIndicator());
          } else {
            return  Text(_productDetailController.productDetailData!.des!);
          }})

      ],
    );
  }
  Widget _addcomment() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: <Widget>[

      RatingBar.builder(
      initialRating: 3,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: 20,
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          _productDetailController.rating=rating ;
          print(rating);

        },

      ),
          SizedBox(height: 15,),

           Row(
            children: <Widget>[
              SizedBox(width: 15,),
              Expanded(
                child: TextFormField(
                   controller: _productDetailController.commentController,
                  decoration: const InputDecoration(
                      hintText: "Write Comment...",
                      hintStyle: TextStyle(color: Colors.black54),
                      border: InputBorder.none
                  ),
                  onSaved: (text) {
                    _productDetailController.comment.value=text!;

                  },
                ),
              ),
              SizedBox(width: 15,),
              Container(
                height: 20,
                width: 20,
                child: FloatingActionButton(
                  onPressed: (){
                    _productDetailController.addcomment();
                  },
                  child: Icon(Icons.send,color: Colors.white,size: 10,),
                  backgroundColor: Colors.blue,

                  elevation: 0,
                ),
              ),
            ],

          ),
          const SizedBox(height: 20),
          // Text( widget.product!.category.toString()),
        ],
      ),
    );
  }
  //// widget for CarouselSliderDetails
  final List<Widget>
  CarouselSliderDetails = exampleImage
      .map((item) =>
      Container(
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Obx(() {
            if (_productDetailController.isLoading.value) {
            return Center(child: const CircularProgressIndicator());
            } else {

                          return Image.network(_productDetailController.productDetailData!.images!.first.originalUrl!, fit: BoxFit.fill,);}
            })),
      ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xfffbfbfb),
              Color(0xfff7f7f7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Stack(
            children: <Widget>[
              Column(

                children: <Widget>[

                  _appBar(),
                  _productImage(),

                  // _categoryWidget(),
                ],
              ),
              _detailWidget(),
            ],
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
          // isExtended: true,
          child: Icon(Icons.chat),
          backgroundColor: Color(0xfffbb448),
          onPressed: () {
    chatMessageController.getfetchChatMessage(sender_id:3,reciver_id:2 );
    Navigator.push(context, MaterialPageRoute(builder: (context){
    return ChatDetailPage(reciverName:_productDetailController.productDetailData!.name!,reciverId:_productDetailController.productDetailData!.userId ,);
    },
    ),
    );
     }))
    ;

  }
}
