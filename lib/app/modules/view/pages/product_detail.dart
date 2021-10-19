import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/core/light_color.dart';
import 'package:pazar_iraq/app/model/product.dart';
import 'package:pazar_iraq/app/model/productdetail.dart';
import 'package:pazar_iraq/app/modules/controller/chatmeesage_controller.dart';
import 'package:pazar_iraq/app/modules/controller/favoriteproduct_controller.dart';
import 'package:pazar_iraq/app/modules/controller/productdetail_controller.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:pazar_iraq/app/modules/view/pages/chatdetailpage.dart';
import 'package:pazar_iraq/app/modules/view/widgets/commint_widget/comments_list.dart';
import 'package:pazar_iraq/app/modules/view/widgets/title_text.dart';


class ProductDetailPage extends StatefulWidget {
   //Product? product;
  ProductDetailPage({Key? key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  static ProductDetailController _productDetailController = Get.put(ProductDetailController());
  final ChatMessageController chatMessageController = Get.put(ChatMessageController());
  final FavoriteProductController _favoriteProductController = Get.put(FavoriteProductController());






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


  Widget _appBar() {
    return Container(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const BackButton(),
        Obx((){
      if (_productDetailController.isLoading.value) {
        return Center(child: const CircularProgressIndicator());
      } else {
        return _icon(
            _productDetailController.isfavorite.value? Icons
                .favorite : Icons.favorite_border,
            color: _productDetailController.isfavorite.value!
                ? LightColor.red
                : LightColor.lightGrey,
            size: 15,
            padding: 12,
            isOutLine: false,
            onPressed: () {
              if(_productDetailController.isfavorite.value!){
                _productDetailController.deleteFromFavorite(_productDetailController.productDetailData!.value!.id);
                _productDetailController.isfavorite.value =false;

              }


              else{

              _favoriteProductController.addToFavorite(ProductData(
                id: _productDetailController.productDetailData!.value!.id,
                name: _productDetailController.productDetailData!.value!.name,
                price: _productDetailController.productDetailData!.value!.price,
                userId: _productDetailController.productDetailData!.value!.userId,
                categoryId: _productDetailController.productDetailData!.value!
                    .categoryId,
                productType: _productDetailController.productDetailData!.value!
                    .productType,
                storeId: null,
                createdAt: null,
                updatedAt: null,
                isFeatured: null,
                images: [
                  Imagee(
                      originalUrl:
                      _productDetailController.productDetailData!.value!.images!.first
                          .originalUrl)
                ],
                des: _productDetailController.productDetailData!.value!.desc,
              ));
              _productDetailController.isfavorite.value=true;
            }});

        }})],
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
            ///_productDetailController.productDetailData!=null?
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
      items: _productDetailController.productDetailData!.value!.images!.map((item) =>
    Container(
    child: ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
    child:

     Image.network(item.originalUrl!, fit: BoxFit.fill,)
    ),
    ))
        .toList(),
      )]);}})
              // :  Image.network("https://th.bing.com/th/id/OIP.hV6MoBaE8NYeMCugmhd7_QHaEo?pid=ImgDet&rs=1")

        ),

    );
  }
