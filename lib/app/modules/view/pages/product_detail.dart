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
          decoration:  const BoxDecoration(

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
        color: Color(0xffE1E2E4)),
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
                Container(
                  height: 100,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),

                    color: Colors.white ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0,20,8.0,8.0),
                    child: Row(

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
                  ),
                ),

                ///_availableSize(),
                const SizedBox(
                  height: 40,
                ),

        Obx(() {
        if (_productDetailController.isLoading.value) {
        return Center(child: const CircularProgressIndicator());
        } else {
        return
          Container(

            decoration:  BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),

                color: Colors.white ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: _productDetailController.productDetailData!.atts!.length,//
                physics: const BouncingScrollPhysics(),
// _productDetailController.productDetailData!.attributes!.length,
            itemBuilder: (context,index){
            return _availableAttribute(attributee: _productDetailController.productDetailData!.atts![index]);


            }),
          ),
        );
        }}),

                const SizedBox(
                  height: 40,
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
                _addcomment(),

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
  Widget _availableAttribute( {Att? attributee}) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
               TitleText(text:attributee!.name,fontSize: 20,),
               Spacer(),
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
            return   Container(

                decoration:  BoxDecoration(
                    color: Colors.white ,
                borderRadius: BorderRadius.all(
                Radius.circular(20),
                )),child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_productDetailController.productDetailData!.desc!),
                ));
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
      initialRating: 2,
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
          _productDetailController.commentVisabilte.value=true;
          print(_productDetailController.commentVisabilte.value);
          _productDetailController.rating=rating ;
          print(rating);

        },

      ),
          SizedBox(height: 15,),
        Obx(() {
          return Container(
            width: 200,
            child: Visibility(
               visible:_productDetailController.commentVisabilte.value,
               child: Row(
                children: <Widget>[
                  SizedBox(width: 15,),
                  Expanded(
                    child: TextFormField(

                      autovalidateMode: AutovalidateMode.onUserInteraction,
                       controller: _productDetailController.commentController,
                      validator: (v){
                         return _productDetailController.validateComment(v!);
                      }
                      ,
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
                  ///SizedBox(width: 10,),
                  Container(
                    height: 20,
                    width: 20,
                    child: FloatingActionButton(
                      onPressed: (){
                        _productDetailController.addcomment();
                        _productDetailController.commentController.clear();
                        _productDetailController.commentVisabilte.value=false;
                      },
                      child: Icon(Icons.send,color: Colors.white,size: 10,),
                      backgroundColor: Colors.blue,

                      elevation: 0,
                    ),
                  ),
                ],

            ),
             ),
          );}),
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
            heroTag: "btn1",
          child: Icon(Icons.chat),
          backgroundColor: Color(0xFF7200CA),

          onPressed: () {
            chatMessageController.chat_id.value="";
    chatMessageController.getfetchChatMessage(sender_id:2,reciver_id:int.parse(_productDetailController.productDetailData!.userId!));
    Navigator.push(context, MaterialPageRoute(builder: (context){
    return ChatDetailPage(reciverName:_productDetailController.productDetailData!.name!,reciverId:_productDetailController.productDetailData!.userId ,);
    },
    ),
    );
     }))
    ;

  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:pazar_iraq/app/core/constants.dart';
