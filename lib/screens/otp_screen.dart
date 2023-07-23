import 'dart:async';

import 'package:distressed_property/screens/mainscreen.dart';
import 'package:distressed_property/theme/color_theme.dart';
import 'package:distressed_property/theme/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  const OtpScreen(
      {super.key, required this.verificationId, required this.phoneNumber});

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
    _listenForSMS(); // Start listening for incoming SMS messages
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

    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
      _verifyPhoneNumber();
    }
  }

  void _listenForSMS() {
    SmsAutoFill().listenForCode; // Start listening for incoming SMS messages
    SmsAutoFill().code.listen((String? code) {
      if (code != null) {
        setState(() {
          _otpController.text = code;
        });
      }
    });
  }

  void _verifyPhoneNumber() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    verificationCompleted(AuthCredential credential) async {
      // Auto-retrieve the SMS code on Android devices
      await auth.signInWithCredential(credential);
      // OTP verification completed, navigate to the main screen
      _navigateToMainScreen();
    }

    verificationFailed(FirebaseAuthException e) {
      // Handle verification failure (e.g., the phone number format is incorrect)
      print('Verification Failed: $e');
    }

    codeSent(String verificationId, int? resendToken) async {
      // Save the verificationId to be used later
      // No need to set the widget.verificationId as it's already set in the constructor
    }

    codeAutoRetrievalTimeout(String verificationId) {
      // Handle timeout (e.g., when the code auto-retrieval time has elapsed)
    }

    await auth.verifyPhoneNumber(
      phoneNumber: '+91${widget.phoneNumber}',
      // Add the country code to the phone number
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void _signInWithOTP(String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: smsCode,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      // OTP verification completed, navigate to the main screen
      _navigateToMainScreen();
    } catch (e) {
      // Handle invalid OTP or other errors during verification
      print('Verification Error: $e');
    }
  }

  void _navigateToMainScreen() {
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MainAppScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 48,
      height: 48,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(217, 217, 217, 1.0)),
        borderRadius: BorderRadius.circular(4),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(217, 217, 217, 1.0)),
      borderRadius: BorderRadius.circular(4),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 31, horizontal: 14),
                child: Text(
                  "Enter verification code sent to your +91-${widget.phoneNumber}",
                  style: subtitleTextStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Pinput(
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  controller: _otpController,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  // Enable auto-validation
                  showCursor: true,
                  onCompleted: (pin) {
                    _signInWithOTP(
                        pin); // Call _signInWithOTP with the entered PIN
                  },
                ),
              ),
              const SizedBox(
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
