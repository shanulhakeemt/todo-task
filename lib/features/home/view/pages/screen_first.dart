import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_task/features/home/view/pages/screen_add.dart';
import 'package:todo_task/features/home/view/widgets/custom_floating_action.dart';
import 'package:todo_task/features/home/view/widgets/custom_user_card.dart';


class ScreenFirst extends StatelessWidget {
  const ScreenFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "All Users ",
          style: GoogleFonts.poppins(),
        ),
      ),
      floatingActionButton: CustomFloatingAction(
        icon: CupertinoIcons.add,
        onPress: () {
          // FirebaseFirestore
          Navigator.push(context, ScreenAdd.route());
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(vertical: 18),
            child: CustomUserCard(age: "22", name: "Shanu", height: 80),
          ),
        ),
      ),
    );
  }
}
