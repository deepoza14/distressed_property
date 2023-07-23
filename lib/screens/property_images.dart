import 'dart:io';

import 'package:distressed_property/theme/textstyle.dart';
import 'package:distressed_property/widgets/custom_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class PropertyImages extends StatefulWidget {
  const PropertyImages({super.key});

  @override
  State<PropertyImages> createState() => _PropertyImagesState();
}

class _PropertyImagesState extends State<PropertyImages> {
  File? _attachmentFile1;
  File? _attachmentFile2;

  Future<void> _pickFile1() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _attachmentFile1 = File(result.files.single.path!);
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Property Image",
          style: editMetropolisTextStyle(
              fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 15, left: 15),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  // Children will be expanded at the start

                  tilePadding: const EdgeInsets.all(0),
                  childrenPadding: const EdgeInsets.all(0),
                  title: Text(
                    "Housing Video",
                    style: editMetropolisTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Independent house or commercial 1min 20sec Inspection video",
                          style: editMetropolisTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: _pickFile1,
                                  child: Container(
                                    height: 92,
                                    width: 92,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff2454FF))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/images/camera.png"),
                                        Text(
                                          "Add Video",
                                          style: editMetropolisTextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    top: 20, bottom: 20, left: 10),
                                child: VerticalDivider(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 92,
                                  width: 92,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xff2454FF))),
                                  child: _attachmentFile1 != null
                                      ? Image.file(
                                          _attachmentFile1!,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          "assets/images/noimage.png",
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0, right: 15, left: 15),
                child: ExpansionTile(
                  tilePadding: const EdgeInsets.all(0),
                  childrenPadding: const EdgeInsets.all(0),
                  title: Text(
                    "Dining Room",
                    style: editMetropolisTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Independent house or commercial 1min 20sec Inspection video",
                          style: editMetropolisTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: _pickFile1,
                                  child: Container(
                                    height: 92,
                                    width: 92,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff2454FF))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/images/camera.png"),
                                        Text(
                                          "Add Video",
                                          style: editMetropolisTextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    top: 20, bottom: 20, left: 10),
                                child: VerticalDivider(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 92,
                                  width: 92,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xff2454FF))),
                                  child: _attachmentFile1 != null
                                      ? Image.file(_attachmentFile1!)
                                      : Image.asset(
                                          "assets/images/noimage.png"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0, right: 15, left: 15),
                child: ExpansionTile(
                  tilePadding: const EdgeInsets.all(0),
                  childrenPadding: const EdgeInsets.all(0),
                  title: Text(
                    "Master Bed Room",
                    style: editMetropolisTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Independent house or commercial 1min 20sec Inspection video",
                          style: editMetropolisTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 90,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 92,
                                  width: 92,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xff2454FF))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/images/camera.png"),
                                      Text(
                                        "Add Video",
                                        style: editMetropolisTextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    top: 20, bottom: 20, left: 10),
                                child: VerticalDivider(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, right: 15, left: 15),
                child: ExpansionTile(
                  tilePadding: const EdgeInsets.all(0),
                  childrenPadding: const EdgeInsets.all(0),
                  title: Text(
                    "Kitchen Room",
                    style: editMetropolisTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Independent house or commercial 1min 20sec Inspection video",
                          style: editMetropolisTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 92,
                                  width: 92,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xff2454FF))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/images/camera.png"),
                                      Text(
                                        "Add Video",
                                        style: editMetropolisTextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    top: 20, bottom: 20, left: 10),
                                child: VerticalDivider(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, right: 15, left: 15),
                child: ExpansionTile(
                  tilePadding: const EdgeInsets.all(0),
                  childrenPadding: const EdgeInsets.all(0),
                  title: Text(
                    "Hall Room",
                    style: editMetropolisTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Independent house or commercial 1min 20sec Inspection video",
                          style: editMetropolisTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: _pickFile1,
                                  child: Container(
                                    height: 92,
                                    width: 92,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff2454FF))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/images/camera.png"),
                                        Text(
                                          "Add Video",
                                          style: editMetropolisTextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    top: 20, bottom: 20, left: 10),
                                child: VerticalDivider(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 92,
                                  width: 92,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xff2454FF))),
                                  child: _attachmentFile1 != null
                                      ? Image.file(_attachmentFile1!)
                                      : Image.asset(
                                          "assets/images/noimage.png"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 32, right: 32, top: 10, bottom: 10),
        child: CustomButton(
            onPressed: () {},
            text: "Submit",
            color: const Color(0xFF2454FF),
            textColor: const Color(0xFFD9D9D9)),
      ),
    );
  }
}
