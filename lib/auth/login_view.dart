import 'package:com_class/home/bottom_bar_view.dart';
import 'package:com_class/widgets/buttons.dart';
import 'package:com_class/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginView({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Login Here ;)",
                style: GoogleFonts.roboto(
                    color: Color(0xFF2F2F2F),
                    fontSize: 23,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Center(
                child: Text(
                  "Learn without any limits",
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              primaryTextFields('E-mail Address', email, [], (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email address';
                }
                return null;
              }, TextInputType.emailAddress, 'Enter your email address'),
              SizedBox(
                height: 20,
              ),
              primaryTextFields('Password', password, [], (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              }, TextInputType.visiblePassword, 'Enter your password'),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.050,
              ),
              appButton(context, 0.06, double.infinity, 16, () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomBarView(),
                  ),
                  ModalRoute.withName('/'),
                );
              }, "Login"),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Not a member ? Register here!",
                  style: GoogleFonts.roboto(
                      fontSize: 13,
                      color: Color(0xFF2F2F2F),
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
