import 'package:distressed_property/screens/property_images.dart';
import 'package:distressed_property/theme/textstyle.dart';
import 'package:distressed_property/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {

  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double w = MediaQuery.of(context).size.width / baseWidth;
    double ww = w * 0.97;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Property Inspection",
          style: editMetropolisTextStyle(
              fontSize: 22*ww, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    leading: Image.asset("assets/images/profile.png"),
                    title: Text(
                      "Property Owner",
                      style: editMetropolisTextStyle(
                        fontSize: 22*ww,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Image.asset("assets/images/verification_successfull.png"),
                         SizedBox(
                          width: 4*w,
                        ),
                        Text(
                          "Verification Successful",
                          style: editMetropolisTextStyle(
                            fontSize: 18*ww,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff28B446),
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/images/arrow.png"),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset("assets/images/profile.png"),
                    title: Text(
                      "Property Address",
                      style: editMetropolisTextStyle(
                          fontSize: 22*ww,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    subtitle: Expanded(
                      child: Row(
                        children: [
                          Image.asset("assets/images/verification_successfull.png"),
                           SizedBox(
                            width: 4*w,
                          ),
                          Text(
                            "Verification Succesfull",
                            style: editMetropolisTextStyle(
                                fontSize: 18*ww,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff28B446)),
                          ),
                        ],
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/images/arrow.png",
                        height: 35*w,
                        width: 35*w,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset("assets/images/property.png"),
                    title: Text(
                      "Property Details",
                      style: editMetropolisTextStyle(
                          fontSize: 22*ww,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    subtitle: Row(
                      children: [
                        Image.asset("assets/images/verification_pending.png"),
                         SizedBox(
                          width: 4*w,
                        ),
                        Text(
                          "Verification Pending",
                          style: editMetropolisTextStyle(
                              fontSize: 18*ww,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xffFFA450)),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/images/arrow.png"),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset("assets/images/amenities.png"),
                    title: Text(
                      "Amenities & Features",
                      style: editMetropolisTextStyle(
                          fontSize: 22*ww,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    subtitle: Row(
                      children: [
                        Image.asset("assets/images/verification_pending.png"),
                         SizedBox(
                          width: 4*w,
                        ),
                        Text(
                          "Verification Pending",
                          style: editMetropolisTextStyle(
                              fontSize: 18*ww,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xffFFA450)),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/images/arrow.png"),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset("assets/images/property_images.png"),
                    title: Text(
                      "Property Images",
                      style: editMetropolisTextStyle(
                          fontSize: 22*ww,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    subtitle: Row(
                      children: [
                        Image.asset("assets/images/verification_pending.png"),
                         SizedBox(
                          width: 4*w,
                        ),
                        Text(
                          "Verification Pending",
                          style: editMetropolisTextStyle(
                              fontSize: 18*ww,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xffFFA450)),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PropertyImages()));
                      },
                      icon: Image.asset("assets/images/arrow.png"),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset("assets/images/property_documents.png"),
                    title: Text(
                      "Property Document",
                      style: editMetropolisTextStyle(
                          fontSize: 22*ww,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    subtitle: Row(
                      children: [
                        Image.asset("assets/images/verification_pending.png"),
                         SizedBox(
                          width: 4*w,
                        ),
                        Text(
                          "Verification Pending",
                          style: editMetropolisTextStyle(
                              fontSize: 18*ww,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xffFFA450)),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/images/arrow.png"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
             EdgeInsets.only(left: 32*w, right: 32*w, top: 10*w, bottom: 10*w),
        child: CustomButton(
          onPressed: () {},
          text: "Submit", color: const Color(0xffd9d9d9), textColor: const Color(0xFF5F5F5F)),

      ),
    );
  }
}
