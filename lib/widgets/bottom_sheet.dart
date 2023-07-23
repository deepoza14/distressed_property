import 'package:distressed_property/screens/update_screen.dart';
import 'package:distressed_property/theme/textstyle.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 50),
          child: Row(
            children: [
              Text(
                "Visit on :",
                style: editMetropolisTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const SizedBox(width: 10),
              Text(
                "20th MAY 10:10AM",
                style: editMetropolisTextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 22),
          child: Text(
            "Parishram",
            style: editMetropolisTextStyle(
                fontSize: 43, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 22, right: 30),
          child: Row(
            children: [
              Image.asset(
                "assets/images/map.png",
                height: 30,
                width: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                """203-A, Pandurang Asharam Marg, Bandra West, Mumbai, Maharashtra 400050""",
                style: editMetropolisTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 22, right: 30),
          child: Row(
            children: [
              Image.asset(
                "assets/images/person"
                ".png",
                height: 30,
                width: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Harish Ch. Nandi",
                style: editMetropolisTextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 22, right: 30),
          child: Row(
            children: [
              Image.asset(
                "assets/images/appointment.png",
                height: 30,
                width: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Appointment",
                style: editTextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 35, top: 5, bottom: 0),
              child: Image.asset(
                "assets/images/phone.png",
                height: 52,
                width: 52,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 35, top: 5, bottom: 0,right: 35),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateScreen()));
                    },
                    child: Container(
                        height: 52,
                        width: 268,
                        decoration: const BoxDecoration(
                            color: Color(0xff2454FF),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Center(
                          child: Text(
                            "Inspection",
                            style: editTextStyle(
                                fontSize: 28,
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
