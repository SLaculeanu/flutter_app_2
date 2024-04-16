import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  Color answerColor(Map<String, Object> data) {
    return data['user_answer'] == data['correct_answer']
        ? const Color.fromARGB(255, 88, 224, 255)
        : const Color.fromARGB(255, 255, 80, 255);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 315,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                ),
              ),
              child: Row(
                children: [
                  Container(
                      margin: const EdgeInsets.all(10),
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: answerColor(data),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                            ((data['question_index'] as int) + 1).toString()),
                      )),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Your answer: ',
                                style: GoogleFonts.lato(
                                  color:
                                      const Color.fromARGB(255, 255, 80, 255),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: data['user_answer'] as String,
                                style: GoogleFonts.lato(
                                  color:
                                      const Color.fromARGB(255, 205, 121, 244),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Correct answer: ',
                                style: GoogleFonts.lato(
                                  color:
                                      const Color.fromARGB(255, 88, 224, 255),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: data['correct_answer'] as String,
                                style: GoogleFonts.lato(
                                  color:
                                      const Color.fromARGB(255, 101, 185, 228),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
