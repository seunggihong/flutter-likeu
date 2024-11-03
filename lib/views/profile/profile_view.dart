import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_likeu/extensions/space_exs.dart';
import 'package:flutter_likeu/utils/app_colors.dart';
import 'package:flutter_likeu/views/main/main_view.dart';
import 'package:flutter_likeu/views/profile/widget/menu_card.dart';
import 'package:flutter_likeu/views/profile/widget/heatmap_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
      ),
    );
  }

  /// Load Menu List.
  Widget _settingsMenuList(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _deleteAllDataBtn(context),
        Padding(
          padding: EdgeInsets.only(bottom: 100),
        )
      ],
    );
  }

  /// 전체 데이터 지우기 메뉴 버튼
  Widget _deleteAllDataBtn(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          CupertinoModalBottomSheetRoute(
            builder: (_) => Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "전체 데이터를 삭제 하시겠습니까?\n(데이터를 삭제할 경우 복구하실 수 없습니다.)",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    20.h,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => {
                            hivebox.delete('name'),
                            hivebox.delete('percent'),
                            Navigator.pop(context),
                            Navigator.pop(context),
                            Navigator.pop(context),
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => MainView(),
                              ),
                            )
                          },
                          child: Container(
                            width: 100,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "네",
                              style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        20.w,
                        GestureDetector(
                          onTap: () => {Navigator.pop(context)},
                          child: Container(
                            width: 100,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "아니요",
                              style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            expanded: false,
          ),
        )
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Text(
              "전체 데이터 지우기",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
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
