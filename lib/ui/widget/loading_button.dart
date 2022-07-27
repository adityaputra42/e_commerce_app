part of 'widget.dart';

class LoadingButton extends StatelessWidget {
  final double width;
  final double height;

  final EdgeInsets margin;

  const LoadingButton({
    Key? key,
    this.height = 50,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height.w,
      child: ElevatedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(blackColor),
            backgroundColor: MaterialStateProperty.all(yellowColor),
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.w)))),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 16.w,
                height: 16.w,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(primaryColor),
                )),
            SizedBox(
              width: 6.w,
            ),
            Text('Loading',
                style: blackTextStyle.copyWith(
                    fontSize: 16.sp, fontWeight: medium)),
          ],
        ),
      ),
    );
  }
}
