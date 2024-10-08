import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedAppButton extends StatefulWidget {
  final BuildContext context;
  final double height;
  final double width;
  final double fontSize;
  final VoidCallback onTap;
  final String text;

  const AnimatedAppButton({
    Key? key,
    required this.context,
    required this.height,
    required this.width,
    required this.fontSize,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  _AnimatedAppButtonState createState() => _AnimatedAppButtonState();
}

class _AnimatedAppButtonState extends State<AnimatedAppButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        height: MediaQuery.of(widget.context).size.height * widget.height,
        width: MediaQuery.of(widget.context).size.width * widget.width,
        decoration: BoxDecoration(
          color: const Color(0xFFa3f782),
          borderRadius: BorderRadius.circular(60),
          boxShadow: _isPressed
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
        ),
        transform: Matrix4.identity()..scale(_isPressed ? 0.95 : 1.0),
        child: Center(
          child: Text(
            widget.text,
            style: GoogleFonts.roboto(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
              fontSize: widget.fontSize,
            ),
          ),
        ),
      ),
    );
  }
}

// You can keep the original function for backwards compatibility
Widget appButton(BuildContext context, double height, double width,
    double fontSize, void Function()? onTap, String text) {
  return AnimatedAppButton(
    context: context,
    height: height,
    width: width,
    fontSize: fontSize,
    onTap: onTap ?? () {},
    text: text,
  );
}
