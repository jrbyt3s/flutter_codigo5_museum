import 'package:flutter/material.dart';
import '../general/colors.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(double.infinity, 64.0),
      child: AppBar(
        backgroundColor: kBrandPrimaryColor,
        title: const Text(
          "MuseumApp ",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.cast,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          const CircleAvatar(
            radius: 16.0,
            backgroundColor: Colors.white10,
            backgroundImage: NetworkImage(
              "https://images.pexels.com/photos/12338228/pexels-photo-12338228.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
        ],
      ),
    );
  }
}
