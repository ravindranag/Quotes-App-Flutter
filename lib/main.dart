import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/widgets/quote_card.dart';
import 'quote.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes App',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme
        )
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Quote> quotes = [
    Quote(quote: 'The purpose of our lives is to be happy.', author: 'Dalai Lama', isLiked: false),
    Quote(quote: 'Life is what happens when you’re busy making other plans.', author: 'John Lennon', isLiked: false),
    Quote(quote: 'Get busy living or get busy dying.', author: 'Stephen King', isLiked: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Quotes For You',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: quotes.map((q) => (
              QuoteCard(
                quote: q,
                delete: () {
                    setState(() {
                      quotes.remove(q);
                    });
                }
              )
          )).toList(),
        ),
      ),
    );
  }
}

