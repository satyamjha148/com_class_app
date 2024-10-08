// ignore_for_file: must_be_immutable

import 'package:com_class/auth/login_view.dart';
import 'package:com_class/home/home_view.dart';
import 'package:com_class/widgets/buttons.dart';
import 'package:com_class/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

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
                "Register yourself with us",
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
              primaryTextFields('Your full name', name, [], (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              }, TextInputType.text, 'Enter your full name'),
              SizedBox(
                height: 20,
              ),
              primaryTextFields('Phone Number', phone, [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ], (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                } else if (value.length != 10) {
                  return 'Number is invalid';
                }
                return null;
              }, TextInputType.phone, 'Enter your phone number'),
              SizedBox(
                height: 20,
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
              Text(
                "Please select your interests",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (int i = 0; i < 3; i++)
                    ChoiceChip(label: Text('Python'), selected: true),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Please select your expertise",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (int i = 0; i < 3; i++)
                    ChoiceChip(label: Text('Python'), selected: true),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.020,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.040,
              ),
              appButton(context, 0.06, double.infinity, 16, () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeView(),
                  ),
                  ModalRoute.withName('/'),
                );
              }, "Register"),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginView(),
                      ));
                },
                child: Text(
                  "Already a member ? Login here!",
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
