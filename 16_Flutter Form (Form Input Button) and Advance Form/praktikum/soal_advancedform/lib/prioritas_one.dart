import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class PrioritasOne extends StatefulWidget {
  const PrioritasOne({super.key});

  @override
  State<PrioritasOne> createState() => _PrioritasOneState();
}

class _PrioritasOneState extends State<PrioritasOne> {

  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();

  Color _currentColor = Colors.orange;

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Widgets'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Picker
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Date'),
                TextButton(
                  onPressed: () async {
                    final selectDate = await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: DateTime(1990),
                      lastDate: DateTime(currentDate.year + 5)
                    );
                    setState(() {
                      if (selectDate != null) {
                        _dueDate = selectDate;
                      }
                    });
                  },
                  child: const Text('Select'),
                ),
              ],
            ),
            Text(DateFormat('dd-MM-yyyy').format(_dueDate)),

            // Color Picker
            const Text('Color'),
            const SizedBox(height: 10,),
            Container(
              height: 100,
              width: double.infinity,
              color: _currentColor,
            ),
            const SizedBox(height: 10,),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Pick your Color'),
                        content: BlockPicker(
                          pickerColor: _currentColor,
                          onColorChanged: (value) {
                            setState(() {
                              _currentColor = value;
                            });
                          },
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Save'),
                          )
                        ],
                      );
                    },
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(_currentColor)
                ),
                child: const Text('Pick a Color'),
              ),
            ),

            // File Picker
            const Text('Pick File'),
            const SizedBox(height: 10,),
            Center(
              child: ElevatedButton(
                onPressed: () => _pickFile(),
                child: const Text('Pick and Open File'),
              ),
            )
          ],
        ),
      ),
    );
  }
}