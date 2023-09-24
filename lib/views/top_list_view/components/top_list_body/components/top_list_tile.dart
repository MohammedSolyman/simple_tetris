import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_tetris/data_types/player/player.dart';

class TopListTile extends StatelessWidget {
  const TopListTile({required this.index, required this.player, super.key});

  final int index;
  final Player player;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StarItem(index: (index + 1), name: player.name),
        ScoreItem(points: player.score),
        DateItem(date: player.date!)
      ],
    );
  }
}

class StarItem extends StatelessWidget {
  const StarItem({required this.index, required this.name, super.key});

  final int index;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/in_app_icons/icons/star.png'))),
              child: Center(
                  child: Text(index.toString(),
                      style: GoogleFonts.croissantOne(
                          color: Colors.black, fontSize: 20))),
            ),
            Text(name,
                style: GoogleFonts.croissantOne(
                    color: Colors.white, fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

class ScoreItem extends StatelessWidget {
  const ScoreItem({required this.points, super.key});
  final int points;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Text(points.toString(),
          style: GoogleFonts.croissantOne(color: Colors.white, fontSize: 20)),
    ));
  }
}

class DateItem extends StatelessWidget {
  const DateItem({required this.date, super.key});

  final int date;

  @override
  Widget build(BuildContext context) {
    DateTime datetime = DateTime.fromMillisecondsSinceEpoch(date);
    String s = datetime.toString();
    String day = s.split(' ').first;

    return Expanded(
        child: Center(
            child: Text(day,
                style: GoogleFonts.croissantOne(
                    color: Colors.white, fontSize: 20))));
  }
}
