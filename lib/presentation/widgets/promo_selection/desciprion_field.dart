import 'package:flutter/material.dart';
import 'package:halaqat/presentation/state/form_state.dart';
import 'package:provider/provider.dart';

class DesciprionField extends StatefulWidget {
  const DesciprionField({super.key});
  @override
  State<DesciprionField> createState() => _DesciprionFieldState();
}

class _DesciprionFieldState extends State<DesciprionField> { 
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Ensures it only takes needed height
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 50,
          child: TextField(
            onChanged: (value){
              context.read<PromoFormState>().updateDescription(value);
            },
            controller: _controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
      ],
    );
  }
}
