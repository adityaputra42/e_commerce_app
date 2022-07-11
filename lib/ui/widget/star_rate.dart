part of 'widget.dart';

class StarRate extends StatelessWidget {
  final double voteAverage;
  final double starSize;
  final TextStyle? style;
  final int star;
  final MainAxisAlignment alignment;
  const StarRate({Key? key,
    this.star = 5,
    this.voteAverage = 0,
    this.starSize = 20,
    this.style,
    this.alignment = MainAxisAlignment.start}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int n = (voteAverage / 2).round();

    List<Widget> widgets = List.generate(
        star,
            (index) => Icon(
          index < n ? Icons.star_rounded : Icons.star_outline_rounded,
          color: yellowColor,
          size: starSize.w,
        ));

    widgets.add(SizedBox(
      width: 3.w,
    ));
    widgets.add(Text(
      "${(voteAverage / 2).roundToDouble()}",
      style: style,
    ));

    return Row(
      mainAxisAlignment: alignment,
      children: widgets,
    );
  }
}
