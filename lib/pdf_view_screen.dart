import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as path;

class PDFViewScreen extends StatefulWidget {
  final String url;

  const PDFViewScreen({Key? key, required this.url}) : super(key: key);

  @override
  _PDFViewScreenState createState() => _PDFViewScreenState();
}

class _PDFViewScreenState extends State<PDFViewScreen> {
  String? localPath;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    downloadFile();
  }

  Future<void> downloadFile() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final response = await http.get(Uri.parse(widget.url));
      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        final filename = 'downloaded_pdf.pdf';
        final dir = await getApplicationDocumentsDirectory();
        final file = File('${dir.path}/$filename');
        await file.writeAsBytes(bytes, flush: true);
        setState(() {
          localPath = file.path;
          isLoading = false;
        });
      } else {
        throw Exception('Failed to download file: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error downloading PDF: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(child: Text(errorMessage!))
              : PDFView(
                  filePath: localPath!,
                  enableSwipe: true,
                  swipeHorizontal: true,
                  autoSpacing: false,
                  pageFling: false,
                  onError: (error) {
                    setState(() {
                      errorMessage = error.toString();
                    });
                  },
                ),
    );
  }
}
