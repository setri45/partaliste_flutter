// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    this.index,
  });

  final controller;
  final onCancel;
  final onSave;
  final index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: FittedBox(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre idée de cadeau';
                    }
                    return null;
                  },
                  controller: controller,
                  maxLength: 25,
                  style: GoogleFonts.poppins(
                    letterSpacing: 1,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Idée',
                    labelStyle: GoogleFonts.poppins(
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperStyle: GoogleFonts.poppins(
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400,
                    ),
                    helperText: "Quelle est votre idée ?",
                  ),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    onPressed: onSave,
                    child: Text(
                      'Enregistrer',
                      style: GoogleFonts.poppins(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 12),
                  MaterialButton(
                    onPressed: onCancel,
                    child: Text(
                      'Annuler',
                      style: GoogleFonts.poppins(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
