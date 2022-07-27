part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    Widget header() {
      return AppBar(
        toolbarHeight: 125.w,
        backgroundColor: whiteColor,
        elevation: 0.5,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 65.w,
              height: 65.w,
              margin: EdgeInsets.only(right: 12.w),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(user.profilePhotoUrl!),
                      fit: BoxFit.cover)),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${user.name}',
                    style: blackTextStyle.copyWith(
                      fontSize: 22.sp,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '@${user.username}',
                    style: greyTextStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: regular,
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    PageTransition(
                        child: SignInPage(),
                        type: PageTransitionType.bottomToTop),
                    (route) => false);
              },
              child: Container(
                width: 26.w,
                height: 26.w,
                margin: EdgeInsets.only(left: 12.w),
                decoration: BoxDecoration(
                  color: yellowColor,
                  borderRadius: BorderRadius.circular(6.w),
                ),
                child: Icon(
                  Icons.exit_to_app,
                  size: 20.w,
                  color: whiteColor,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,
                style: greyTextStyle.copyWith(
                    fontSize: 13.sp, fontWeight: regular)),
            Icon(
              Icons.chevron_right,
              color: greyColor,
            )
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          color: whiteBackgorund,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 20.w,
            ),
            Text(
              'Account',
              style: blackTextStyle.copyWith(
                  fontSize: 16.sp, fontWeight: semiBold),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const EditProfilePage(),
                          type: PageTransitionType.fade));
                },
                child: menuItem('Edit Profile')),
            menuItem('Your Order'),
            menuItem('Help'),
            SizedBox(
              height: 30.w,
            ),
            Text(
              'General',
              style: blackTextStyle.copyWith(
                  fontSize: 16.sp, fontWeight: semiBold),
            ),
            menuItem('Privacy & Policy'),
            menuItem('Term Of Service'),
            menuItem('Rate App'),
          ]),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
