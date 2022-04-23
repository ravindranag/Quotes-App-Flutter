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
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
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
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                  '- '+widget.quote.author
              ),
            ),
            const SizedBox(height: 10),
            Divider(
              height: 20,
              thickness: 2,
              color: Colors.blueGrey[100],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        widget.quote.toggleIsLiked();
                      });
                    },
                    splashRadius: 30,
                    splashColor: Colors.redAccent[200],
                    focusColor: Colors.redAccent[100],
                    hoverColor: Colors.redAccent[50],
                    highlightColor: Colors.redAccent[100],
                    icon: widget.quote.isLiked ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ) : const Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    )
                ),
                IconButton(
                    onPressed: () {
                      widget.delete();
                    },
                    splashRadius: 30,
                    icon: const Icon(Icons.delete)
                )
              ],
            )
          ],
        ),
      ),
    );
}
