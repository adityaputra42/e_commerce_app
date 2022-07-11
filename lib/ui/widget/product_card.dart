part of 'widget.dart';

class ProductCard extends StatelessWidget {
  // final Color? color;
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
              child: const ProductPage(),
              type: PageTransitionType.fade,
            ));
      },
      child: Container(
        width: 170.w,
        height: 215.w,
        margin: EdgeInsets.symmetric(vertical: 5.w),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(12.w),
            boxShadow: [
              BoxShadow(
                spreadRadius: 2.w,
                blurRadius: 2.w,
                color: Colors.black12,
              ),
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.all(5.w),
                width: double.infinity,
                height: 110.w,
                decoration: BoxDecoration(
                  color: inputTextColor,
                  borderRadius: BorderRadius.circular(12.w),
                  image: const DecorationImage(
                      image: AssetImage('assets/shoes1.png'),
                      fit: BoxFit.cover),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 30.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: whiteBackgorund),
                  margin: EdgeInsets.only(top: 12.w, right: 12.w),
                  child: Icon(
                    Icons.favorite_outline,
                    size: 20.w,
                    color: greyColor,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nike Max 28',
                      style: blackTextStyle.copyWith(
                          fontSize: 16.sp, fontWeight: medium),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 2.w,
                    ),
                    Text(
                      'Running Shoes',
                      style: greyTextStyle.copyWith(
                          fontSize: 12.sp, fontWeight: light),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$344",
                      style: greenTextStyle.copyWith(
                          fontSize: 16.sp, fontWeight: medium),
                    ),
                    Container(
                      height: 26.w,
                      width: 26.w,
                      decoration: BoxDecoration(
                        color: yellowColor,
                        // shape: BoxShape.circle
                        borderRadius: BorderRadius.circular(8.w),
                        // border: Border.all(width: 1.w, color: greyColor),
                      ),
                      child: Icon(
                        Icons.add,
                        color: whiteColor,
                        size: 24.w,
                      ),
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
