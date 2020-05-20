import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File pdf;
  PDFDocument doc;

  void pdfview() async {
    pdf = await FilePicker.getFile();
    print(pdf);
    doc = await PDFDocument.fromFile(pdf);
    setState(() {
      doc = doc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Download the PDF",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Watch Your PDF",
          ),
          centerTitle: true,
        ),
        body: Builder(
          builder: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () => pdfview(),
                  child: Text(
                    "Select PDF File",
                  ),
                ),
                doc == null
                    ? Center()
                    : Container(
                        height: MediaQuery.of(context).size.height,
                        child: PDFViewer(
                          document: doc,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
