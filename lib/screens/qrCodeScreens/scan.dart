import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  String qrResult = 'Not yet Scanned';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text('RESULT',
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            textAlign: TextAlign.center),
        Text(qrResult,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0, color: Colors.white)),
        SizedBox(height: 20.0),
        Row(
          children: [
            SizedBox(width: 20),
            Expanded(
              child: FlatButton(
                  padding: EdgeInsets.all(15.0),
                  onPressed: () async {
                    ScanResult scanning = await BarcodeScanner.scan();
                    setState(() {
                      qrResult = scanning.rawContent;
                    });
                  },
                  child: Text('SCAN QR CODE',
                      style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.blue, width: 3.0))),
            ),
            SizedBox(width: 20),
          ],
        )
      ],
    );
  }
}
