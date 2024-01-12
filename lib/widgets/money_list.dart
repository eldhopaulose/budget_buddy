import 'package:flutter/material.dart';

class MoneyList extends StatelessWidget {
  const MoneyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return const Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Text(
                          '\u{20B9}',
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Fira Sans Condensed',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        title: Text('The Enchanted Nightingale'),
                        subtitle: Text(
                          'Music by Julie Gable. Lyrics by Sidney Stein.',
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
