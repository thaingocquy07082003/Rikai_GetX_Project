import 'package:app/core/utils/high_light_listview.dart';
import 'package:flutter/material.dart';


class HighlightListviewWidget extends StatelessWidget {
  const HighlightListviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Highlight[index].screen,
                ),
              );
            },
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        Highlight[index].image,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  Highlight[index].title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.27,
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemCount: Highlight.length,
      ),
    );
  }
}