part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int initialPage;

  const MainPage({Key? key, this.initialPage = 0})
      : super(
          key: key,
        );

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController(initialPage: 0);
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialPage;
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Stack(
        children: [
          Container(
            color: primaryColor,
          ),
          SafeArea(child: Container(color: whiteBackgorund)),
          SafeArea(
            child: PageView(
              physics: const BouncingScrollPhysics(),
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              children: const [
                HomePage(),
                ChatPage(),
                FavoritePage(),
                ProfilePage(),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: whiteBackgorund,
      body: content(),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  child: const CartPage(), type: PageTransitionType.fade));
        },
        child: Container(
            width: 50.w,
            height: 50.w,
            padding: EdgeInsets.all(13.w),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: yellowColor,
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2.w,
                      blurRadius: 2.w,
                      color: Colors.black12),
                ]),
            child: const Image(
              image: AssetImage('assets/cart_icon.png'),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.w)),
        child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 4.w,
            clipBehavior: Clip.antiAlias,
            child: BottomNavBarWidget(
              selectedIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
                pageController.jumpToPage(selectedIndex);
              },
            )),
      ),
    );
  }
}
