import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_tetris/data_types/player/player.dart';
import 'package:lottie/lottie.dart';

class TopListTile extends StatelessWidget {
  const TopListTile({required this.index, required this.player, super.key});

  final int index;
  final Player player;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StarRow(index: (index + 1), name: player.name),
        ScoreRow(points: player.score),
        DateRow(date: player.date!)
      ],
    );
  }
}

class StarRow extends StatelessWidget {
  const StarRow({required this.index, required this.name, super.key});

  final int index;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/in_app_icons/icons/star3.png'))),
            child: Center(
                child: Text(index.toString(),
                    style: GoogleFonts.croissantOne(color: Colors.black))),
          ),
          Text(name, style: GoogleFonts.croissantOne(color: Colors.white)),
        ],
      ),
    );
  }
}

class ScoreRow extends StatelessWidget {
  const ScoreRow({required this.points, super.key});
  final int points;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      children: [
        LottieBuilder.asset(
          'assets/animated_files/tetris_piece2.json',
          repeat: true,
          height: 60,
          width: 60,
        ),
        Text(points.toString(),
            style: GoogleFonts.croissantOne(color: Colors.white)),
      ],
    ));
  }
}

class DateRow extends StatelessWidget {
  const DateRow({required this.date, super.key});

  final int date;

  @override
  Widget build(BuildContext context) {
    DateTime datetime = DateTime.fromMillisecondsSinceEpoch(date);
    String s = datetime.toString();
    String day = s.split(' ').first;

    return Expanded(
        child: Row(
      children: [
        LottieBuilder.asset(
          'assets/animated_files/date.json',
          repeat: true,
          height: 40,
          width: 40,
        ),
        Text(day, style: GoogleFonts.croissantOne(color: Colors.white)),
      ],
    ));
  }
}
