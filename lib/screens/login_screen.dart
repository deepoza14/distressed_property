import 'package:distressed_property/screens/otp_screen.dart';
import 'package:distressed_property/theme/color_theme.dart';
import 'package:distressed_property/theme/textstyle.dart';
import 'package:distressed_property/widgets/failedalert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    phoneController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = phoneController.text.trim().length == 10;
    });
  }

  Future<void> verifyPhoneNumber(
      String phoneNumber, BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: '+91$phoneNumber',
      // Add the country code to the phone number
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieve the SMS code on Android devices
        await auth.signInWithCredential(credential);
        // You can navigate to the next screen here
        // (Optional: If you want to navigate to another screen, do it here)
      },
      verificationFailed: (FirebaseAuthException e) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const FailedAlertDialog();
          },
        );
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Save the verificationId and navigate to the OTPScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(
              verificationId: verificationId,
              phoneNumber: phoneNumber,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle timeout (e.g., when the code auto-retrieval time has elapsed)
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double baseWidth = 430;
            double screenWidth = constraints.maxWidth;
            double w = screenWidth / baseWidth;
            double ww = w * 0.97;

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(32 * w, 0 * w, 32 * w, 0 * w),
                    child: Container(
                      width: 64 * w,
                      height: 64 * w,
                      decoration: BoxDecoration(
                          color: MyColorTheme.primaryColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(78 * w),
                              bottomRight: Radius.circular(78 * w))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32 * w, top: 83 * w),
                    child: Text(
                      "Hey,\nLogin Now.",
                      style: editTextStyle(
                          fontSize: 28 * ww,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32 * w, top: 26 * w),
                    child: Text(
                      "Time to log in, property veteran!",
                      style: editTextStyle(
                          fontSize: 22 * ww,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 32 * w, top: 53 * w, right: 32 * w),
                    child: TextFormField(
                      controller: phoneController,
                      style: editTextStyle(
                        fontSize: 24 * ww,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF000000),
                      ),
                      keyboardType: TextInputType.number,
                      // Set the keyboard type to number
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        // Limit the input to 10 characters
                      ],
                      decoration: InputDecoration(
                        labelText: "Mobile No. ",
                        labelStyle: TextStyle(
                          fontSize: 22 * ww,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF000000),
                        ),
                        prefixText: " +91 | ",
                        prefixStyle: editTextStyle(
                          fontSize: 24 * ww,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF000000),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          // Set the border radius to 6
                          borderSide: const BorderSide(
                            color: Color(0xFF5F5F5F), // #5F5F5F color
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          // Set the border radius to 6
                          borderSide: const BorderSide(
                            color: Color(0xFF5F5F5F), // #5F5F5F color
                            width: 1.0, // 2px width
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 32, top: 65, right: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 62 * w,
                      child: ElevatedButton(
                        onPressed: isButtonEnabled
                            ? () => verifyPhoneNumber(
                                  phoneController.text.trim(),
                                  context,
                                )
                            : null,
                        // Use the isButtonEnabled variable to determine whether the button should be enabled or not
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            isButtonEnabled
                                ? const Color(0xff2454ff)
                                : const Color(0xffd9d9d9),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6 * w),
                            ),
                          ),
                        ),
                        child: Text(
                          "Send OTP",
                          style: TextStyle(
                            // Update the TextStyle to have white color
                            fontSize: 22 * ww,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
