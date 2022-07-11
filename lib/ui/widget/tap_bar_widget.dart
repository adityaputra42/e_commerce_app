part of 'widget.dart';

class TabBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function(int)? onTap;
  const TabBarWidget({
    Key? key,
    required this.titles,
    required this.selectedIndex,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: titles
          .map((e) => Padding(
                padding: EdgeInsets.only(
                    right: e == titles.last ? 24.w : 12.w,
                    left: e == titles.first ? 24.w : 0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (onTap != null) {
                          onTap!(titles.indexOf(e));
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5.w),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.w, horizontal: 12.w),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: (titles.indexOf(e) == selectedIndex
                                    ? yellowColor
                                    : greyColor)),
                            borderRadius: BorderRadius.circular(12.w),
                            color: (titles.indexOf(e) == selectedIndex
                                ? yellowColor
                                : Colors.transparent),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                  color: (titles.indexOf(e) == selectedIndex
                                      ? Colors.black12
                                      : Colors.transparent))
                            ]),
                        child: Text(
                          e,
                          style: (titles.indexOf(e) == selectedIndex
                              ? blackTextStyle.copyWith(
                                  fontWeight: medium, fontSize: 14.sp)
                              : greyTextStyle.copyWith(
                                  fontSize: 14.sp,
                                )),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
