import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle bodyPrimary = const TextStyle(color: Colors.white);
TextStyle buttonPrimary = const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);


TextStyle headerText = GoogleFonts.playfairDisplay(fontSize: 24, fontWeight: FontWeight.w800);
TextStyle bodyText = GoogleFonts.poppins(fontSize: 16, color: Colors.white);
TextStyle inputText = bodyText.copyWith(fontWeight: FontWeight.w400);
TextStyle hintText = inputText.copyWith(color: Colors.white.withOpacity(0.6));

TextStyle buttonText = GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600);