part of 'pages.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController nameControler = TextEditingController();
  final TextEditingController usernameControler = TextEditingController();
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return FadeInDown(
        child: Container(
          margin: EdgeInsets.only(top: 30.w, bottom: 50.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: 2.w,
                ),
                child: Text(
                  'Sign Up',
                  style: blackTextStyle.copyWith(
                      fontSize: 24.sp, fontWeight: semiBold),
                ),
              ),
              Text(
                'Register and Happy Shoping',
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
                icon: Icon(Icons.person, color: yellowColor),
                title: "Full Name",
                hintText: 'Your Full Name',
                controller: nameControler),
          ),
          FadeInRight(
            child: InputTextWidget(
                icon: Icon(Icons.radio_button_checked, color: yellowColor),
                title: "Username",
                hintText: 'Your Username',
                controller: usernameControler),
          ),
          FadeInLeft(
            child: InputTextWidget(
                icon: Icon(Icons.mail_rounded, color: yellowColor),
                title: "Email Address",
                hintText: 'Your Email Address',
                controller: emailControler),
          ),
          FadeInRight(
            child: InputTextWidget(
                icon: Icon(Icons.lock_rounded, color: yellowColor),
                title: "Password",
                hintText: 'Your Password',
                obscureText: true,
                controller: passwordControler),
          ),
          FadeInLeft(
            child: ButtonWidget(
              title: 'Sign Up',
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const MainPage(),
                        type: PageTransitionType.fade));
              },
              margin: EdgeInsets.only(top: 10.w, bottom: 40.w),
            ),
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
              "Already have an account? ",
              style: greyTextStyle.copyWith(fontSize: 12.sp),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: SignInPage(), type: PageTransitionType.fade));
              },
              child: Text(
                'Sign In',
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
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        children: [
          header(),
          content(),
          footer(),
        ],
      )),
    );
  }
}
