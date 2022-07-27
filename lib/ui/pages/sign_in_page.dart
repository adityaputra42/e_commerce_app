part of 'pages.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailControler = TextEditingController();

  final TextEditingController passwordControler = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
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
            "Gagal Login",
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
      return Column(
        children: [
          FadeInDown(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30.w, bottom: 50.w),
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
          ),
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
            child: isLoading
                ? LoadingButton(
                    margin: EdgeInsets.only(top: 10.w, bottom: 40.w),
                  )
                : ButtonWidget(
                    margin: EdgeInsets.only(top: 10.w, bottom: 40.w),
                    title: 'Sign In',
                    onPressed: handleSignIn),
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
                        child: const SignUpPage(),
                        type: PageTransitionType.fade));
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
          child: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          header(),
                          footer(),
                        ],
                      ),
                    ),
                  ))),
    );
  }
}
