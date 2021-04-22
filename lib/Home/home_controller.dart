import 'package:devquiz/Home/home_state.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/shared/models/awnser_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';

class HomeController {
  HomeState state = HomeState.empty;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() {
    user = UserModel(
      name: "Wessh",
      photoUrl: "https://avatars.githubusercontent.com/u/10172228?v=4",
    );
  }

  void getQuizzes() {
    quizzes = [
      QuizModel(
          title: "NLW 5 Flutter",
          questions: [
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
  }
}
