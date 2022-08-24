import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:la_vie/provider/forums_provider.dart';
import 'package:la_vie/provider/plant_provider.dart';
import 'package:la_vie/utils/color.dart';
import 'package:la_vie/utils/constants.dart';
import 'package:la_vie/utils/my_icons_icons.dart';
import 'package:la_vie/utils/screen.dart';
import 'package:la_vie/views/components/forums.dart';
import 'package:provider/provider.dart';

import '../../components/custom_text.dart';

class CreatePostScreen extends StatefulWidget {
  CreatePostScreen({Key? key}) : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  File? image;

  @override
  Widget build(BuildContext context) {
    Screen(context);
    final provider = Provider.of<Forums>(context).allForums;
    var titleController;
    var descriptionController;
    String img64;

    return Scaffold(
      body: Form(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Screen.screenWidth / (428 / 24),
                vertical: Screen.screenHeight / (926 / 50)),
            child: Column(
              children: [
                Row(children: [
                  Expanded(
                    child: Stack(
                      children: [
                        InkWell(
                            child: const Icon(Icons.arrow_back),
                            onTap: () {
                              Navigator.of(context).pop();
                            }),
                        Align(
                          alignment: Alignment.topCenter,
                          child: customText(
                            text: "Create New Post",
                            fontWeight: FontWeight.w700,
                            fontSize: 21,
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
                Padding(
                  padding:
                      EdgeInsets.only(top: Screen.screenHeight / (926 / 61)),
                  child: GestureDetector(
                    child: Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          border:
                              Border.all(width: 1, color: AppColors.primary)),
                      child: image == null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset(
                                "assets/images/add_photo.png",
                                fit: BoxFit.cover,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.file(
                                image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    onTap: () async {
                      try {
                        final image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (image == null) return;
                        final imageTemporary = File(image.path);
                        setState(() {
                          this.image = imageTemporary;
                        });
                        // print("jkjlklkjl ${image.name}");
                        final bytes = await File(image.name).readAsBytes();
                        img64 = base64Encode(bytes);
                      } on PlatformException catch (e) {
                        print("Faild to pick image $e");
                      }
                    },
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Title',
                        style: TextStyle(color: AppColors.textFieldLabel)),
                    const SizedBox(height: 2),
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(),
                      ),
                      validator: (input) {
                        if (input!.isEmpty) {
                          return "Title is empty";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        // _authData['password'] = val!;
                      },
                    ),
                  ],
                ),
                SizedBox(height: Screen.screenHeight / (926 / 10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Description',
                        style: TextStyle(color: AppColors.textFieldLabel)),
                    const SizedBox(height: 2),
                    TextFormField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(),
                      ),
                      validator: (input) {
                        if (input!.isEmpty) {
                          return "Description is empty";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        // _authData['password'] = val!;
                      },
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text("Sign up"),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.primary)),
                        onPressed: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
