part of 'widget.dart';

class CheckoutItem extends StatelessWidget {
  const CheckoutItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 12.w),
      padding: EdgeInsets.fromLTRB(6.w, 6.w, 12.w, 6.w),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12.w),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1.w,
              blurRadius: 1.w,
              color: Colors.black12,
            )
          ]),
      child: Row(children: [
        Container(
          width: 60.w,
          height: 60.w,
          margin: EdgeInsets.only(right: 12.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: inputTextColor,
              image: const DecorationImage(
                  image: AssetImage('assets/shoes2.png'), fit: BoxFit.contain)),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Air Jordan 3 Mark II',
                style: blackTextStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: 2.w,
              ),
              Text(
                '\$143,98',
                style: greenTextStyle.copyWith(fontSize: 14.sp),
              )
            ],
          ),
        ),
        Text(
          '2 Items',
          style: greyTextStyle.copyWith(fontSize: 12.sp),
        )
      ]),
    );
  }
}
