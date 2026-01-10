class PollModel {
  // 🔴 REQUIRED
  final String pollId;
  final bool isPrivate;
  final String email;

  // 🟡 OPTIONAL / NULLABLE
  final String question;
  final String option1;
  final String option2;
  final String? option3;
  final String? option4;

  final int? voteCountA;
  final int? voteCountB;
  final int? voteCountC;
  final int? voteCountD;

  final String? privateAccessCode;

  PollModel({
    required this.pollId,
    required this.isPrivate,
    required this.email,

    required this.question,
    required this.option1,
    required this.option2,
    this.option3,
    this.option4,

    this.voteCountA,
    this.voteCountB,
    this.voteCountC,
    this.voteCountD,
    this.privateAccessCode,
  });

  /// 🔁 Firebase → Model
  factory PollModel.fromMap(Map<String, dynamic> map) {
    return PollModel(
      pollId: map['pollId'] ?? '',
      isPrivate: map['private'] ?? false,
      email: map['email'] ?? '',

      question: map['question'],
      option1: map['option1'],
      option2: map['option2'],
      option3: map['option3'],
      option4: map['option4'],

      voteCountA: map['voteCountA'],
      voteCountB: map['voteCountB'],
      voteCountC: map['voteCountC'],
      voteCountD: map['voteCountD'],

      privateAccessCode: map['privateAccessCode'],
    );
  }

  /// 🔁 Model → Firebase
  Map<String, dynamic> toMap() {
    return {
      'pollId': pollId,
      'private': isPrivate,
      'email': email,

      'question': question,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'option4': option4,

      'voteCountA': voteCountA,
      'voteCountB': voteCountB,
      'voteCountC': voteCountC,
      'voteCountD': voteCountD,

      'privateAccessCode': privateAccessCode,
    };
  }
}
