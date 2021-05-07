import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> question;

  const ChallengePage({Key? key, required this.question}) : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    controller.currentPageNotifier.addListener(() {
      setState(() {});
    });
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
  }

  void nextPage() {
    if (controller.currentPage < widget.question.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value,
                  lenght: widget.question.length,
                ),
              )
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.question
            .map((e) => QuizWidget(
                  question: e,
                  onChange: () {
                    nextPage();
                  },
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) => (Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (value < widget.question.length)
                  Expanded(
                      child: NextButtonWidget.white(
                    label: "Pular",
                    onTap: nextPage,
                  )),
                if (value == widget.question.length)
                  Expanded(
                      child: NextButtonWidget.green(
                    label: "Confirmar",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ))
              ],
            )),
          ),
        ),
      ),
    );
  }
}
