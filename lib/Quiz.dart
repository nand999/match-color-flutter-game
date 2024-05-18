import 'package:coba_dragable/AboutMe.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'Berapa jumlah provinsi di Indonesia?',
      'answers': ['30', '31', '32', '38'],
      'correctAnswer': '38',
    },
    {
      'questionText': 'Apa singkatan dari Organisasi Negara-Negara Amerika?',
      'answers': ['OAS', 'UNICEF', 'NATO', 'UNESCO'],
      'correctAnswer': 'OAS',
    },
    {
      "questionText": "Siapakah penemu teori relativitas?",
      "answers": [
        "Isaac Newton",
        "Albert Einstein",
        "Galileo Galilei",
        "Stephen Hawking"
      ],
      "correctAnswer": "Albert Einstein"
    },
    {
      "questionText": "Apa nama sungai terpanjang di dunia?",
      "answers": [
        "Sungai Nil",
        "Sungai Amazon",
        "Sungai Mississippi",
        "Sungai Yangtze"
      ],
      "correctAnswer": "Sungai Amazon"
    },
    {
      "questionText": "Negara manakah yang memiliki jumlah penduduk terbanyak?",
      "answers": ["China", "India", "Amerika Serikat", "Indonesia"],
      "correctAnswer": "China"
    },
    {
      "questionText": "Siapa presiden pertama Amerika Serikat?",
      "answers": [
        "George Washington",
        "Thomas Jefferson",
        "Abraham Lincoln",
        "John F. Kennedy"
      ],
      "correctAnswer": "George Washington"
    },
    {
      "questionText": "Berapa lapisan kulit bumi?",
      "answers": ["2", "3", "4", "5"],
      "correctAnswer": "3"
    },
    {
      "questionText": "Apa zat yang paling melimpah di atmosfer bumi?",
      "answers": ["Nitrogen", "Oksigen", "Karbon Dioksida", "Argon"],
      "correctAnswer": "Nitrogen"
    },
    {
      "questionText": "Siapa penulis novel 'Harry Potter'?",
      "answers": [
        "J.K. Rowling",
        "Stephen King",
        "J.R.R. Tolkien",
        "George R.R. Martin"
      ],
      "correctAnswer": "J.K. Rowling"
    },
    {
      "questionText": "Apa nama planet terdekat dari matahari?",
      "answers": ["Venus", "Mars", "Bumi", "Merkurius"],
      "correctAnswer": "Merkurius"
    },
    {
      "questionText": "Siapa ilmuwan yang menemukan hukum gravitasi?",
      "answers": [
        "Isaac Newton",
        "Galileo Galilei",
        "Albert Einstein",
        "Nikola Tesla"
      ],
      "correctAnswer": "Isaac Newton"
    },
    {
      "questionText":
          "Apa nama tokoh fiksi ikonik dalam kisah Sherlock Holmes?",
      "answers": [
        "John Watson",
        "James Moriarty",
        "Hercule Poirot",
        "Sherlock Holmes"
      ],
      "correctAnswer": "Sherlock Holmes"
    },
    {
      "questionText": "Apa nama alat yang digunakan untuk mengukur waktu?",
      "answers": ["Jam", "Meter", "Kronometer", "Termometer"],
      "correctAnswer": "Jam"
    },
    {
      "questionText": "Siapa pelukis terkenal lukisan 'Mona Lisa'?",
      "answers": [
        "Leonardo da Vinci",
        "Vincent van Gogh",
        "Pablo Picasso",
        "Claude Monet"
      ],
      "correctAnswer": "Leonardo da Vinci"
    }
  ];

  int _questionIndex = 0;

  void _answerQuestion(String selectedAnswer) {
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quiz",
          style: TextStyle(color: Colors.white),
        ),

        //widget icon merupakan widget yg digunakan untuk menampilkan icon 

        leading: Icon(
          Icons.abc,
          color: Colors.white,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutMe()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              SystemNavigator.pop();
            },
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyan, Colors.cyan],
              begin: FractionalOffset.topRight,
              end: FractionalOffset.topLeft,
            ),
          ),
        ),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              questionIndex: _questionIndex,
              questions: _questions,
              answerQuestion: _answerQuestion,
            )
          : Center(
              child: Text(
                'Anda telah menyelesaikan kuis!',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}

class Quiz extends StatelessWidget {
  final int questionIndex;
  final List<Map<String, Object>> questions;
  final Function(String) answerQuestion;

  Quiz({
    required this.questionIndex,
    required this.questions,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                questions[questionIndex]['questionText'] as String,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ...(questions[questionIndex]['answers'] as List<String>)
                  .map((answer) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () => answerQuestion(answer),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan,
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(answer),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }
}
