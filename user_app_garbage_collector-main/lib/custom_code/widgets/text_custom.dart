// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class TextCustom extends StatefulWidget {
  const TextCustom({
    super.key,
    this.width,
    this.height,
    required this.labels,
    required this.values,
    required this.onChanged,
  });

  final double? width;
  final double? height;
  final List<String> labels;
  final List<String>? values;
  final Function(String?)? onChanged;

  @override
  State<TextCustom> createState() => _TextCustomState();
}

class _TextCustomState extends State<TextCustom> {
  String selectedValue = "";
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: List.generate(
        widget.labels.length,
        (index) => RadioListTile(
          title: Text(widget.labels[index]),
          value: widget.values![index],
          groupValue: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value.toString();
              widget.onChanged!(value);
            });
          },
        ),
      ),
    ));
  }
}
