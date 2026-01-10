import 'package:anopolly/Core/Constants/app_colors.dart';
import 'package:anopolly/View/Widgets/my_textformfield.dart';
import 'package:flutter/material.dart';

class CreatePollScreen extends StatefulWidget {
  const CreatePollScreen({super.key});

  @override
  State<CreatePollScreen> createState() => _CreatePollScreenState();
}

class _CreatePollScreenState extends State<CreatePollScreen> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.grey,

        appBar: AppBar(
          backgroundColor: AppColors.blue,
          foregroundColor: AppColors.white,
          // automaticallyImplyLeading: false,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(height: 20),
                          Text(
                            "Enter your email",
                            style: TextStyle(
                              color: AppColors.blue,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 20),
                          Form(
                            key: _formKey,
                            child: MyTextformfield(
                              controller: emailController,
                              label: "Email",
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Enter a valid email to get poll results",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 70),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300,
                        ),

                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 15,
                                  ),
                                  child: Text(
                                    "🔐 Privacy Note",

                                    style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors.hintTextColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    bottom: 10,
                                  ),
                                  child: Container(
                                    height: 295,
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                ),

                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Your privacy matters to us.",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.hintTextColor,
                                          ),
                                        ),

                                        SizedBox(height: 5),

                                        Text(
                                          "We temporarily access your email address only to deliver poll results to you.",

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.hintTextColor,
                                          ),
                                        ),

                                        SizedBox(height: 5),

                                        Text(
                                          """> We do not store your email address in our database.
> Your email is not shared with any third party.
> Once the poll result email is successfully sent, your email address is immediately removed from the app.""",

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),

                                        SizedBox(height: 5),

                                        Text(
                                          "We do not use your email for marketing, tracking, or any other purpose.",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.hintTextColor,
                                          ),
                                        ),

                                        SizedBox(height: 5),

                                        Text(
                                          "By continuing, you agree to this limited and temporary use of your email strictly for sending poll results.",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.hintTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.blue,
          foregroundColor: AppColors.white,
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                  content: Text("Let's create a poll"),
                ),
              );

              await Navigator.pushNamed(
                context,
                '/questionscreen',
                arguments: emailController.text.trim(),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                  content: Text("Enter your email carefully"),
                ),
              );
            }
          },
          child: Icon(Icons.forward),
        ),
      ),
    );
  }
}
