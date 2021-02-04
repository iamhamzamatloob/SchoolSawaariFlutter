import 'package:flutter/material.dart';
import 'package:school_sawaari_app/constants.dart';

class PaymentPage extends StatefulWidget {
  final String routeName = '/payment_page';
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Payment Page',
          style: TextStyle(
              fontFamily: 'Muli', color: Color(0XFF8B8B8B), fontSize: 18),
        ),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: kPrimaryColor,
        child: Center(child: Text('Payment'),),
      ),
    );
  }
}
