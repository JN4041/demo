import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Home_page_razer extends StatefulWidget {
  const Home_page_razer({Key? key}) : super(key: key);

  @override
  State<Home_page_razer> createState() => _Home_page_razerState();
}

class _Home_page_razerState extends State<Home_page_razer> {
  Razorpay? razorpay;
  @override
  void initState() {
    razorpay = Razorpay();
    razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, onsuss);
    razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, onerro);
    razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, onwall);
    // TODO: implement initState
    super.initState();
  }

  void onsuss(PaymentSuccessResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Suussful Payment Done${response.paymentId}")));
  }

  void onerro(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(response.message.toString())));
  }

  void onwall(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(response.walletName.toString())));
  }

  void OPCHAOUT() {
    var options1 = {
      'key': 'rzp_test_JkME7ZVukAqmpB',
      'amount': 100,
      'name': 'Radhe ShyamFashion.',
      'description': 'Fine T-Shirt',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '9328323188', 'email': 'jaydipnasit123@gmail.com'},
      'external': {
        'wallets': ['paytm'],
        'wallets': ['Google pay'],
      }
    };
    razorpay!.open(options1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: ElevatedButton(
                onPressed: () {
                  OPCHAOUT();
                },
                child: Text("Payment"),
              ))
        ],
      ),
    );
  }
}