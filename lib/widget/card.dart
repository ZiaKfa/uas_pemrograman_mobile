import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Widget? trailing;

  const CustomCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Add padding around the Card
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.blue[50],
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(icon, size: 40, color: Colors.blue),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue[700],
                        ),
                      ),
                    ],
                  ),
                ),
                if (trailing != null) ...[
                  SizedBox(width: 16),
                  trailing!,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}