/////detailwidget
  Widget _detailWidget() {
    int endTime = DateTime.parse("2021-10-17 02:15:00").millisecondsSinceEpoch-5721000 ;
    return DraggableScrollableSheet(
     /// maxChildSize: .8,
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
        Visibility(
          visible: true,

          child: Padding(
          padding:  EdgeInsets.fromLTRB(0.0,20,0.0,8.0),
          child: Row(

          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  width: deviceWidth/2 +1,
                height: 60,
                decoration:  const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),

                    color: Color(0xFF7200CA) ),
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
                  children: const[
                     TitleText(
                      text: "Minimum increment",
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    SizedBox(height:10),
                  TitleText(
                 text: "\$ 2000 ",
                 fontSize: 12,
                 color:  Colors.white,
                  ),],
          ),
           ))
              ),
            Expanded(
              flex: 2,
              child: Container(
                    height: 60,
                  width: deviceWidth/2 +1,

                    decoration:  const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        color: Colors.white ),
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               children: const [  TitleText(
                 text: "Starting price ",
                 fontSize: 12,
                 color: Colors.black,
               ),
                 SizedBox(height:10),
                 TitleText(
                   text: "\$ 10000 ",
                   fontSize: 12,
                   color:  Color(0xFF7200CA),
                 ),],
             ),
           )
          ),
              ),
          ])),
        ),

                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 100,
                  decoration:  const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    color: Colors.white ),
                  child: Padding(
                    padding:  EdgeInsets.fromLTRB(8.0,20,8.0,8.0),
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _productDetailController.productDetailData!=null?
                    Obx(() {
                       if (_productDetailController.isLoading.value) {
                         return const Center(child: CircularProgressIndicator());
                       } else {
                         return TitleText
                        (text:_productDetailController.productDetailData!.value!.name, fontSize: 15);
                       }}):Text("problem"),
                        Visibility(
                          visible:true,
                          child: Row(
                              children:  [
                                Icon(Icons.alarm,size:15),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child:
                                   CountdownTimer(
                                    endTime: endTime,
                                  ),

                                ),
                              ]
                          ),
                        ),
                        //productController.productData!.name
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const TitleText(
                                  text: "\$ ",
                                  fontSize: 15,
                                  color: Color(0xFFF75672),
                                ),
                                _productDetailController.productDetailData!=null?
                                Obx(() {
                                  if (_productDetailController.isLoading.value) {
                                    return Center(child: const CircularProgressIndicator());
                                  } else {
                                    return  TitleText(
                                      text: _productDetailController.productDetailData!.value!.price.toString(),

                                      fontSize: 15,
                                    );
                                  }}):
                                    Text("hellow")

                              ],
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 40,
                ),
                _productDetailController.productDetailData!=null?
        Obx(() {
        if (_productDetailController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
        } else {
        return
          Container(

            decoration:  const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),

                color: Colors.white ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.5,
                ),
                itemCount: _productDetailController.productDetailData!.value!.atts!.length,//
                physics: const BouncingScrollPhysics(),
// _productDetailController.productDetailData!.attributes!.length,
            itemBuilder: (context,index){
            return _availableAttribute(attributee: _productDetailController.productDetailData!.value!.atts![index]);


            },),
          ),
        );
        }}):Text("problem"),

                const SizedBox(
                  height: 40,
                ),

                _description(),
                const SizedBox(
                  height: 40,
                ),
                /////button for Auction
                MaterialButton(
                  onPressed: () {

                  },
                  height: 50,
                  elevation: 0,
                  splashColor: Color(0xFFF75672),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  color: Color(0xFF7200CA),
                  child: const Center(
                    child: Text("Increase ", style: TextStyle(color: Colors.white, fontSize: 18),),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CommentsList(),
                _addcomment(),

              ],
            ),
          ),
        );
      },
    );
  }

