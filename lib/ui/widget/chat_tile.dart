part of 'widget.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
              child: const DetailChat(),
              type: PageTransitionType.fade,
            ));
      },
      child: Container(
        margin: EdgeInsets.only(top: 33.w),
        child: Column(children: [
          Row(
            children: [
              Container(
                width: 54.w,
                height: 54.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/logo_shop.png'),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shoe Store',
                      style: blackTextStyle.copyWith(
                          fontSize: 15.sp, fontWeight: medium),
                    ),
                    Text(
                      'Good night, this item is on, i like this product',
                      style: greyTextStyle.copyWith(
                          fontSize: 14.sp, fontWeight: light),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              Text(
                'Now',
                style: greyTextStyle.copyWith(fontSize: 10.sp),
              )
            ],
          ),
          SizedBox(
            height: 2.w,
          ),
          // Divider(
          //   thickness: 1.h,
          //   color: greyColor.withOpacity(0.2),
          // ),
        ]),
      ),
    );
  }
}
