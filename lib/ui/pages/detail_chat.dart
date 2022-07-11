part of 'pages.dart';

class DetailChat extends StatelessWidget {
  const DetailChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    header() {
      return AppBar(
          toolbarHeight: 70.w,
          backgroundColor: whiteColor,
          elevation: 0.5,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const MainPage(initialPage: 1),
                          type: PageTransitionType.fade));
                },
                child: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: blackColor,
                  size: 24.w,
                ),
              ),
              Container(
                width: 50.w,
                height: 50.w,
                margin: EdgeInsets.only(left: 25.w, right: 12.w),
                child: Stack(
                  children: [
                    Container(
                      width: 50.w,
                      height: 50.w,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/adit.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 1.w, bottom: 1.w),
                        width: 12.w,
                        height: 12.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: greenColor),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shoes Store',
                    style: blackTextStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    'Online',
                    style: greyTextStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: light,
                    ),
                  )
                ],
              )
            ],
          ));
    }

    Widget productPreview() {
      return Container(
        width: 235.w,
        height: 75.w,
        padding: EdgeInsets.all(6.w),
        margin: EdgeInsets.only(bottom: 20.w),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: yellowColor.withOpacity(0.6)),
          boxShadow: const [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 1,
              color: Colors.black12,
            )
          ],
          borderRadius: BorderRadius.circular(12),
          color: whiteBackgorund,
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: 83.w,
            height: 63.w,
            margin: EdgeInsets.only(right: 8.w),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/shoes2.png'), fit: BoxFit.cover)),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Court Vision',
                  style: blackTextStyle.copyWith(fontSize: 14.sp),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 4.w,
                ),
                Text(
                  '\$ 254',
                  style: greenTextStyle.copyWith(
                      fontSize: 14.sp, fontWeight: light),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          Container(
            width: 22.w,
            height: 22.w,
            margin: EdgeInsets.only(left: 10.w),
            child: Icon(
              Icons.cancel,
              size: 24.w,
              color: yellowColor,
            ),
          )
        ]),
      );
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            productPreview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                      color: inputTextColor,
                      borderRadius: BorderRadius.circular(12.w),
                    ),
                    child: Center(
                      child: TextFormField(
                        style: blackTextStyle.copyWith(fontSize: 14.sp),
                        decoration: InputDecoration(
                            focusColor: Colors.white,
                            hintText: 'Type message..',
                            hintStyle: greyTextStyle.copyWith(
                                fontSize: 14.sp, fontWeight: regular),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 45.w,
                  height: 45.w,
                  margin: EdgeInsets.only(left: 20.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.w),
                      color: yellowColor),
                  child: Center(
                    child: Icon(
                      Icons.send_rounded,
                      color: whiteColor,
                      size: 20.w,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        children: const [
          ChatBuble(
            isSender: true,
            hashProduct: true,
            text: 'Hi, This item is still available?',
          ),
          ChatBuble(
            isSender: false,
            text: 'Good night, This item is only available in size 42 and 43',
          ),
          ChatBuble(
            isSender: true,
            text: 'Owww, it suits me very well',
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: whiteBackgorund,
      appBar: header(),
      body: content(),
      bottomNavigationBar: chatInput(),
    );
  }
}
