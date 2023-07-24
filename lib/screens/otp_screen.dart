import 'dart:async';

import 'package:distressed_property/screens/mainscreen.dart';
import 'package:distressed_property/theme/color_theme.dart';
import 'package:distressed_property/theme/textstyle.dart';
import 'package:distressed_property/widgets/failedalert.dart';
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
  bool _verifyingOTP = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
    _listenForSMS();
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
    setState(() {
      _verifyingOTP = true;
    });
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
    setState(() {
      _verifyingOTP = false;
    });
  }

  void _signInWithOTP(String smsCode) async {
    setState(() {
      _verifyingOTP = true;
    });
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: smsCode,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      // OTP verification completed, navigate to the main screen
      _navigateToMainScreen();
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const FailedAlertDialog();
        },
      );
      // Handle invalid OTP or other errors during verification
      print('Verification Error: $e');
    }
    setState(() {
      _verifyingOTP = false;
    });
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
    double baseWidth = 430;
    double w = MediaQuery.of(context).size.width / baseWidth;
    double ww = w * 0.97;
    final defaultPinTheme = PinTheme(
      width: 48 * w,
      height: 48 * w,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(217, 217, 217, 1.0)),
        borderRadius: BorderRadius.circular(4 * w),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(217, 217, 217, 1.0)),
      borderRadius: BorderRadius.circular(4 * w),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16 * w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 64 * w,
                  width: 64 * w,
                  decoration: BoxDecoration(
                    color: MyColorTheme.primaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(78 * w),
                      bottomRight: Radius.circular(78 * w),
                    ),
                  ),
                ),
                SizedBox(height: 48 * w),
                Center(
                  child: SizedBox(
                    height: 91 * w,
                    width: 111 * w,
                    child: Image.asset("assets/images/verifyotp.png"),
                  ),
                ),
                SizedBox(height: 34 * w),
                Center(
                  child: Text(
                    "OTP Verification",
                    style: editTextStyle(
                      fontSize: 28 * ww,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                SizedBox(height: 16 * w),
                Text(
                  "Enter verification code sent to your +91-${widget.phoneNumber}",
                  style: editTextStyle(
                    fontSize: 18 * ww,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff5e5e5e),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32 * w),
                Center(
                  child: _verifyingOTP
                      ? CircularProgressIndicator() // Show circular progress indicator
                      : Pinput(
                          length: 6,
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: focusedPinTheme,
                          submittedPinTheme: submittedPinTheme,
                          controller: _otpController,
                          pinputAutovalidateMode:
                              PinputAutovalidateMode.onSubmit,
                          // Enable auto-validation
                          showCursor: true,
                          onCompleted: (pin) {
                            _signInWithOTP(
                                pin); // Call _signInWithOTP with the entered PIN
                          },
                        ),
                ),
                SizedBox(height: 25 * w),
                Center(
                  child: SizedBox(
                    height: 52 * w,
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
                          fontSize: 14 * ww,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
