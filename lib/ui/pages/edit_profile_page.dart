part of 'pages.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    header() {
      return AppBar(
          toolbarHeight: 80.w,
          backgroundColor: whiteColor,
          elevation: 0.5,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const MainPage(initialPage: 3),
                          type: PageTransitionType.fade));
                },
                icon: Icon(
                  Icons.close,
                  color: blackColor,
                  size: 24.w,
                ),
              ),
              Text(
                'Edit profile',
                style: blackTextStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: medium,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.check,
                  color: greenColor,
                  size: 24.w,
                ),
              ),
            ],
          ));
    }

    Widget input(String title, String fild, EdgeInsets margin) {
      return Container(
        margin: margin,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title,
            style: greyTextStyle.copyWith(fontSize: 13.sp),
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: fild,
                hintStyle: blackTextStyle.copyWith(fontSize: 14.sp),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greyColor))),
          )
        ]),
      );
    }

    Widget content() {
      return Container(
        color: whiteBackgorund,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 20.w),
            width: 100.w,
            height: 100.w,
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: yellowColor)),
            child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(user.profilePhotoUrl!),
                        fit: BoxFit.cover))),
          ),
          input("Name", "${user.name}", EdgeInsets.only(top: 30.w)),
          input("Username", "${user.username}", EdgeInsets.only(top: 20.w)),
          input("Email Address", "${user.email}", EdgeInsets.only(top: 20.w)),
        ]),
      );
    }

    return Scaffold(
      appBar: header(),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
