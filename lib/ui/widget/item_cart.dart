part of 'widget.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.w),
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12.w),
          boxShadow: [
            BoxShadow(spreadRadius: 2.w, blurRadius: 2.w, color: Colors.black12)
          ]),
      child: Column(children: [
        Row(
          children: [
            Container(
              width: 60.w,
              height: 60.w,
              margin: EdgeInsets.only(right: 12.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.w),
                  color: inputTextColor,
                  image: const DecorationImage(
                      image: AssetImage('assets/shoes1.png'),
                      fit: BoxFit.contain)),
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
            Column(
              children: [
                Container(
                  width: 16.w,
                  height: 16.w,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: yellowColor),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: whiteColor,
                      size: 14.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.w,
                ),
                Text(
                  '1',
                  style: blackTextStyle.copyWith(
                      fontSize: 14.sp, fontWeight: medium),
                ),
                SizedBox(
                  height: 3.w,
                ),
                Container(
                  width: 16.w,
                  height: 16.w,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: greyColor),
                  child: Center(
                      child: Text(
                    '-',
                    style: whiteTextStyle.copyWith(
                        fontSize: 12.sp, fontWeight: semiBold),
                    textAlign: TextAlign.center,
                  )),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 12.w,
        ),
        Row(
          children: [
            Icon(
              Icons.delete,
              color: redColor,
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              'Remove',
              style: redTextStyle.copyWith(fontSize: 14.sp),
            )
          ],
        )
      ]),
    );
  }
}
