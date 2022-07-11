part of 'pages.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return FadeInDown(
        child: Container(
          margin: EdgeInsets.only(top: 30.w, bottom: 70.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 2.w),
                child: Text(
                  'Login',
                  style: blackTextStyle.copyWith(
                      fontSize: 24.sp, fontWeight: semiBold),
                ),
              ),
              Text(
                'Sign in to continue',
                style: greyTextStyle.copyWith(
                    fontSize: 14.sp, fontWeight: regular),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Column(
        children: [
          FadeInLeft(
            child: InputTextWidget(
                icon: Icon(
                  Icons.mail,
                  color: yellowColor,
                ),
                title: 'Email Address',
                hintText: 'Your Email Address',
                controller: emailControler),
          ),
          FadeInRight(
            child: InputTextWidget(
              controller: passwordControler,
              icon: Icon(
                Icons.lock_rounded,
                color: yellowColor,
              ),
              title: 'Password',
              hintText: 'Your Password',
              obscureText: true,
            ),
          ),
          FadeInLeft(
            child: ButtonWidget(
                margin: EdgeInsets.only(top: 10.w, bottom: 40.w),
                title: 'Sign In',
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const MainPage(),
                          type: PageTransitionType.bottomToTop));
                }),
          ),
        ],
      );
    }

    Widget footer() {
      return FadeInUp(
        child: Container(
          margin: EdgeInsets.only(bottom: 30.w),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Don't have an account? ",
              style: greyTextStyle.copyWith(fontSize: 12.sp),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: SignUpPage(), type: PageTransitionType.fade));
              },
              child: Text(
                'Sign Up',
                style: primaryTextStyle.copyWith(
                    fontSize: 12.sp, fontWeight: medium),
              ),
            )
          ]),
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteBackgorund,
      body: SafeArea(
          child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          header(),
          content(),
          footer(),
        ],
      )),
    );
  }
}
