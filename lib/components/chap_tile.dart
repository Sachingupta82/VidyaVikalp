import 'package:flutter/material.dart';

class ChapTile extends StatelessWidget {
  final int chapNum;
  final String chapName;
  final void Function()? onChapPressed;

  const ChapTile(
      {super.key,
      required this.chapNum,
      required this.chapName,
      required this.onChapPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 0, right: 20, bottom: 25),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ListTile(
        title: Row(
          children: [
            Text("$chapNum.",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(
              width: 10,
            ),
            Text(
              chapName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            )
          ],
        ),
        onTap: onChapPressed,
      ),
    );
  }
}
// Text(chapNum.toString() + chapName)