import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  CustomHeader(
      {super.key, required this.title, this.subtitle = "", this.location = "",this.size=24});
  final String title;
  final String subtitle;
  late String location;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: size,
                  fontWeight: FontWeight.bold,
                )
              ),
              const SizedBox(width: 3.0),
              Container(
                margin: EdgeInsets.only(top: 12),
                width: 7.0,
                height: 7.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
