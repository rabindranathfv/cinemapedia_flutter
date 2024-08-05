import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'loading movies',
      'buying pop corn',
      'getting those movies',
      'be pacient the movies are in our way'
    ];

    return Stream.periodic(const Duration(milliseconds: 2000), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('wait please'),
          const SizedBox(
            height: 10,
          ),
          const CircularProgressIndicator(
            strokeWidth: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder<String>(
              stream: getLoadingMessages(),
              builder: (BuildContext ctx, AsyncSnapshot<String> snapshot) {
                if (!snapshot.hasData) return const Text('loading!');

                return Text(snapshot.data!);
              })
        ],
      ),
    );
  }
}
