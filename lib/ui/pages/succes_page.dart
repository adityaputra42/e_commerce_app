part of 'pages.dart';

class SuccesPage extends StatelessWidget {
  const SuccesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    header() {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        centerTitle: true,
        elevation: 0.1,
        title: Text(
          'Checkout Succes',
          style: blackTextStyle.copyWith(fontSize: 18.sp, fontWeight: medium),
        ),
      );
    }

    Widget content() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/succes_checkout.png',
              width: 210.w,
            ),
            SizedBox(
              height: 30.w,
            ),
            Text(
              'You made a transaction',
              style: blackTextStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12.w,
            ),
            Text(
              'Stay at home while we\nprepare your dream shoes',
              style: greyTextStyle.copyWith(fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
            ButtonWidget(
              height: 45,
              title: 'Order others Shoes',
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    PageTransition(
                        child: const MainPage(initialPage: 0),
                        type: PageTransitionType.fade),
                    (route) => false);
              },
              margin: EdgeInsets.only(top: 30.w, left: 60.w, right: 60.w),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 60.w, vertical: 20.w),
              width: double.infinity,
              height: 45.w,
              child: ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(blackColor),
                    backgroundColor: MaterialStateProperty.all(greyColor),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.w)))),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const CheckoutPage(),
                          type: PageTransitionType.fade));
                },
                child: Text("View My Order",
                    style: blackTextStyle.copyWith(
                        fontSize: 16.sp, fontWeight: medium)),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteBackgorund,
      appBar: header(),
      body: content(),
    );
  }
}
