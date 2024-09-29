import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Container(
                  decoration: BoxDecoration(color: Colors.red),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Container(
                  decoration: BoxDecoration(color: Colors.blue),
                ),
              )
            ],
          ),
        ));
  }
}
