part of 'widget.dart';

class ChatBuble extends StatelessWidget {
  final String text;
  final bool isSender;
  final bool hashProduct;
  const ChatBuble({
    Key? key,
    this.text = '',
    this.hashProduct = false,
    this.isSender = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget productPreview() {
      return Container(
        width: 230.w,
        height: 155.w,
        margin: EdgeInsets.only(bottom: 12.w),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isSender ? 12.w : 0),
              topRight: Radius.circular(isSender ? 0 : 12.w),
              bottomLeft: Radius.circular(12.w),
              bottomRight: Radius.circular(12.w),
            ),
            color: isSender
                ? yellowColor.withOpacity(0.1)
                : greyColor.withOpacity(0.1)),
        child: Column(children: [
          Row(
            children: [
              Container(
                width: 75.w,
                height: 55.w,
                margin: EdgeInsets.only(right: 10.w),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/shoes2.png'),
                        fit: BoxFit.cover)),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'COURT VISION 2.0 SHOES',
                      style: blackTextStyle.copyWith(
                          fontSize: 14.sp, fontWeight: medium),
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 2.w,
                    ),
                    Text(
                      '\$ 257',
                      style: greenTextStyle.copyWith(
                          fontSize: 14.sp, fontWeight: regular),
                      overflow: TextOverflow.clip,
                    )
                  ],
                ),
              )
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                height: 45.w,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: yellowColor,
                    ),
                    borderRadius: BorderRadius.circular(12.w)),
                child: ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(yellowColor),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.w)),
                      )),
                  onPressed: () {},
                  child: Text('Add to cart',
                      style: blackTextStyle.copyWith(
                          fontSize: 14.sp,
                          fontWeight: medium,
                          color: yellowColor)),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 45.w,
                child: ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(blackColor),
                      backgroundColor: MaterialStateProperty.all(yellowColor),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.w)),
                      )),
                  onPressed: () {},
                  child: Text('Buy Now',
                      style: blackTextStyle.copyWith(
                        fontSize: 14.sp,
                        fontWeight: medium,
                      )),
                ),
              )
            ],
          )
        ]),
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          isSender && hashProduct ? productPreview() : const SizedBox(),
          Row(
              mainAxisAlignment:
                  isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(isSender ? 12.w : 0),
                          topRight: Radius.circular(isSender ? 0 : 12.w),
                          bottomLeft: Radius.circular(12.w),
                          bottomRight: Radius.circular(12.w),
                        ),
                        color: isSender
                            ? yellowColor.withOpacity(0.15)
                            : greyColor.withOpacity(0.15)),
                    child: Text(
                      text,
                      style: blackTextStyle.copyWith(fontSize: 14.sp),
                    ),
                  ),
                )
              ]),
        ],
      ),
    );
  }
}
