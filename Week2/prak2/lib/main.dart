import 'package:flutter/material.dart';
import 'mahasiswa.dart';
import 'musik.dart';

void main() {
  runApp(const Raymon());
}

class Raymon extends StatelessWidget {
  const Raymon({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final mahasiswa = Mahasiswa(nama: "Raymon",
     umur: 20, 
     kelas: "TI-3C");
    final musik = Musik(judul: "The man who can\'t be moved", 
    penyanyi: "The Script", 
    bait1: "Going back to the corner where I first saw you\nGonna camp in my sleeping bag, I\'m not gonna move\nGot some words on cardboard, got your picture in my hand\nSaying, \"If you see this girl, can you tell her where I am?\"\nSome try to hand me money, they don\'t understand\nI\'m not broke, I\'m just a broken hearted man\nI know it makes no sense but what else can I do\nHow can I move on when I\'m still in love with you", 
    bait2: "\'Cause if one day you wake up and find that you\'re missing me\nAnd your heart starts to wonder where on this Earth I could be\nThinkin\' maybe you\'ll come back here to the place that we\'d meet\nAnd you\'ll see me waiting for you on the corner of the street\nSo I\'m not moving, I\'m not moving",
    bait3: "Policeman says, \"Son, you can't stay here\"\nI said, \"There\'s someone I\'m waiting for if it\'s a day, a month, a year\"\nGotta stand my ground even if it rains or snows\nIf she changes her mind, this is the first place she will go",
    bait4: "\'Cause if one day you wake up and find that you\'re missing me\nAnd your heart starts to wonder where on this Earth I could be\nThinking\nmaybe you\'ll come back here to the place that we\'d meet\nAnd you\'ll see me waiting for you on the corner of the street\nSo I\'m not moving,\nI\'m not moving\nI\'m not moving, I\'m not moving",
    bait5: "People talk about the guy that\'s waiting on a girl\nThere are no holes in his shoes but a big hole in his world\n",
    bait6: "Maybe I\'ll get famous as the man who can\'t be moved\nMaybe you won\'t mean to, but you\'ll see me on the news\nAnd you'll come running to the corner\n\'Cause you\'ll know it\'s just for you\nI\'m the man who can\'t be moved\nI\'m the man who can\'t be moved\n",
    bait7: "\'Cause if one day you wake up and find that you\'re missing me (find that you\'re missing me)\nAnd your heart starts to wonder where on this Earth I could be (where on this Earth I could be)\nThinkin\' maybe you\'ll come back here to the place that we\'d meet (to the place that we\'d meet)\nAnd you'll see me waiting for you on the corner of the street\n",
    bait8: "\'cause if one day you wake up and find that you\'re missing me\n(I\'m not moving) and your heart starts to wonder where on this Earth I could be\n(I\'m not moving) thinkin\' maybe you\'ll come back here to the place that we\'d meet\n(I\'m not moving) and you\'ll see me waiting for you on the corner of the street\n",
    bait9: "Going back to the corner where I first saw you\nGonna camp in my sleeping bag, I\'m not gonna move\n"
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: 
        Colors.deepPurple),
        ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("${musik.judul}"),
            centerTitle: true, 
            backgroundColor: Colors.lightBlue,),
          body: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left:400),
                child: Text("${musik.bait1}\n"),
              ),
              Padding(
                padding: EdgeInsets.only(left:750),
                child: Text("${musik.bait2}\n"),
              ),
              Padding(
                padding: EdgeInsets.only(left:400),
                child: Text("${musik.bait3}\n"),
              ),
              Padding(
                padding: EdgeInsets.only(left:750),
                child: Text("${musik.bait4}\n"),
              ),
              Padding(
                padding: EdgeInsets.only(left:400),
                child: Text("${musik.bait5}\n"),
              ),
              Padding(
                padding: EdgeInsets.only(left:750),
                child: Text("${musik.bait6}\n"),
              ),
              Padding(
                padding: EdgeInsets.only(left:400),
                child: Text("${musik.bait7}\n"),
              ),
              Padding(
                padding: EdgeInsets.only(left:750),
                child: Text("${musik.bait8}\n"),
              ),
              Padding(
                padding: EdgeInsets.only(left:400),
                child: Text("${musik.bait9}\n"),
              ),
              Padding(
                padding: EdgeInsets.only(left:1025),
                child: Text("Created By: ${mahasiswa.nama}\n"),
              ),
            ],
          ),
          ),
          
          bottomNavigationBar: Container(
              color: Colors.lightBlue,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.skip_previous),
                Icon(Icons.play_arrow),
                Icon(Icons.pause),
                Icon(Icons.skip_next,),
              ],
            ),
          ) 
        ),
    );
  }
}