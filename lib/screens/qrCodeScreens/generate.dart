import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Generate extends StatefulWidget {
  const Generate({Key? key}) : super(key: key);

  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  String qrData = 'https://google.com';
  double qrSize = 200.0;
  FocusNode _focus = new FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    if (_focus.hasFocus) {
      setState(() {
        qrSize = 50.0;
      });
    } else {
      setState(() {
        qrSize = 200.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              color: Colors.transparent,
              height: qrSize,
              child: QrImage(
                data: qrData,
                foregroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 15),
            TextField(
                controller: qrText,
                focusNode: _focus,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: 'Enter the code',
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                )),
            SizedBox(height: 15),
            Row(
              children: [
                SizedBox(width: 20),
                Expanded(
                  child: FlatButton(
                      padding: EdgeInsets.all(15.0),
                      onPressed: () async {
                        if (qrText.text.isEmpty) {
                          setState(() {
                            qrData = 'https://flutter.dev';
                          });
                        } else {
                          setState(() {
                            qrData = qrText.text;
                          });
                        }
                        FocusScope.of(context).unfocus();
                      },
                      child: Text('GENERATE QR CODE',
                          style: TextStyle(color: Colors.white)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: Colors.blue, width: 3.0))),
                ),
                SizedBox(width: 20),
              ],
            )
          ],
        ));
  }

  final qrText = TextEditingController();
}
