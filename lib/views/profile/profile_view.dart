import 'package:flutter/material.dart';
import 'package:flutter_likeu/utils/app_colors.dart';
import 'package:flutter_likeu/views/profile/widget/menu_card.dart';
import 'package:flutter_likeu/views/profile/widget/heatmap_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  /// Local Storage save datas
  String name = 'UserName';
  String changeName = '';

  /// Hive Database
  final hivebox = Hive.box('users');

  @override
  void initState() {
    if (hivebox.get('name') == null) {
      hivebox.put('name', name);
    } else {
      name = hivebox.get('name');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// Show Profile Image and Name.
              _loadProfileImageAndName(),

              /// Show User Chart that commit date.
              const CustomHeatMapViewer(),

              /// Settings Menu.
              _settingsMenuList(context)
            ],
          ),
        ));
  }

  /// Load Menu List.
  Widget _settingsMenuList(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SettingMenuCard(
          menuNameString: "Menu Setting 1",
        ),
        SettingMenuCard(
          menuNameString: "Menu Setting 2",
        ),
        SettingMenuCard(
          menuNameString: "Menu Setting 3",
        ),
        SettingMenuCard(
          menuNameString: "Menu Setting 4",
        ),
        SettingMenuCard(
          menuNameString: "Menu Setting 5",
        ),
        Padding(padding: EdgeInsets.only(bottom: 100))
      ],
    );
  }

// Load Profile Image and User Name.
  Widget _loadProfileImageAndName() {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              "https://mblogthumb-phinf.pstatic.net/MjAyMjAxMjVfMjg0/MDAxNjQzMTAyOTg0Nzgz.sLrqOJ2S3r6pLboUm5yJTjB_JECC0zO9Tt3y_h86aJcg.w5VER_KDRAW3yRq8-nypsm2aGmKurM5YieSFcr1Vg0Qg.JPEG.minziminzi128/IMG_7374.JPG?type=w800",
            ),
          ),

          /// Space
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              IconButton(
                iconSize: 20,
                onPressed: () {
                  /// Edit Name.
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.grey,
                          child: SizedBox(
                            height: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextField(
                                    cursorColor: Colors.black,
                                    decoration: const InputDecoration(
                                      focusColor: AppColors.primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 3,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 3,
                                        ),
                                      ),
                                      labelText: 'Name',
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        changeName = value.toString();
                                      });
                                    },
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      if (changeName != '') {
                                        setState(() {
                                          name = changeName;
                                          changeName = '';
                                        });
                                        hivebox.put('name', name);
                                        Navigator.pop(context);
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          ),
                        );
                      });
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
