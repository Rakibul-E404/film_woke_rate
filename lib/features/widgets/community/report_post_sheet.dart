/// REPORT POST POPUP
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';


class ReportPostSheet extends StatefulWidget {
  const ReportPostSheet({super.key});

  @override
  State<ReportPostSheet> createState() => _ReportPostSheetState();
}

class _ReportPostSheetState extends State<ReportPostSheet> {

  List<bool> selected = List.generate(8, (index) => false);

  final titles = [
    "Inappropriate Content",
    "Spam",
    "Harassment",
    "False Information",
    "Hate Speech",
    "Violence",
    "Sexual Content",
    "Other"
  ];

  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height * .85,
      decoration: const BoxDecoration(
        color: Color(0xff203B4F),
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: SafeArea(
        child: Column(
          children: [

            /// Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: const [
                  Icon(Icons.arrow_back, color: Colors.white),
                  Spacer(),
                  Text(
                    "REPORT POST",
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                  Spacer(),
                ],
              ),
            ),

            /// Options
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: titles.length,
                itemBuilder: (context, index) {

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected[index] = !selected[index];
                            });
                          },
                          child: Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(4),
                              color: selected[index]
                                  ? Colors.red
                                  : Colors.transparent,
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                titles[index],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16),
                              ),

                              const SizedBox(height: 4),

                              const Text(
                                "This post contains offensive or explicit material.",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

            /// Submit Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(40),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

