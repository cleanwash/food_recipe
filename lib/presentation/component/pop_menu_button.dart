import 'package:flutter/material.dart';

class PopMenuButton extends StatelessWidget {
  final Function(String)? onSelected;

  const PopMenuButton({Key? key, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      onSelected: (String value) {
        onSelected?.call(value);
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: 'share',
            child: Row(
              children: const [
                Icon(Icons.share),
                SizedBox(width: 8),
                Text('Share'),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'rate',
            child: Row(
              children: const [
                Icon(Icons.star),
                SizedBox(width: 8),
                Text('Rate Recipe'),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'review',
            child: Row(
              children: const [
                Icon(Icons.rate_review),
                SizedBox(width: 8),
                Text('Review'),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'unsave',
            child: Row(
              children: const [
                Icon(Icons.bookmark_remove),
                SizedBox(width: 8),
                Text('Unsave'),
              ],
            ),
          ),
        ];
      },
    );
  }
}
