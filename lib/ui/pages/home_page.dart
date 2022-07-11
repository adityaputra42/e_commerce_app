part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(left: 24.w, right: 24.w, top: 30.w),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, Aditya Putra Pratama',
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 22.sp),
                  overflow: TextOverflow.clip,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'aditya42@gmail.com',
                  style: greyTextStyle.copyWith(fontSize: 14.sp),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(3.w),
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: yellowColor)),
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/adit.jpg'), fit: BoxFit.cover)),
            ),
          )
        ]),
      );
    }

    Widget exploreCard() {
      return Container(
        width: double.infinity,
        height: 198.w,
        margin: EdgeInsets.only(bottom: 20.w, left: 24.w, right: 24.w),
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 160.w,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: primaryColor,
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2.w,
                        blurRadius: 2.w,
                        color: Colors.black12)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore our products',
                    style: whiteTextStyle.copyWith(
                        fontSize: 16.sp, fontWeight: medium),
                  ),
                  SizedBox(
                    height: 4.w,
                  ),
                  Text(
                    'We have the best product\nat the best price',
                    style: greyTextStyle.copyWith(
                        fontSize: 12.sp, fontWeight: light),
                  ),
                  const Spacer(),
                  ButtonWidget(
                    title: "Explore Now",
                    onPressed: () {},
                    height: 36.w,
                    width: 130.w,
                    margin: EdgeInsets.only(bottom: 6.w),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 190.w,
              width: 120.w,
              margin: EdgeInsets.only(bottom: 8.w, right: 8.w),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/3.png'), fit: BoxFit.cover)),
            ),
          )
        ]),
      );
    }

    Widget categories() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 24.w, bottom: 10.w),
            child: Text(
              'Categories',
              style:
                  blackTextStyle.copyWith(fontWeight: medium, fontSize: 20.sp),
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: TabBarWidget(
              titles: const [
                'All Shoes',
                'Running',
                'Futsal',
                'Man\'s',
                'FootBall',
                'Lifestyle'
              ],
              selectedIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
        ],
      );
    }

    Widget popularProduct() {
      return Container(
        margin: EdgeInsets.only(top: 10.w),
        height: 225.w,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(
              width: 24.w,
            ),
            const ProductCard(),
            SizedBox(
              width: 16.w,
            ),
            const ProductCard(),
            SizedBox(
              width: 16.w,
            ),
            const ProductCard(),
            SizedBox(
              width: 16.w,
            ),
            const ProductCard(),
            SizedBox(
              width: 24.w,
            ),
          ],
        ),
      );
    }

    Widget recomended() {
      return Container(
        margin: EdgeInsets.only(top: 20.w, bottom: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10.w, left: 24.w),
              child: Text(
                'Recomended For You',
                style: blackTextStyle.copyWith(
                    fontWeight: medium, fontSize: 20.sp),
              ),
            ),
            SizedBox(
              height: 110.w,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    width: 24.w,
                  ),
                  FadeInRight(child: const RecomendedCard()),
                  SizedBox(
                    width: 16.w,
                  ),
                  FadeInRight(child: const RecomendedCard()),
                  SizedBox(
                    width: 16.w,
                  ),
                  FadeInRight(child: const RecomendedCard()),
                  SizedBox(
                    width: 16.w,
                  ),
                  FadeInRight(child: const RecomendedCard()),
                  SizedBox(
                    width: 24.w,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteBackgorund,
      body: SafeArea(
          child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          header(),
          exploreCard(),
          categories(),
          popularProduct(),
          recomended()
        ],
      )),
    );
  }
}
