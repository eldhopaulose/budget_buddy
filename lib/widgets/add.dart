import 'package:budget_buddy/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddWidget extends StatelessWidget {
  final Function({required String topic, required String income}) onAdd;

  const AddWidget({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextEditingController _topic = TextEditingController();
    TextEditingController _income = TextEditingController();
    return Container(
      height: size.height,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Topic",
              style: GoogleFonts.rubik(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            controller: _topic,
            decoration: const InputDecoration(
              labelText: 'labelText',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Topic",
              style: GoogleFonts.rubik(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            controller: _income,
            decoration: const InputDecoration(
              labelText: 'labelText',
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: color),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: size.width / 1.2,
            height: size.height / 15,
            child: ElevatedButton(
              onPressed: () {
                onAdd(topic: _topic.text, income: _income.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shadowColor: color,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: Text(
                "add",
                style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Fira Sans Condensed',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
