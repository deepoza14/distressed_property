import 'dart:async';

import 'package:distressed_property/theme/color_theme.dart';
import 'package:distressed_property/theme/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool _enableResend = false;
  int _resendSeconds = 30;
  Timer? _resendTimer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _stopTimer(); // Cancel the previous timer if exists

    setState(() {
      _resendSeconds = 30; // Reset the timer to 30 seconds
      _enableResend = false;
    });

    _resendTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_resendSeconds == 0) {
        _stopTimer();
        setState(() {
          _enableResend = true;
        });
      } else {
        setState(() {
          _resendSeconds--;
        });
      }
    });
  }

  void _stopTimer() {
    _resendTimer?.cancel();
  }

  void _handleResendClick() {
    if (_enableResend) {
      _otpController.clear(); // Clear the OTP input field
      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 48,
      height: 48,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(217, 217, 217, 1.0)),
        borderRadius: BorderRadius.circular(4),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(217, 217, 217, 1.0)),
      borderRadius: BorderRadius.circular(4),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 32, top: 16),
                child: Container(
                  height: 64,
                  width: 64,
                  decoration: const BoxDecoration(
                      color: MyColorTheme.primaryColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(78),
                          bottomRight: Radius.circular(78))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 154, top: 58, right: 180),
                child: SizedBox(
                  height: 91,
                  width: 111,
                  child: Image.asset(
                    "assets/images/verifyotp.png",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 85, top: 34),
                child: Text(
                  "OTP Verification",
                  style: titleTextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 31, horizontal: 14),
                child: Text(
                  "Enter verification code sent your +91-9876XXXX10",
                  style: subtitleTextStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Pinput(
                  length: 4,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  controller: _otpController,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) {},
                  onChanged: (value) {
                    //listenForOTP();
                  },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _handleResendClick,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      _enableResend
                          ? "Resend SMS"
                          : "Resend SMS in $_resendSeconds s",
                      style: editTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