///// availableAttribute
  Widget _availableAttribute( {Att? attributee}) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
               TitleText(text:attributee!.name,fontSize: 15,),
                const SizedBox(height:20),
                TitleText(text:attributee.value,fontSize: 12,color: Color(0xFFF75672),),
              ]);

  }



  //// description widget
  Widget _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  <Widget>[

        const TitleText(
          text: "Description",
          fontSize: 15,
        ),
        const SizedBox(height: 20),
           Obx(() {
          if (_productDetailController.isLoading.value) {
            return Center(child: const CircularProgressIndicator());
          } else {
            return   Container(

                decoration:  const BoxDecoration(
                    color: Colors.white ,
                borderRadius: BorderRadius.all(
                Radius.circular(20),
                )),child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_productDetailController.productDetailData!.value!.desc!),
                ));
          }})

      ],
    );
  }
  Widget _addcomment() {
    return Center(
      child: Padding(
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
          itemSize: 40,
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
            SizedBox(height: 20,),
          Obx(() {
            return Container(
              width: deviceWidth/2,
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
      ),
    );
  }
  //// widget for CarouselSliderDetails


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
        floatingActionButton:
       Obx((){
    if (_productDetailController.isLoading.value) {
    return Center(child: const CircularProgressIndicator());
    } else {
    return

    _productDetailController.productDetailData!.value!.userId==user_id.toString()?FloatingActionButton(
    // isExtended: true,
    heroTag: "btn1",
    child: Icon(Icons.chat),
    backgroundColor: Color(0xFF7200CA),

    onPressed: () {
    chatMessageController.chat_id.value="";
    chatMessageController.getfetchChatMessage(sender_id:user_id,reciver_id:int.parse(_productDetailController.productDetailData!.value!.userId!));
    Navigator.push(context, MaterialPageRoute(builder: (context){
    return ChatDetailPage(reciverName:_productDetailController.productDetailData!.value!.name!,reciverId:_productDetailController.productDetailData!.value!.userId ,);
    },
    ),
    );
    //   showAddAuctionModal();
    }):
    FloatingActionButton(
    // isExtended: true,
    heroTag: "btn2",
    child: Icon(Icons.add),
    backgroundColor: Color(0xFF7200CA),

    onPressed: () {

    showAddAuctionModal();
    });
    }})
    );

  }
  showAddAuctionModal() {
    final format = DateFormat("yyyy-MM-dd HH:mm");

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      builder: (context) {
        return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                height: deviceHeight,
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  shrinkWrap: true,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Auction Option', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                        MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          minWidth: 40,
                          height: 40,
                          color: Colors.grey.shade300,
                          elevation: 0,
                          padding: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Icon(Icons.close, color: Colors.black,),
                        )
                      ],
                    ),
                    ///////select start date
                    const SizedBox(height: 20,),
                    Text('Auction start  date ', style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w300),),
                    const SizedBox(height: 20,),

                    Column(children: <Widget>[
                  DateTimeField(
                    format: format,
                    decoration:  const InputDecoration(

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7200CA), width: 2.0),
                      ),
                      hintText: 'select start date',
                    ),

                    onShowPicker: (context, currentValue) async {
                      final date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        final time = await showTimePicker(
                          context: context,
                          initialTime:
                          TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                        );
                        _productDetailController.startDate.value=DateTimeField.combine(date, time).millisecondsSinceEpoch.toString();
                        print(DateTimeField.combine(date, time).millisecondsSinceEpoch);
                        return DateTimeField.combine(date, time);
                      } else {

                        return currentValue;
                      }
                    },
                  ),
                ]),

                    //////select end date

                    // Text("Color", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    const SizedBox(height: 20,),
                    const Text('Auction end  date ', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w300),),
                    const SizedBox(height: 20,),

                    Column(children: <Widget>[
                      DateTimeField(
                        format: format,
                        decoration:  const InputDecoration(

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF7200CA), width: 2.0),
                          ),
                          hintText: 'select end date',
                        ),

                        onShowPicker: (context, currentValue) async {
                          final date = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                          if (date != null) {
                            final time = await showTimePicker(
                              context: context,
                              initialTime:
                              TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                            );
                            _productDetailController.endDate.value=DateTimeField.combine(date, time).millisecondsSinceEpoch.toString();
                            print(DateTimeField.combine(date, time).millisecondsSinceEpoch.toString());

                            return DateTimeField.combine(date, time);
                          } else {

                            return currentValue;
                          }
                        },
                      ),
                    ]),

                    // Slider start  Price
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('start price', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w300),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Obx(() => Text('\$ ${_productDetailController.startPriceSliderValue.value.toStringAsFixed(2)}', style: TextStyle(color: Colors.grey.shade500, fontSize: 12),),
                            ) ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                Obx(() =>Slider(
                        max: 1000000.00,
                        divisions: 10000,
                        inactiveColor: Colors.grey.shade300,
                        activeColor: const Color(0xFF7200CA),
                        value: _productDetailController.startPriceSliderValue.value,
                      label: _productDetailController.startPriceSliderValue.round().toString(),
                        onChanged: (double value) {
                        _productDetailController.startPriceSliderValue.value = value;

                    },

                )),
                    /// slider Bid price
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Minimum increment', style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w300),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Obx(() =>Text('\$ ${_productDetailController.bidPriceSliderValue.toStringAsFixed(2)}', style: TextStyle(color: Colors.grey.shade500, fontSize: 12),),)
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
              Obx(() =>Slider(
                      max: 1000000.00,
                      divisions: 10000,
                      inactiveColor: Colors.grey.shade300,
                      activeColor: const Color(0xFF7200CA),
                      value:_productDetailController.bidPriceSliderValue.value,
                      label: _productDetailController.bidPriceSliderValue.round().toString(),
                      onChanged: (double value) {

                          _productDetailController.bidPriceSliderValue.value = value;

                      },

              ) ),
                    const SizedBox(height: 20,),
                    MaterialButton(
                      onPressed: () {
                        _productDetailController.addAuction(_productDetailController.productDetailData!.value!.id!);
                      },
                      height: 50,
                      elevation: 0,
                      splashColor: const Color(0xFFF75672),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      color: Color(0xFF7200CA),
                      child: const Center(
                        child: Text("Add ", style: TextStyle(color: Colors.white, fontSize: 18),),
                      ),
                    ),
                  ],
                ),
              );
            }
        );
      },
    );
  }
}
