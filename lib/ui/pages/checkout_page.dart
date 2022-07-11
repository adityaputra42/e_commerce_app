part of 'pages.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

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
            'Checkout Detail',
            style: blackTextStyle.copyWith(fontSize: 18.sp, fontWeight: medium),
          ));
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          // Note: List Item
          Container(
            margin: EdgeInsets.only(top: 30.w),
            child: Text(
              'List Item',
              style: blackTextStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: medium,
              ),
            ),
          ),
          Column(
            children: const [
              CheckoutItem(),
              CheckoutItem(),
            ],
          ),
          // Note: Address Details
          Container(
            margin: EdgeInsets.only(top: 30.w),
            padding: EdgeInsets.all(20.w),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 1.w,
                    blurRadius: 1.w,
                    color: Colors.black12,
                  )
                ]),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Address Detail',
                style: blackTextStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 12.w,
              ),
              Row(
                children: [
                  Container(
                    height: 40.w,
                    width: 40.w,
                    margin: EdgeInsets.only(right: 12.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: inputTextColor,
                    ),
                    child: Icon(
                      Icons.collections_bookmark_rounded,
                      color: yellowColor,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Store Location',
                          style: greyTextStyle.copyWith(
                              fontSize: 12.sp, fontWeight: light),
                        ),
                        Text(
                          'Adidas Store',
                          style: blackTextStyle.copyWith(
                              fontSize: 14.sp, fontWeight: medium),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                width: 40.w,
                height: 35.w,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/icon_line.png'),
                        fit: BoxFit.contain)),
              ),
              Row(
                children: [
                  Container(
                    height: 40.w,
                    width: 40.w,
                    margin: EdgeInsets.only(right: 12.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: inputTextColor,
                    ),
                    child: Icon(
                      Icons.place,
                      color: yellowColor,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Address',
                          style: greyTextStyle.copyWith(
                              fontSize: 12.sp, fontWeight: light),
                        ),
                        Text(
                          'Sempor, kebumen, Jawa Tengah 54421',
                          style: blackTextStyle.copyWith(
                              fontSize: 14.sp, fontWeight: medium),
                        )
                      ],
                    ),
                  )
                ],
              )
            ]),
          ),
          // Note: Payment Summary
          Container(
            margin: EdgeInsets.only(top: 30.w),
            padding: EdgeInsets.all(20.w),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 1.w,
                    blurRadius: 1.w,
                    color: Colors.black12,
                  )
                ]),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Payment Summary',
                style: blackTextStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 12.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Product Quantity',
                    style: greyTextStyle.copyWith(
                        fontSize: 12.sp, fontWeight: regular),
                  ),
                  Text(
                    '4 Items',
                    style: blackTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: medium),
                  )
                ],
              ),
              SizedBox(
                height: 12.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Product Price',
                    style: greyTextStyle.copyWith(
                        fontSize: 12.sp, fontWeight: regular),
                  ),
                  Text(
                    '\$234',
                    style: blackTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: medium),
                  )
                ],
              ),
              SizedBox(
                height: 12.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shipping',
                    style: greyTextStyle.copyWith(
                        fontSize: 12.sp, fontWeight: regular),
                  ),
                  Text(
                    'Free',
                    style: blackTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: medium),
                  )
                ],
              ),
              SizedBox(
                height: 12.w,
              ),
              Divider(
                thickness: 0.6,
                color: greyColor,
              ),
              SizedBox(
                height: 12.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: greenTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: medium),
                  ),
                  Text(
                    '\$423,544',
                    style: greenTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: semiBold),
                  )
                ],
              ),
            ]),
          ),
          ButtonWidget(
            title: 'Checkout Now',
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                      child: const SuccesPage(), type: PageTransitionType.fade),
                  (route) => false);
            },
            margin: EdgeInsets.symmetric(vertical: 30.w),
          )
        ],
      );
    }

    return Scaffold(
      appBar: header(),
      backgroundColor: whiteBackgorund,
      body: content(),
    );
  }
}
