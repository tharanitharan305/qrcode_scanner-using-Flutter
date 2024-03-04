import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qrcode_scanner/ScanQR.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

class GenerateQr extends StatefulWidget {
  State<GenerateQr> createState() => _GenerateQrState();
}

class _GenerateQrState extends State<GenerateQr> {
  String? qrdata;
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Generate Qr"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ScanQr()));
                },
                icon: Icon(Icons.qr_code_scanner_rounded))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              TextField(
                onSubmitted: (data) {
                  setState(() {
                    qrdata = data;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              if (qrdata != null)
                PrettyQrView.data(
                    data: qrdata!,
                    decoration: PrettyQrDecoration(
                        image: PrettyQrDecorationImage(
                            image: AssetImage('assets/tamil.png'))))
            ],
          ),
        ));
  }
}
