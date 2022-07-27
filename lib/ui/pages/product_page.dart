part of 'pages.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    "assets/shoes1.png",
    "assets/shoes2.png",
    "assets/shoes.png",
  ];

  List familiarImages = [
    "assets/shoes1.png",
    "assets/shoes2.png",
    "assets/shoes.png",
    "assets/shoes1.png",
    "assets/shoes2.png",
    "assets/shoes.png",
  ];
  int currentIndex = 0;
  bool isWishlist = false;
  @override
  Widget build(BuildContext context) {
    Future<void> showSuccesDialog() {
      return showDialog(
          context: context,
          builder: (BuildContext context) => SizedBox(
                width: MediaQuery.of(context).size.width - 48.w,
                child: AlertDialog(
                  backgroundColor: whiteBackgorund,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.w)),
                  content: SingleChildScrollView(
                      child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                              color: greyColor,
                            )),
                      ),
                      Image.asset(
                        'assets/icon_succes.png',
                        width: 100.w,
                      ),
                      SizedBox(
                        height: 12.w,
                      ),
                      Text(
                        "Horrey :)",
                        style: blackTextStyle.copyWith(
                            fontSize: 18.sp, fontWeight: semiBold),
                      ),
                      SizedBox(
                        height: 12.w,
                      ),
                      Text(
                        "Item added successfully",
                        style: greyTextStyle.copyWith(
                            fontSize: 14.sp, fontWeight: light),
                      ),
                      ButtonWidget(
                        height: 45.w,
                        title: "View my Cart",
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: const CartPage(),
                                  type: PageTransitionType.fade));
                        },
                        margin: EdgeInsets.only(top: 20.w),
                        width: 160.w,
                      )
                    ],
                  )),
                ),
              ));
    }

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16.w : 4.w,
        height: 4.w,
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
            color: currentIndex == index ? yellowColor : greyColor,
            borderRadius: BorderRadius.circular(4.w)),
      );
    }

    Widget familiarProduct(String imageUrl) {
      return Container(
        width: 54.w,
        height: 54.w,
        decoration: BoxDecoration(
            color: inputTextColor,
            borderRadius: BorderRadius.circular(6.w),
            image: DecorationImage(
                image: AssetImage(imageUrl), fit: BoxFit.contain)),
      );
    }

    Widget header() {
      int index = -1;
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 24.w, right: 24.w, top: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const MainPage(initialPage: 0),
                            type: PageTransitionType.fade));
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    // size: 24.w,
                    color: primaryColor,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_bag,
                      // size: 24.w,
                      color: primaryColor,
                    ))
              ],
            ),
          ),
          CarouselSlider(
              items: images
                  .map((e) => Image.asset(
                        e,
                        width: double.infinity,
                        height: 310.w,
                        fit: BoxFit.contain,
                      ))
                  .toList(),
              options: CarouselOptions(
                  viewportFraction: 1,
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  })),
          SizedBox(
            height: 20.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          )
        ],
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 17.w),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.w),
                topRight: Radius.circular(24.w))),
        child: Column(
          children: [
            // NOTE: Header
            Container(
              margin: EdgeInsets.only(top: 30.w, right: 24.w, left: 24.w),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Air Jordan 3 Mark II',
                          style: blackTextStyle.copyWith(
                              fontSize: 18.sp, fontWeight: semiBold),
                        ),
                        Text(
                          'Running',
                          style: greyTextStyle.copyWith(
                              fontSize: 14.sp, fontWeight: regular),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isWishlist = !isWishlist;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: const Duration(milliseconds: 1000),
                        dismissDirection: DismissDirection.up,
                        backgroundColor: isWishlist ? greenBarColor : redColor,
                        content: Text(
                          isWishlist
                              ? 'Has been added to the Whitelist'
                              : "Has been removed from the Whitelist",
                          style: whiteTextStyle.copyWith(fontSize: 14.sp),
                          textAlign: TextAlign.center,
                        ),
                      ));
                    },
                    child: Container(
                      width: 46.w,
                      height: 46.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isWishlist
                            ? yellowColor
                            : greyColor.withOpacity(0.2),
                        // color: greyColor.withOpacity(0.25),
                      ),
                      child: Icon(
                        Icons.favorite,
                        size: 24.w,
                        color: isWishlist ? whiteColor : greyColor,
                        // color: greyColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // NOTE:Price
            Container(
              margin: EdgeInsets.only(top: 20.w, left: 24.w, right: 24.w),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                  color: inputTextColor,
                  borderRadius: BorderRadius.circular(6.w)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price starts from',
                    style: blackTextStyle.copyWith(fontSize: 14.sp),
                  ),
                  Text(
                    '\$344,5',
                    style: greenTextStyle.copyWith(
                        fontSize: 16.sp, fontWeight: semiBold),
                  )
                ],
              ),
            ),
            // NOTE: Deskripsi
            Container(
              margin: EdgeInsets.only(top: 30.w, left: 24.w, right: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: blackTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: medium),
                  ),
                  SizedBox(
                    height: 12.w,
                  ),
                  Text(
                    'Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.',
                    style: greyTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: light),
                  )
                ],
              ),
            ),
            // NOTE: Image Product
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 24.w),
                    child: Text(
                      'Familiar Shoes',
                      style: blackTextStyle.copyWith(
                          fontSize: 14.sp, fontWeight: medium),
                    ),
                  ),
                  SizedBox(
                    height: 12.w,
                  ),
                  SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: familiarImages
                            .map((image) => Padding(
                                  padding: EdgeInsets.only(
                                    left: image == familiarImages.first
                                        ? 24.w
                                        : 16.w,
                                    right: image == familiarImages.last
                                        ? 24.w
                                        : 0.w,
                                  ),
                                  child: familiarProduct(image),
                                ))
                            .toList(),
                      ))
                ],
              ),
            ),
            // Note: Footer
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const DetailChat(),
                              type: PageTransitionType.fade));
                    },
                    child: Container(
                      width: 50.w,
                      height: 50.w,
                      margin: EdgeInsets.only(right: 16.w),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: yellowColor),
                          borderRadius: BorderRadius.circular(8.w)),
                      child: Icon(
                        Icons.message,
                        size: 24.w,
                        color: yellowColor,
                      ),
                    ),
                  ),
                  Expanded(
                      child: ButtonWidget(
                          title: "Add to Cart",
                          onPressed: () {
                            showSuccesDialog();
                          }))
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: primaryColor,
          ),
          SafeArea(
            child: Container(color: inputTextColor),
          ),
          SafeArea(
            child: ListView(
              children: [
                header(),
                content(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
