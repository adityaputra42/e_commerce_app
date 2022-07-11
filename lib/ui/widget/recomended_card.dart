part of 'widget.dart';

class RecomendedCard extends StatelessWidget {
  const RecomendedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: const ProductPage(), type: PageTransitionType.fade));
      },
      child: Container(
        width: 260.w,
        height: 100.w,
        margin: EdgeInsets.symmetric(vertical: 5.w),
        padding: EdgeInsets.fromLTRB(5.w, 5.w, 12.w, 5.w),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 2.w,
              blurRadius: 2.w,
              color: Colors.black12,
            ),
          ],
          color: whiteColor,
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: Row(children: [
          Container(
            width: 90.w,
            height: 90.w,
            margin: EdgeInsets.only(right: 8.w),
            decoration: BoxDecoration(
              color: inputTextColor,
              borderRadius: BorderRadius.circular(12.w),
              image: const DecorationImage(
                image: AssetImage('assets/shoes.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Adidas Sport XR',
                  style: blackTextStyle.copyWith(
                      fontSize: 16.sp, fontWeight: medium),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2.w,
                ),
                Text(
                  'Sport Shoe\'s',
                  style: greyTextStyle.copyWith(
                      fontSize: 12.sp, fontWeight: regular),
                ),
                SizedBox(
                  height: 8.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$245',
                      style: greenTextStyle.copyWith(
                          fontSize: 16.sp, fontWeight: medium),
                    ),
                    const StarRate(
                      star: 1,
                      voteAverage: 8.6,
                    )
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
