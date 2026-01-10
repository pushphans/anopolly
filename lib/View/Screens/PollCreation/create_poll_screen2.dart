import 'package:anopolly/Core/Constants/app_colors.dart';
import 'package:anopolly/Data/Models/poll_model.dart';
import 'package:anopolly/View/Widgets/my_textfield.dart';
import 'package:anopolly/View/Widgets/my_textformfield.dart';
import 'package:anopolly/ViewModel/poll_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePollScreen2 extends StatefulWidget {
  final String email;
  const CreatePollScreen2({super.key, required this.email});

  @override
  State<CreatePollScreen2> createState() => _CreatePollScreen2State();
}

class _CreatePollScreen2State extends State<CreatePollScreen2> {
  final questionController = TextEditingController();
  final optionAController = TextEditingController();
  final optionBController = TextEditingController();
  final optionCController = TextEditingController();
  final optionDController = TextEditingController();
  bool isPrivate = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blue,
          foregroundColor: AppColors.white,
          // automaticallyImplyLeading: false,
        ),

        body: LayoutBuilder(
          builder: (context, constraints) => Padding(
            padding: const EdgeInsets.all(10),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Let's create a poll",
                          style: TextStyle(
                            fontSize: 35,
                            color: AppColors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 20),

                        Form(
                          child: Column(
                            children: [
                              Text(
                                "Enter your poll question",
                                style: TextStyle(
                                  color: AppColors.hintTextColor,
                                ),
                              ),

                              SizedBox(height: 10),

                              MyTextformfield(
                                controller: questionController,
                                label: "Poll question",
                              ),

                              SizedBox(height: 30),

                              Text(
                                "Enter the options",
                                style: TextStyle(
                                  color: AppColors.hintTextColor,
                                ),
                              ),

                              SizedBox(height: 10),

                              MyTextformfield(
                                controller: optionAController,
                                label: "Option A",
                              ),

                              SizedBox(height: 10),

                              MyTextformfield(
                                controller: optionBController,
                                label: "Option B",
                              ),

                              SizedBox(height: 10),

                              MyTextfield(
                                controller: optionCController,
                                label: "Option C",
                              ),

                              SizedBox(height: 10),

                              MyTextfield(
                                controller: optionDController,
                                label: "Option D",
                              ),
                            ],
                          ),
                        ),

                        Row(
                          children: [
                            Checkbox(
                              value: isPrivate,
                              onChanged: (value) {
                                setState(() {
                                  isPrivate = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),

                    Consumer<PollProvider>(
                      builder: (context, value, child) => ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            final messenger = ScaffoldMessenger.of(context);

                            final pollId = DateTime.now().microsecondsSinceEpoch
                                .toString();

                            final pollModel = PollModel(
                              pollId: pollId,
                              isPrivate: isPrivate,
                              email: widget.email,
                              question: questionController.text.trim(),
                              option1: optionAController.text.trim(),
                              option2: optionBController.text.trim(),
                              option3: optionCController.text.trim(),
                              option4: optionDController.text.trim(),
                            );

                            await value.addPoll(pollModel);

                            if (value.isAdded == true) {
                              if (!mounted) return;

                              messenger.showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  behavior: SnackBarBehavior.floating,
                                  content: Text(
                                    "Successfully created the poll",
                                  ),
                                ),
                              );
                            } else {
                              messenger.showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  behavior: SnackBarBehavior.floating,
                                  content: Text(
                                    "Successfully created the poll",
                                  ),
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Fill in all the reuired details first",
                                ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blue,
                          foregroundColor: AppColors.white,
                        ),

                        child: Center(
                          child: value.isLoading == false
                              ? Text(
                                  "Create poll",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
