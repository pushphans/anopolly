import 'package:anopolly/Core/Constants/app_colors.dart';
import 'package:anopolly/Core/CoreWidgets/my_drawer.dart';
import 'package:anopolly/View/Widgets/poll_card.dart';
import 'package:anopolly/ViewModel/poll_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PollProvider>(context, listen: false).getPolls();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.grey,

        appBar: AppBar(
          backgroundColor: AppColors.blue,
          foregroundColor: AppColors.white,
        ),
        drawer: MyDrawer(),

        body: Column(
          children: [
            Expanded(
              child: Consumer<PollProvider>(
                builder: (context, value, child) => ListView.builder(
                  itemCount: value.polls.length,
                  itemBuilder: (context, index) {
                    final poll = value.polls[index];

                    return PollCard(
                      key: ValueKey(poll.pollId),
                      question: poll.question,
                      optionA: poll.option1,
                      optionB: poll.option2,
                      optionC: poll.option3,
                      optionD: poll.option4,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
