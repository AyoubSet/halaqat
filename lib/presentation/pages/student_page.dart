import 'package:flutter/material.dart';
import 'package:halaqat/data/data_source/promos_service.dart';
import 'package:halaqat/data/data_source/student_service.dart';
import 'package:halaqat/data/models/student_info_db.dart';
import 'package:halaqat/util/constants/routes.dart';
import 'package:halaqat/util/widgets/progress_indicator.dart';
import 'package:halaqat/util/widgets/square_iconed_button.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final _studentService = StudentService();
  final _promoService = PromoService();

  @override
  Widget build(BuildContext context) {
    final currentPromo = _promoService.currentPromo;

    if (currentPromo == null) {
      return const Center(child: Text('No Promo Selected'));
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        margin: const EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height * 0.82,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Center(
          child: Stack(children: [
            FutureBuilder(
              future: _studentService.cacheStudents(currentPromo.id),
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const PIndicator();
                }
                return StreamBuilder<List<DataBaseStudentInformation>>(
                  stream: _studentService.studentStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const PIndicator();
                    }
            
                    if (snapshot.hasError) {
                      return const Center(
                          child: Text('Error loading students',
                              style: TextStyle(color: Colors.white)));
                    }
            
                    final students = snapshot.data ?? [];
            
                    if (students.isEmpty) {
                      return Center(
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          height: MediaQuery.of(context).size.height * 0.82,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Stack(
                            children: [
                              const Center(
                                child: Text("No Student Found",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
            
                    return SizedBox(
                      height: 900,
                      width: 500,
                      child: ListView.builder(
                        itemCount: students.length,
                        itemBuilder: (context, index) {
                          final student = students[index];
                          return ListTile(
                            title: Text("${student.fn} ${student.ln}"),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SquareIconedButton(
                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                message: "Add Student",
                onPress: () => pushForm(context),
                child: const Icon(Icons.add),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

void pushForm(BuildContext context) {
  Navigator.pushNamedAndRemoveUntil(context, studentForm, (route) => false);
}
