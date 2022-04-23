import 'package:flutter/material.dart';
import 'package:quotes_app/quote.dart';

class QuoteCard extends StatefulWidget {
  final Quote quote;
  final Function delete;

  QuoteCard({required this.quote, required this.delete});

  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  @override
  Widget build(BuildContext context) => Card(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '"'+widget.quote.quote+'"',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                  '- '+widget.quote.author
              ),
            ),
            SizedBox(height: 10),
            Divider(
              height: 20,
              thickness: 2,
              color: Colors.blueGrey[100],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.quote.toggleIsLiked();
                        });
                      },
                      splashColor: Colors.redAccent[200],
                      icon: widget.quote.isLiked ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ) : const Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      )
                  ),
                ),
                Container(
                  child: IconButton(
                      onPressed: () {
                        widget.delete();
                      },
                      icon: Icon(Icons.delete)
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
}
