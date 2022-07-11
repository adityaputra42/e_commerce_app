part of 'pages.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    header() {
      return AppBar(
          backgroundColor: whiteColor,
          elevation: 0.1,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: primaryColor,
              size: 24.w,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Your Cart',
            style: blackTextStyle.copyWith(
              fontSize: 18.sp,
              fontWeight: medium,
            ),
          ));
    }

    Widget content() {
      return ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: const [
          ItemCart(),
          ItemCart(),
          SizedBox(
            height: 10,
          )
        ],
      );
    }

    Widget customBottomNav() {
      return Container(
        height: 165.w,
        width: double.infinity,
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: blackTextStyle.copyWith(fontSize: 14.sp),
                  ),
                  Text(
                    '\$2356,3',
                    style: greenTextStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Divider(
                thickness: 0.25,
                color: greyColor,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 22.w),
              width: double.infinity,
              height: 45.w,
              child: ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(blackColor),
                    backgroundColor: MaterialStateProperty.all(yellowColor),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.w)))),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const CheckoutPage(),
                          type: PageTransitionType.fade));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Continue to Checkout",
                        style: blackTextStyle.copyWith(
                            fontSize: 14.sp, fontWeight: medium)),
                    Icon(
                      Icons.arrow_forward,
                      size: 20.w,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget empty() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/shoping.png",
              width: MediaQuery.of(context).size.width - 90.w,
            ),
            SizedBox(
              height: 24.w,
            ),
            Text(
              'Opss! Your Cart is Empty',
              style: blackTextStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12.w,
            ),
            Text(
              'Let\'s find your favorite shoes',
              style: greyTextStyle.copyWith(
                fontSize: 14.sp,
              ),
            ),
            ButtonWidget(
              title: 'Explore Store',
              onPressed: () {},
              margin: EdgeInsets.only(top: 20.w),
              height: 44.w,
              width: 154.w,
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      backgroundColor: whiteBackgorund,
      body: content(),
      bottomNavigationBar: customBottomNav(),
    );
  }
}
