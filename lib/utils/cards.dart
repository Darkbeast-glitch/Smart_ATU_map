import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smart_atu_nav/utils/constants.dart';

class CustomCards extends StatelessWidget {
  const CustomCards({
    super.key,
    required this.color,
    required this.imageName,
    required this.name,
    this.onTap,
    required this.description, // Consistent parameter placement
  });

  final Color color;
  final String imageName;
  final String name;
  final String description;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 9,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imageName),
              const Gap(2),
              Text(
                name,
                style: AppConstants.subtitleTextStyle
                    .copyWith(color: Colors.black, fontSize: 15),
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: AppConstants.subtitleTextStyle
                    .copyWith(color: Colors.black, fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
