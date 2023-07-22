import 'package:distressed_property/theme/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                padding: const EdgeInsets.only(left: 30, top: 30),
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
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Text(
                            "Kkunal Shah",
                            style: editTextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff2454FF)),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none,
                          size: 30,
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 174,
                    height: 124,
                    decoration: BoxDecoration(
                      color: const Color(0xffFAD1CA),
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Inspection",
                          style: editTextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Text(
                          "22",
                          style: editTextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Text(
                          "Pending",
                          style: editTextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.red),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 174,
                    height: 124,
                    decoration: BoxDecoration(
                      color: const Color(0xff7795ff),
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Inspection",
                          style: editTextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Text(
                          "30",
                          style: editTextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Text(
                          "Completed",
                          style: editTextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28, top: 26),
                child: Text(
                  "Recent update",
                  style: editMetropolisTextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28, top: 7),
                child: Text(
                  "TODAY",
                  style: editMetropolisTextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 33, top: 7),
                    child: Container(
                      height: 185,
                      width: 368,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          color: Color(0xFFEEF6F9),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 18, top: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Visit on :",
                                  style: editMetropolisTextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "20th MAY 10:20AM",
                                  style: editMetropolisTextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18, top: 10),
                            child: Text(
                              "Sethna Elron Gardens",
                              style: editMetropolisTextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18, top: 10),
                            child: Text(
                              "Bandra West, Mumbai South ..",
                              style: editMetropolisTextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Divider(
                            thickness: 0.5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: Text(
                                  "Pending",
                                  style: editTextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffF36F56)),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.phone_outlined),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18, right: 15),
                                    child: PopupMenuButton(
                                      itemBuilder: (context) => [
                                        PopupMenuItem(
                                          child: Text(
                                            "View",
                                            style: editTextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xffF36F56)),
                                          ),
                                          onTap: () {},
                                        ),
                                        PopupMenuItem(
                                          child: Text(
                                            "Update",
                                            style: editTextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(
                                                    97, 101, 215, 1.0)),
                                          ),
                                          onTap: () {},
                                        ),
                                      ],
                                      icon: Icon(
                                        Icons.more_horiz,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 33, top: 15),
                    child: Container(
                      height: 185,
                      width: 368,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          color: Color.fromRGBO(222, 229, 255, 1.0),
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
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 18, top: 15, right: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "PID: 124127",
                                  style: editTextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                Text(
                                  "Approved",
                                  style: editMetropolisTextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(40, 180, 70, 1)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18, top: 10),
                            child: Text(
                              "Wilfred Apartment",
                              style: editMetropolisTextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18, top: 10),
                            child: Text(
                              "Bandra West, Mumbai South ..",
                              style: editMetropolisTextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Divider(
                            thickness: 0.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Text(
                              "Complete",
                              style: editTextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff2454ff)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
