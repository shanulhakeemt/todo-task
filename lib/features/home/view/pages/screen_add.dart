import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_task/features/home/model/user_model.dart';
import 'package:todo_task/features/home/view/widgets/custom_button.dart';
import 'package:todo_task/features/home/view/widgets/custom_field.dart';
import 'package:todo_task/features/home/viewmodel/home_viewmodel.dart';

class ScreenAdd extends ConsumerStatefulWidget {
  static MaterialPageRoute route() {
    return MaterialPageRoute(
      builder: (context) => const ScreenAdd(),
    );
  }

  const ScreenAdd({super.key});

  @override
  ConsumerState<ScreenAdd> createState() => _ScreenAddState();
}

class _ScreenAddState extends ConsumerState<ScreenAdd> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              "Create +",
              style: GoogleFonts.poppins(fontSize: 50),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomField(hintText: "Name", controller: nameController),
            const SizedBox(
              height: 20,
            ),
            CustomField(hintText: "Age", controller: ageController),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              height: 50,
              width: 250,
              onTap: () async {
                await ref.read(homeViewmodelProvider.notifier).addUser(
                  UserModel(name: nameController.text.trim(), 
                  age: int.tryParse(ageController.text.trim())
                  )
                );
              },
              text: "Create",
            )
          ],
        ),
      ),
    );
  }
}
