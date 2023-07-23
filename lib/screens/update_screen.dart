import 'package:distressed_property/theme/textstyle.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Property Inspection",
          style: editMetropolisTextStyle(
              fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: Image.asset("assets/images/profile.png"),
                  title: Text(
                    "Property Owner",
                    style: editMetropolisTextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Image.asset("assets/images/verification_successfull.png"),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Verification Successful",
                        style: editMetropolisTextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff28B446),
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
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  subtitle: Row(
                    children: [
                      Image.asset("assets/images/verification_successfull.png"),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Verification Succesfull",
                        style: editMetropolisTextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff28B446)),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/images/arrow.png",height: 35,width: 35,),
                  ),
                ),
                ListTile(
                  leading: Image.asset("assets/images/property.png"),
                  title: Text(
                    "Property Details",
                    style: editMetropolisTextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  subtitle: Row(
                    children: [
                      Image.asset("assets/images/verification_pending.png"),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Verification Pending",
                        style: editMetropolisTextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFA450)),
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
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  subtitle: Row(
                    children: [
                      Image.asset("assets/images/verification_pending.png"),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Verification Pending",
                        style: editMetropolisTextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFA450)),
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
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  subtitle: Row(
                    children: [
                      Image.asset("assets/images/verification_pending.png"),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Verification Pending",
                        style: editMetropolisTextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFA450)),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/images/arrow.png"),
                  ),
                ),
                ListTile(
                  leading: Image.asset("assets/images/property_documents.png"),
                  title: Text(
                    "Property Document",
                    style: editMetropolisTextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  subtitle: Row(
                    children: [
                      Image.asset("assets/images/verification_pending.png"),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Verification Pending",
                        style: editMetropolisTextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFA450)),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/images/arrow.png"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
