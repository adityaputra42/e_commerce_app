part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameControler = TextEditingController(text: '');

  final TextEditingController usernameControler =
      TextEditingController(text: '');

  final TextEditingController emailControler = TextEditingController(text: '');

  final TextEditingController passwordControler =
      TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.register(
        name: nameControler.text,
        username: usernameControler.text,
        email: emailControler.text,
        password: passwordControler.text,
      )) {
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: const MainPage(), type: PageTransitionType.fade),
            (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(milliseconds: 1000),
          dismissDirection: DismissDirection.up,
          backgroundColor: redColor,
          content: Text(
            "Gagal Register",
            style: whiteTextStyle.copyWith(fontSize: 14.sp),
            textAlign: TextAlign.center,
          ),
        ));
      }
      setState(() {
        isLoading = false;
      });
    }

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
            child: isLoading
                ? LoadingButton(
                    margin: EdgeInsets.only(top: 10.w, bottom: 40.w),
                  )
                : ButtonWidget(
                    title: 'Sign Up',
                    onPressed: handleSignUp,
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
