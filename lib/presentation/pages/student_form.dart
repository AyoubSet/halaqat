import 'package:flutter/material.dart';
import 'package:halaqat/presentation/widgets/promo_view/form_date_field.dart';
import 'package:halaqat/presentation/widgets/promo_view/form_text_field.dart';
import 'package:halaqat/util/widgets/bg.dart';

class StudentForm extends StatelessWidget {
  const StudentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Bg(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FormTextField(
                        maxHeight: 40,
                        maxWidth: 150,
                      ),
                      FormTextField(
                        maxHeight: 40,
                        maxWidth: 150,
                      ),
                    ],
                  ),
                  FormTextField(
                    maxHeight: 40,
                    maxWidth: 325,
                  ),
                  FormDateField(),
                  FormTextField(
                    maxHeight: 40,
                    maxWidth: 325,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
