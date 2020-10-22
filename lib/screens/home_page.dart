import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:manan_mobile/services/firebase_auth/auth.dart';
import 'package:manan_mobile/sized_config.dart';
import 'package:manan_mobile/models/Product.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Auth _auth = new Auth();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            HomeHeader(),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            DiscountBanner(),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            Categories(),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            SectionTitle(
              text: "Special for you",
              press: () {},
            ),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  SpecialCategoryCard(
                    image: "assets/images1.jpg",
                    category: "SmartPhone's",
                    NumofBrands: 18,
                    press: () {},
                  ),
                  SpecialCategoryCard(
                    image: "assets/images2.jpg",
                    category: "Laptop's",
                    NumofBrands: 12,
                    press: () {},
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            SectionTitle(
              text: "Popular Products",
              press: () {},
            ),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                ...List.generate(
                    demoProducts.length,
                    (index) => ProdcutCard(
                          product: demoProducts[index],
                        )),
                SizedBox(
                  width: getProportionateScreenWidth(20),
                )
              ]),
            ),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
          ],
        )),
        // body: Center(
        //   child: RaisedButton(
        //     child: (
        //         Text("Sign Out")
        //     ),
        //     onPressed: () async{
        //        await _auth.signOut();
        //     },
        //   ),
        // )
      ),
    );
  }
}

class ProdcutCard extends StatelessWidget {
  const ProdcutCard({
    Key key,
    @required this.product,
    this.width = 140,
    this.aspectRatio = 1.02,
  }) : super(key: key);
  final Product product;
  final double width, aspectRatio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: aspectRatio,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(product.images[0]),
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(36),
              child: Text(
                product.title,
                style: TextStyle(
                  color: Colors.black,
                ),
                maxLines: 2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Rs. ${product.price}",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: getProportionateScreenWidth(20)),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: getProportionateScreenWidth(28),
                    width: getProportionateScreenWidth(28),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: Icon(
                      product.isFavourite
                          ? EvaIcons.heart
                          : EvaIcons.heartOutline,
                      color: product.isFavourite
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SpecialCategoryCard extends StatelessWidget {
  const SpecialCategoryCard({
    Key key,
    @required this.category,
    @required this.image,
    @required this.NumofBrands,
    @required this.press,
  }) : super(key: key);
  final String category, image;
  final int NumofBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ])),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(15),
                      vertical: getProportionateScreenWidth(18)),
                  child: Text.rich(TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                            text: "$category\n",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(18),
                                fontWeight: FontWeight.bold)),
                        TextSpan(text: "$NumofBrands brands")
                      ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    @required this.text,
    @required this.press,
  }) : super(key: key);
  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          GestureDetector(onTap: press, child: Text("See More"))
        ],
      ),
    );
  }
}

//// building a catergories section
class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"item": Icon(EvaIcons.flashOutline), "text": "Flash\n Deal"},
      {"item": Icon(EvaIcons.bookOutline), "text": "Bill"},
      {"item": Icon(EvaIcons.activityOutline), "text": "Game"},
      {"item": Icon(EvaIcons.giftOutline), "text": "Daily\n Gift"},
      {"item": Icon(EvaIcons.moreHorizotnalOutline), "text": "More"},
    ];
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ...List.generate(
              categories.length,
              (index) => CategoryCard(
                    iconData: categories[index]["item"],
                    text: categories[index]["text"],
                    press: () {},
                  ))
        ],
      ),
    );
  }
}

//// building a categories card
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.iconData,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final Icon iconData;
  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                decoration: BoxDecoration(
                  color: Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: iconData,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              text,
              // style: TextStyle(
              //     fontSize: getProportionateScreenWidth(10)),
              // textAlign: TextAlign.center,
            )
          ],
        ),
        //
      ),
    );
  }
}

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(15)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color(0xFF4A3298)),
      child: Text.rich(TextSpan(
          text: "A Summer Surprise\n",
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(
                text: "Cashback 20% off",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24))
          ])),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SearchBar(),
          IconWithItemCounter(
            IconThemeData: EvaIcons.shoppingCartOutline,
            press: () {},
            NumOfItems: 0,
          ),
          IconWithItemCounter(
            IconThemeData: EvaIcons.bellOutline,
            press: () {},
            NumOfItems: 3,
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            prefixIcon: Icon(
              EvaIcons.search,
              color: Colors.black,
            ),
            hintText: "Search Product",
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(15))),
      ),
    );
  }
}

class IconWithItemCounter extends StatelessWidget {
  const IconWithItemCounter({
    Key key,
    @required this.IconThemeData,
    @required this.press,
    this.NumOfItems = 0,
  }) : super(key: key);
  final IconThemeData;
  final int NumOfItems;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            height: getProportionateScreenWidth(46),
            width: getProportionateScreenWidth(46),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2), shape: BoxShape.circle),
            child: Icon(IconThemeData),
          ),
          if (NumOfItems != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: getProportionateScreenWidth(16),
                width: getProportionateScreenWidth(16),
                decoration: BoxDecoration(
                    color: Color(0xFFFF4040),
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.5, color: Colors.white)),
                child: Center(
                  child: Text(
                    "${NumOfItems}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenWidth(10),
                        fontWeight: FontWeight.w600,
                        height: 1),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
