
class QuizModel {
  late int _id;
  late String _question;
  late String _answer1;
  late String _answer2;
  late String _answer3;
  late String _answer4;
  late String _correctAnswer;
  late double _time;

  QuizModel.fromMap(Map<String,dynamic> data){
    _id = data['id'];
    _time=data['time'];
    _question = data['question'];
    _answer1 = data['answer1'];
    _answer2 = data['answer2'];
    _answer3 = data['answer3'];
    _answer4 = data['answer4'];
    _correctAnswer = data['CorrectAnswer'];
  }

  Map<String,dynamic> toMap() => {
        'id': _id,
        'time': _time,
        'question': _question,
        'answer1': _answer1,
        'answer2': _answer2,
        'answer3': _answer3,
        'answer4': _answer4,
        'CorrectAnswer': _correctAnswer,
      };

  int get id => _id;
  double get time => _time;
  String get question => _question;
  String get answer1 => _answer1;
  String get answer2 => _answer2;
  String get answer3 => _answer3;
  String get answer4 => _answer4;
  String get correctAnswer => _correctAnswer;


}