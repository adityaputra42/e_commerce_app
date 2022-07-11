part of 'widget.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int? selectedIndex;
  final Function(int index)? onTap;
  const BottomNavBarWidget({Key? key, this.selectedIndex, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.w,
      decoration: BoxDecoration(
          color: primaryColor,
          boxShadow: const [
            BoxShadow(spreadRadius: 3, blurRadius: 5, color: Colors.black12)
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.w),
            topRight: Radius.circular(16.w),
          )),
      child: Row(
        children: [
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap!(0);
                }
              },
              child: SizedBox(
                  height: 22.w,
                  width: 22.w,
                  child: Icon(
                    Icons.home,
                    color: (selectedIndex == 0) ? yellowColor : greyColor,
                    size: (selectedIndex == 0) ? 24.w : 22.w,
                  )),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap!(1);
                }
              },
              child: SizedBox(
                  height: 22.w,
                  width: 22.w,
                  child: Icon(
                    Icons.message_rounded,
                    color: (selectedIndex == 1) ? yellowColor : greyColor,
                    size: (selectedIndex == 1) ? 24.w : 22.w,
                  )),
            ),
          ),
          SizedBox(
            width: 80.w,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap!(2);
                }
              },
              child: SizedBox(
                  height: 22.w,
                  width: 22.w,
                  child: Icon(
                    Icons.favorite,
                    color: (selectedIndex == 2) ? yellowColor : greyColor,
                    size: (selectedIndex == 2) ? 24.w : 22.w,
                  )),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap!(3);
                }
              },
              child: SizedBox(
                  height: 22.w,
                  width: 22.w,
                  child: Icon(
                    Icons.person,
                    color: (selectedIndex == 3) ? yellowColor : greyColor,
                    size: (selectedIndex == 3) ? 24.w : 22.w,
                  )),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
        ],
      ),
    );
  }
}
