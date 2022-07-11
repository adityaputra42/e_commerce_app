part of 'widget.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final Function() onPressed;
  final EdgeInsets margin;

  const ButtonWidget({
    Key? key,
    required this.title,
    this.height = 50,
    this.width = double.infinity,
    required this.onPressed,
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
        onPressed: onPressed,
        child: Text(title,
            style:
                blackTextStyle.copyWith(fontSize: 16.sp, fontWeight: medium)),
      ),
    );
  }
}
