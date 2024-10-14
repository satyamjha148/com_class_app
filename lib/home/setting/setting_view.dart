import 'package:com_class/pdf_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFa3f782),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Color(0xFF2f2f2f)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Settings",
            style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2f2f2f),
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.02,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                _buildSettingItem(context, "Account", Icons.person),
                _buildSettingItem(
                    context, "Notifications", Icons.notifications),
                _buildSettingItem(context, "Appearance", Icons.color_lens),
                _buildSettingItem(context, "Privacy", Icons.lock),
                _buildSettingItem(context, "Help & Support", Icons.help),
                _buildSettingItem(context, "About", Icons.info),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: PhysicalModel(
        color: Colors.white,
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          leading: Icon(icon, color: const Color(0xFF131c33)),
          title: Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            if (title == "About") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PDFViewScreen(
                    url:
                        'https://ewallet.staging.xpay.mv/api/v1/external-pdf?id=eyJpdiI6IkRsSEI2SFprSFlSSWRrUlBLbWNMWWc9PSIsInZhbHVlIjoiZTBOWklmSG50YWlzZDl5eHV5RkpOaHQ2SFwvUGdPXC9wMHgwMXYyWnNYSUkrYjhZQnZ1clpIUU9uK3JIa3FaUEtwQWhyQjFldU53ckVtcVpaWDNPRVBwWGh6eHF6UHh4Q2pMUGJlZHIyV1dhTT0iLCJtYWMiOiJkODM3ZTBkNDM2NzUzODYxZjE4Mjk4OWI3NjI2Zjk3YjliYWUzNzc3ZTkyNmYxM2U4Y2Q3MWM3ZmI3ZGQ1ZGI2In0=', // Replace with your PDF URL
                  ),
                ),
              );
            } else {
              // Handle other setting item taps
            }
          },
        ),
      ),
    );
  }
}
