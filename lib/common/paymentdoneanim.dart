import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class PaymentDoneAnim extends StatelessWidget {
  const PaymentDoneAnim({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Lottie.asset('assets/lottieefiles/paymentdone.json'),
        ),
      ),
    );
  }
}
