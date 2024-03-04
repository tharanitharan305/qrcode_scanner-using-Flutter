import 'package:flutter/material.dart';
import 'package:qrcode_scanner/ScanQR.dart';
import 'package:qrcode_scanner/generateQr.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GenerateQr(),
  ));
}
