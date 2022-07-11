part of 'widget.dart';

class InputTextWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final Icon icon;
  final TextEditingController controller;

  const InputTextWidget(
      {Key? key,
      this.obscureText = false,
      this.title = '',
      this.hintText = '',
      required this.icon,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 16.sp, fontWeight: medium),
          ),
          SizedBox(
            height: 12.w,
          ),
          Container(
            width: double.infinity,
            height: 50.w,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: inputTextColor,
              borderRadius: BorderRadius.circular(12.w),
            ),
            child: Center(
              child: TextField(
                obscureText: obscureText,
                cursorColor: blackColor,
                controller: controller,
                style: blackTextStyle.copyWith(fontSize: 14.sp),
                decoration: InputDecoration(
                    icon: icon,
                    focusColor: Colors.white,
                    hintText: hintText,
                    hintStyle: greyTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: regular),
                    border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
