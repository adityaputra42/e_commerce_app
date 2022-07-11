part of 'pages.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Favorite Shoes',
          style: blackTextStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget empty() {
      return Expanded(
        child: Container(
          color: whiteBackgorund,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInDownBig(
                child: Container(
                  width: 240.w,
                  height: 240.w,
                  margin: EdgeInsets.only(bottom: 20.w),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/wish_list.png'),
                    fit: BoxFit.contain,
                  )),
                ),
              ),
              FadeInLeftBig(
                child: Text(
                  'You don\'t have dream shoes?',
                  style: blackTextStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: medium,
                  ),
                ),
              ),
              SizedBox(
                height: 5.w,
              ),
              FadeInRightBig(
                child: Text(
                  'Let\'s find your favorite shoes',
                  style: greyTextStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: regular,
                  ),
                ),
              ),
              FadeInUpBig(
                child: ButtonWidget(
                  title: 'Explore Store',
                  onPressed: () {},
                  width: 200.w,
                  margin: EdgeInsets.only(top: 30.w),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: whiteBackgorund,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            children: const [
              WishListCard(),
              WishListCard(),
              WishListCard(),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        // empty(),
        content()
      ],
    );
  }
}
