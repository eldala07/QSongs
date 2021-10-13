import 'package:flutter/material.dart';

import 'package:like_button/like_button.dart';

class SongsList extends StatelessWidget {
  final List songs;
  final TextStyle optionStyle;

  const SongsList({Key? key, required this.songs, required this.optionStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Card(
            elevation: 0,
            color: Colors.transparent,
            margin: EdgeInsets.only(top: 0, bottom: 0),
            child: ListTile(
                tileColor: Colors.transparent,
                title: Text(songs[index]['artist'], style: optionStyle),
                subtitle: Text(songs[index]['song'], style: optionStyle),
                leading: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: FadeInImage.assetNetwork(
                      image: songs[index]['picture'],
                      placeholder: 'assets/image-not-found.png'),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LikeButton(
                        size: 25,
                        likeCount: songs[index]['likeCount'],
                        bubblesColor: const BubblesColor(
                          dotPrimaryColor: Color(0xFFF2D049),
                          dotSecondaryColor: Color(0xff6985e8),
                          dotThirdColor: Color(0xff0f17ad),
                          dotLastColor: Color(0xFFF2D049),
                        ),
                        circleColor: const CircleColor(
                            start: Color(0xff0f17ad), end: Color(0xFFF2D049)),
                        countPostion: CountPostion.left,
                        likeBuilder: (isLiked) => Icon(
                              Icons.favorite,
                              color: isLiked ? Color(0xFFF2D049) : Colors.grey,
                            ),
                        countBuilder: (count, isLiked, text) {
                          final color =
                              isLiked ? Color(0xFFF2D049) : Colors.grey;
                          return Text(text, style: TextStyle(color: color));
                        },
                        countDecoration: (count, likeCount) {
                          return Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
                              child: count);
                        }),
                    SizedBox(width: 10),
                    Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
