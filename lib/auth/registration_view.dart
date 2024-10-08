import 'package:com_class/auth/signup_view.dart';
import 'package:com_class/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class RegistartionView extends StatelessWidget {
  RegistartionView({super.key});

  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.40,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xFF131c33),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                  Text(
                    "ComClass",
                    style: GoogleFonts.roboto(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 23),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.040,
                  ),
                  Text(
                    "A platform for learning enthusiastic peers",
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.040,
                  ),
                  appButton(context, 0.06, double.infinity, 16, () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupView(),
                      ),
                      ModalRoute.withName('/'),
                    );
                  }, "Get Started")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
