part of 'widget.dart';

class WishListCard extends StatelessWidget {
  const WishListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.w),
      padding: EdgeInsets.fromLTRB(10.w, 10.w, 16.w, 10.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.w,
            blurRadius: 1.w,
            color: Colors.black12,
          ),
        ],
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Row(children: [
        Container(
          width: 90.w,
          height: 70.w,
          margin: EdgeInsets.only(right: 10.w),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/shoes1.png'), fit: BoxFit.cover),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terrex Urban Low',
                style: blackTextStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: semiBold,
                ),
                maxLines: 2,
              ),
              SizedBox(
                height: 5.w,
              ),
              Text(
                '\$143,98',
                style: greenTextStyle.copyWith(fontSize: 14.sp),
              ),
            ],
          ),
        ),
        Container(
          width: 34.w,
          height: 34.w,
          margin: EdgeInsets.only(left: 8.w),
          decoration: BoxDecoration(shape: BoxShape.circle, color: yellowColor),
          child: Icon(
            Icons.favorite,
            size: 18.w,
            color: whiteColor,
          ),
        )
      ]),
    );
  }
}
