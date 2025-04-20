import 'package:flutter/material.dart';
import 'package:halaqat/presentation/widgets/promo_view/student_form.dart';
import 'package:halaqat/util/get_device_size.dart';
import 'package:halaqat/util/widgets/bg.dart';

class StudentFormPage extends StatefulWidget {
  const StudentFormPage({super.key});

  @override
  State<StudentFormPage> createState() => _StudentFormPageState();
}

class _StudentFormPageState extends State<StudentFormPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus!.unfocus,
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Bg(),
              Center(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add New Student",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.all(15)),
                    Text(
                      "Enter the new student informations",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    StudentForm(
                      height: screenHieght(context) * 0.8,
                      width: screenWidth(context) * 0.85,
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
