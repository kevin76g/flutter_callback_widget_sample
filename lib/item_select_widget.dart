import 'package:flutter/material.dart';

typedef ItemSelectedCallback = void Function(String value);

class ItemSelectWidget extends StatefulWidget {
  final ItemSelectedCallback onSelectedItem;

  const ItemSelectWidget({required this.onSelectedItem, Key? key})
      : super(key: key);

  @override
  State<ItemSelectWidget> createState() => _ItemSelectWidgetState();
}

class _ItemSelectWidgetState extends State<ItemSelectWidget> {
  String item = 'apple';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'アイテムの選択',
          style: TextStyle(fontSize: 20.0),
        ),
        const SizedBox(
          width: 30.0,
        ),
        DropdownButton<String>(
          value: item,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? value) {
            widget.onSelectedItem(value!);
            item = value;
          },
          items: <String>['apple', 'cat']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(fontSize: 20.0),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
