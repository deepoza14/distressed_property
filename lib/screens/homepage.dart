import 'package:distressed_property/screens/update_screen.dart';
import 'package:distressed_property/theme/textstyle.dart';
import 'package:distressed_property/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
                    padding: EdgeInsets.only(left: 30 * w, top: 30 * w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hi, Good Morning",
                                style: editTextStyle(
                                    fontSize: 24 * ww,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              Text(
                                "Kkunal Shah",
                                style: editTextStyle(
                                    fontSize: 22 * ww,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff2454FF)),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications_none,
                              size: 30 * w,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20 * w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 174 * w,
                        height: 124 * w,
                        decoration: BoxDecoration(
                          color: const Color(0xffFAD1CA),
                          borderRadius:
                              BorderRadius.all(Radius.circular(2 * w)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Text(
                                "Inspection",
                                style: editTextStyle(
                                    fontSize: 26 * ww,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "22",
                                style: editTextStyle(
                                    fontSize: 30 * ww,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Pending",
                                style: editTextStyle(
                                    fontSize: 20 * ww,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 174 * w,
                        height: 124 * w,
                        decoration: BoxDecoration(
                          color: const Color(0xff7795ff),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(2)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Text(
                                "Inspection",
                                style: editTextStyle(
                                    fontSize: 26 * ww,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "30",
                                style: editTextStyle(
                                    fontSize: 30 * ww,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Completed",
                                style: editTextStyle(
                                    fontSize: 20 * ww,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 28 * w, top: 26 * w),
                    child: Text(
                      "Recent update",
                      style: editMetropolisTextStyle(
                          fontSize: 28 * ww,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 28 * w, top: 7 * w),
                    child: Text(
                      "TODAY",
                      style: editMetropolisTextStyle(
                          fontSize: 18 * ww,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 30 * w, right: 33 * w, top: 7 * w),
                    child: Container(
                      height: 185 * w,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(6 * w)),
                          color: const Color(0xFFEEF6F9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 18 * w, top: 15 * w),
                              child: Row(
                                children: [
                                  Text(
                                    "Visit on :",
                                    style: editMetropolisTextStyle(
                                        fontSize: 18 * ww,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 10 * w,
                                  ),
                                  Text(
                                    "20th MAY 10:20AM",
                                    style: editMetropolisTextStyle(
                                        fontSize: 17 * ww,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 18 * w, top: 10 * w),
                              child: Text(
                                "Sethna Elron Gardens",
                                style: editMetropolisTextStyle(
                                    fontSize: 22 * ww,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 18 * w, top: 10 * w),
                              child: Text(
                                "Bandra West, Mumbai South ..",
                                style: editMetropolisTextStyle(
                                    fontSize: 18 * ww,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 0.5,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 18 * w),
                                  child: Text(
                                    "Pending",
                                    style: editTextStyle(
                                        fontSize: 18 * ww,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xffF36F56)),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.phone_outlined),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 18 * w, right: 15 * w),
                                      child: PopupMenuButton(
                                        itemBuilder: (context) => [
                                          PopupMenuItem(
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                                showModalBottomSheet(
                                                    context: context,
                                                    builder: (context) =>
                                                        const CustomBottomSheet());
                                              },
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "View",
                                                    style: editTextStyle(
                                                      fontSize: 22 * ww,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: const Color(
                                                          0xffF36F56),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          PopupMenuItem(
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const UpdateScreen()));
                                              },
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Update",
                                                    style: editTextStyle(
                                                      fontSize: 22 * ww,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          const Color.fromRGBO(
                                                              97,
                                                              101,
                                                              215,
                                                              1.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                        icon: const Icon(
                                          Icons.more_horiz,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 30 * w, right: 33 * w, top: 15 * w),
                    child: Container(
                      height: 185 * w,
                      width: 368 * w,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(6 * w)),
                          color: const Color.fromRGBO(222, 229, 255, 1.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 18 * w, top: 15 * w, right: 18 * w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "PID: 124127",
                                    style: editTextStyle(
                                        fontSize: 15 * ww,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "Approved",
                                    style: editMetropolisTextStyle(
                                        fontSize: 18 * ww,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromRGBO(
                                            40, 180, 70, 1)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 18 * w, top: 10 * w),
                              child: Text(
                                "Wilfred Apartment",
                                style: editMetropolisTextStyle(
                                    fontSize: 24 * ww,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 18 * w, top: 10 * w),
                              child: Text(
                                "Bandra West, Mumbai South ..",
                                style: editMetropolisTextStyle(
                                    fontSize: 18 * w,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 0.5,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 18 * w),
                              child: Text(
                                "Complete",
                                style: editTextStyle(
                                    fontSize: 18 * ww,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff2454ff)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
