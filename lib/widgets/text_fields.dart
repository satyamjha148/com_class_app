import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

Widget primaryTextFields(
  String lable,
  TextEditingController controller,
  List<TextInputFormatter>? inputFormatters,
  String? Function(String?)? validator,
  TextInputType textInputType,
  String hint, {
  Widget? suffix,
  bool checkTooltip = false,
  bool? obscure,
  Widget? prefix,
  String? Function(String?)? onchanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            lable,
            style: GoogleFonts.roboto(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      TextFormField(
        obscureText: obscure ?? false,
        controller: controller,
        keyboardType: textInputType,
        textInputAction: TextInputAction.done,
        inputFormatters: inputFormatters,
        validator: validator,
        onChanged: onchanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          isDense: true,
          fillColor: Colors.white,
          hintText: hint,
          hintStyle: GoogleFonts.roboto(
              fontWeight: FontWeight.w400, color: Colors.black87, fontSize: 13),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(width: 1, color: Colors.black),
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(width: 1, color: Colors.black),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ],
  );
}
