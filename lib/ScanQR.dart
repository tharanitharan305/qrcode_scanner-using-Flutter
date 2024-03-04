import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'generateQr.dart';

class ScanQr extends StatefulWidget {
  State<ScanQr> createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GenerateQr()));
              },
              icon: Icon(Icons.qr_code_2_rounded))
        ],
      ),
      body: MobileScanner(
        controller: MobileScannerController(
            detectionSpeed: DetectionSpeed.noDuplicates),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          final Uint8List? image = capture.image;
          for (final barcode in barcodes) {
            print(barcode.rawValue);
            showDialog(
                context: context,
                builder: (context) {
                  return GestureDetector(
                    onTap: () async {
                      Uri url = Uri.parse(barcodes.first.rawValue!);
                    },
                    child: AlertDialog(
                      title: Text(barcodes.first.rawValue!),
                    ),
                  );
                });
          }
          // if (image != null) {
          //   print("hai");
          //   showDialog(
          //       context: context,
          //       builder: (context) {
          //         return AlertDialog(
          //           title: Text(barcodes.first.rawValue!),
          //         );
          //       });
          // }
        },
      ),
    );
  }
}
