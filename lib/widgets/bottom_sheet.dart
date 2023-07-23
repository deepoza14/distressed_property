import 'package:distressed_property/screens/update_screen.dart';
import 'package:distressed_property/theme/textstyle.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double w = MediaQuery.of(context).size.width / baseWidth;
    double ww = w * 0.97;
    return ListView(
      // Replace Column with ListView
      shrinkWrap: true,
      physics: ClampingScrollPhysics(), // Disable scrolling bouncing effect
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30 * w, top: 20 * w),
          child: Row(
            children: [
              Text(
                "Visit on :",
                style: editMetropolisTextStyle(
                    fontSize: 18 * ww,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(width: 10 * w),
              Text(
                "20th MAY 10:10AM",
                style: editMetropolisTextStyle(
                    fontSize: 17 * ww,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30 * w, top: 0 * w),
          child: Text(
            "Parishram",
            style: editMetropolisTextStyle(
                fontSize: 43 * ww,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30 * w, top: 0 * w, right: 30 * w),
          child: Row(
            children: [
              Image.asset(
                "assets/images/map.png",
                height: 30 * w,
                width: 30 * w,
              ),
              SizedBox(
                width: 10 * w,
              ),
              Expanded(
                  child: Text(
                """203-A, Pandurang Asharam Marg, Bandra West, Mumbai, Maharashtra 400050""",
                style: editMetropolisTextStyle(
                    fontSize: 20 * ww,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30 * w, top: 15 * w, right: 30 * w),
          child: Row(
            children: [
              Image.asset(
                "assets/images/person"
                ".png",
                height: 30 * w,
                width: 30 * w,
              ),
              SizedBox(
                width: 10 * w,
              ),
              Text(
                "Harish Ch. Nandi",
                style: editMetropolisTextStyle(
                    fontSize: 22 * ww,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30 * w, top: 15 * w, right: 30 * w),
          child: Row(
            children: [
              Image.asset(
                "assets/images/appointment.png",
                height: 30 * w,
                width: 30 * w,
              ),
              SizedBox(
                width: 10 * w,
              ),
              Text(
                "Appointment",
                style: editTextStyle(
                    fontSize: 24 * ww,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 35 * w, top: 5 * w, bottom: 0 * w),
              child: Image.asset(
                "assets/images/phone.png",
                height: 52 * w,
                width: 52 * w,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 35 * w, top: 5 * w, bottom: 0, right: 35 * w),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UpdateScreen()));
                    },
                    child: Container(
                        height: 52 * w,
                        width: 268 * w,
                        decoration: const BoxDecoration(
                            color: Color(0xff2454FF),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Center(
                          child: Text(
                            "Inspection",
                            style: editTextStyle(
                                fontSize: 28 * ww,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ))),
              ),
            )
          ],
        )
      ],
    );
  }
}
