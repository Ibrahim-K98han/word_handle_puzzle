import 'package:flutter/material.dart';

const keyList = [
  ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
  ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
  ['Z', 'X', 'C', 'V', 'B', 'N', 'M'],
];

class KeyboardView extends StatefulWidget {
  const KeyboardView({Key? key}) : super(key: key);

  @override
  State<KeyboardView> createState() => _KeyboardViewState();
}

class _KeyboardViewState extends State<KeyboardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Column(
          children: [
            for (int i = 0; i < keyList.length; i++)
              Row(
                children: keyList[i]
                    .map(
                      (e) => VirtualKey(
                        letter: e,
                        excluded: false,
                        onPress: (value) {},
                      ),
                    )
                    .toList(),
              )
          ],
        ),
      ),
    );
  }
}

class VirtualKey extends StatelessWidget {
  final String letter;
  final bool excluded;
  final Function(String) onPress;

  VirtualKey({
    Key? key,
    required this.letter,
    required this.excluded,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: excluded ? Colors.red : Colors.black,
          foregroundColor: Colors.white,
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          onPress(letter);
        },
        child: Text(letter),
      ),
    );
  }
}
