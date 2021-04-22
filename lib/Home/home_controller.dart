import 'package:devquiz/Home/home_state.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/shared/models/awnser_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    user = UserModel(
      name: "Wessh",
      photoUrl: "https://avatars.githubusercontent.com/u/10172228?v=4",
    );
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    quizzes = [
      QuizModel(
          title: "NLW 5 Flutter",
          questionAnswered: 1,
          questions: [
            QuestionModel(
              title: "QuestionModel",
              awnsers: [
                AwnserModel(title: "Flutter"),
                AwnserModel(title: "Flutter Dev", isRight: true),
                AwnserModel(title: "Teste"),
                AwnserModel(title: "Teste 01"),
              ],
            ),
            QuestionModel(
              title: "QuestionModel",
              awnsers: [
                AwnserModel(title: "Flutter"),
                AwnserModel(title: "Flutter Dev", isRight: true),
                AwnserModel(title: "Teste"),
                AwnserModel(title: "Teste 01"),
              ],
            )
          ],
          image: AppImages.blocks,
          level: Level.facil)
    ];
    state = HomeState.success;
  }
}
