import 'package:distressed_property/screens/otp_screen.dart';
import 'package:distressed_property/theme/color_theme.dart';
import 'package:distressed_property/theme/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    // Add a listener to the phoneController to check the text length and enable the button accordingly
    phoneController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = phoneController.text.trim().length == 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 32, top: 63),
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
                padding: const EdgeInsets.only(left: 32, top: 83),
                child: Text(
                  "Hey,\nLogin Now.",
                  style: titleTextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, top: 26),
                child: Text(
                  "Time to log in, property veteran!",
                  style: subtitleTextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, top: 53, right: 32),
                child: TextFormField(
                  controller: phoneController,
                  style: editTextStyle(
                    fontSize: 24,
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
                    labelStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF000000),
                    ),
                    prefixText: " +91 | ",
                    prefixStyle: editTextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF000000),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      // Set the border radius to 6
                      borderSide: const BorderSide(
                        color: Color(0xFF5F5F5F), // #5F5F5F color
                        width: 2.0, // 2px width
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      // Set the border radius to 6
                      borderSide: const BorderSide(
                        color: Color(0xFF5F5F5F), // #5F5F5F color
                        width: 2.0, // 2px width
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, top: 65, right: 32),
                child: SizedBox(
                  width: 366,
                  height: 62,
                  child: ElevatedButton(
                    onPressed: isButtonEnabled ? navigateToAnotherScreen : null,
                    // Use the isButtonEnabled variable to determine whether the button should be enabled or not
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isButtonEnabled
                              ? const Color(0xff2454ff)
                              : const Color(0xffd9d9d9)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Send OTP",
                      style: TextStyle(
                        // Update the TextStyle to have white color
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.white, // Change the text color to white
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

  void navigateToAnotherScreen() {
    // Implement the navigation logic here
    // For example, you can use Navigator to push a new screen:
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OtpScreen()),
    );
  }
}