// import 'package:pazar_iraq/app/data/provider/api_provider/product_provider.dart';
// import 'package:pazar_iraq/app/model/category.dart';
// import 'package:pazar_iraq/app/model/product.dart';
// import 'package:pazar_iraq/app/modules/controller/product_controller.dart';
// import 'package:pazar_iraq/app/modules/controller/productpage_controller.dart';
// import 'package:pazar_iraq/app/modules/view/widgets/categorycard.dart';
// import 'package:pazar_iraq/app/modules/view/widgets/productcard.dart';
// import 'package:pazar_iraq/app/modules/view/widgets/title_text.dart';
//
//
// class ProductPage extends StatefulWidget {
//
//   final CategoryElement? categoryElemen;
//
//   ProductPage({Key? key, this.categoryElemen}) : super(key: key);
//   @override
//   _ProductPageState createState() => _ProductPageState();
// }
// class _ProductPageState extends State<ProductPage> {
//   static const _pageSize = 6;
//
//   final PagingController<int, ProductData> _pagingController =
//   PagingController(firstPageKey: 0);
//   final ProductPageController productPageController = Get.put(ProductPageController());
//
//   @override
//   void initState() {
//     _pagingController.addPageRequestListener((pageKey) {
//       _fetchPage(pageKey); });
//     super.initState();
//   }
//   Future<void> _fetchPage(int pageKey) async {
//     try {
//       final newItems = await ProductProvider.fetchProductsByCategoryId(
//         pageKey, widget.categoryElemen!.id,);
//       if (newItems != null) {
//
//         final isLastPage = newItems.productData!.length! < _pageSize;
//         if (isLastPage) {
//           _pagingController.appendLastPage(newItems.productData!);
//         } else {
//           final nextPageKey = pageKey + 1;
//           _pagingController.appendPage(newItems.productData!, nextPageKey);
//         }}
//     } catch (error) {
//       _pagingController.error = error;
//     }
//   }
//   @override
//   void dispose() {
//     _pagingController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     // var conntroller;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: const Color(0xffFCFCFC),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         leading:BackButton(),
//         centerTitle: true,
//         title:   TitleText(
//           text:widget.categoryElemen!.name,
//           fontSize: 30,
//         ),
//
//       ),
//       body: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).unfocus();
//         },
//         child: ListView(
//           // controller: conntroller,
//           physics: BouncingScrollPhysics(),
//           children: [
//             Container(
//               height: deviceHeight / 3 + 50,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   // MySearch(),
//                   Expanded(
//                     child: Container(
//                       margin: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20.0),
//                           image:  DecorationImage(
//                             fit: BoxFit.cover,
//                             image: NetworkImage(
//                                 widget.categoryElemen!.imageUrl!, scale: 1.0
//                             ),
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color(0xff37475A).withOpacity(0.2),
//                               blurRadius: 20.0,
//                               offset: const Offset(0, 10),
//                             )
//                           ]),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//
//             // Obx(() {
//             //   if (productPageController.isLoading.value)
//             //     return Center(child: CircularProgressIndicator());
//             //   else {
//             //     return
//             PagedGridView<int, ProductData>(
//                 shrinkWrap: true,
//                 showNewPageProgressIndicatorAsGridChild: false,
//                 showNewPageErrorIndicatorAsGridChild: false,
//                 showNoMoreItemsIndicatorAsGridChild: false,
//                 pagingController: _pagingController,
//
//                 ///itemCount: productPageController.categoryproductList.length,
//                 physics: const BouncingScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//
//                   crossAxisCount: 1,
//                   mainAxisSpacing: 10.0,
//                   crossAxisSpacing: 10.0,
//                   childAspectRatio: 0.8,
//                 ),
//
//                 // itemBuilder: (context, index) {
//                 //
//                 //   if(index == productPageController.categoryproductList.length-1&&
//                 //       productPageController.isMoreDataAvilable.value==true){
//                 //     productPageController.paginateTask();
//                 //     print("bnnnnnnnnnnnnn");
//                 //     return Center(child: CircularProgressIndicator());}
//                 builderDelegate: PagedChildBuilderDelegate<ProductData>(
//                     itemBuilder: (context, item, index) =>
//                     ///ProductData productCard = productPageController.categoryproductList[index] ;
//                     Text(item.name!)
//                   //  ProductCard(
//                   //   product: item,
//                   //   // onSelected: (model) {
//                   //   //   setState(() {
//                   //   //     AppData.productList.forEach((item) {
//                   //   //       item.isSelected = false;
//                   //   //     });
//                   //   //     model.isSelected = true;
//                   //   //   });
//                   //   // },
//                   // ))
//                   //     );
//                   // }})
//                 )
//             )],
//         ),
//       ),
//     );
//   }
// }
