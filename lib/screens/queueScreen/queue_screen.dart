import 'package:flutter/material.dart';

import 'package:like_button/like_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:q_songs/screens/queueScreen/components/songs_list.dart';

class QueueScreen extends StatefulWidget {
  const QueueScreen({Key? key}) : super(key: key);

  @override
  _QueueScreenState createState() => _QueueScreenState();
}

class _QueueScreenState extends State<QueueScreen> {
  @override
  Widget build(BuildContext context) {
    const TextStyle optionStyle = TextStyle(fontSize: 12, color: Colors.white);
    final List songs = [
      {
        'artist': 'Lady Gaga',
        'song': 'Bad Romance',
        'likeCount': 1,
        'picture':
            'https://gravatar.com/avatar/5a9b18168cd4588fa2a1bf94e1bb988e?s=400&d=robohash&r=x'
      },
      {
        'artist': 'Katy Perry',
        'song': 'Hot n Cold',
        'likeCount': 10,
        'picture':
            'https://gravatar.com/avatar/f92e0a251ac3e2bcefcdde568c96eaca?s=400&d=robohash&r=x'
      },
      {
        'artist': 'Justim Timberlake',
        'song': 'Hot n Cold',
        'likeCount': 2,
        'picture':
            'https://gravatar.com/avatar/d97e5fc44c80372b13677e13d6dac23b?s=400&d=robohash&r=x'
      },
      {
        'artist': 'Linkin Park',
        'song': 'Numb',
        'likeCount': 15,
        'picture':
            'https://gravatar.com/avatar/609087e755fc67fcc6c431c060e2396b?s=400&d=robohash&r=x'
      },
      {
        'artist': 'Hoshi',
        'song': 'Marinière',
        'likeCount': 3,
        'picture':
            'https://gravatar.com/avatar/84fe637bfd3d248a87d6d63f7dfd944f?s=400&d=robohash&r=x'
      },
      {
        'artist': 'Marilyn Manson',
        'song': 'Sweet dreams',
        'likeCount': 0,
        'picture':
            'https://gravatar.com/avatar/20523737f318637ea77ed40c9851e955?s=400&d=robohash&r=x'
      },
      {
        'artist': 'Fort Minor',
        'song': 'Remember the name',
        'likeCount': 4,
        'picture':
            'https://gravatar.com/avatar/821d0d7f71b471cf957f062232730b7c?s=400&d=robohash&r=x'
      },
    ];
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Current',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    Row(
                      children: [
                        LikeButton(
                          onTap: (isLiked) async {},
                          size: 25,
                          likeCount: 12,
                          isLiked: true,
                          likeBuilder: (isLiked) => Icon(
                            Icons.favorite,
                            color: isLiked ? Color(0xFFF2D049) : Colors.grey,
                          ),
                          countPostion: CountPostion.left,
                          countBuilder: (count, isLiked, text) {
                            return Text(text,
                                style: TextStyle(color: Color(0xFFF2D049)));
                          },
                          countDecoration: (count, likeCount) {
                            return Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
                                child: count);
                          },
                        ),
                        // SizedBox(width: 10),
                        // Icon(
                        //   Icons.thumb_up_alt,
                        //   color: Colors.white,
                        //   size: 20,
                        // ),
                      ],
                    )
                  ]),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.transparent,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)),
                      child: ListTile(
                          tileColor: Colors.transparent,
                          title: Text("Florent Pagny", style: optionStyle),
                          subtitle:
                              Text("Ma liberté de penser", style: optionStyle),
                          leading: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: FadeInImage.assetNetwork(
                                image:
                                    'https://gravatar.com/avatar/8d1b02fdcba12a5fa62bb08f3592d64f?s=400&d=robohash&r=x',
                                placeholder: 'assets/image-not-found.png'),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SpinKitWave(
                                  color: Colors.white,
                                  size: 15.0,
                                  type: SpinKitWaveType.start)
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.white10,
                          color: Color(0xFFF2D049),
                          value: .33,
                          semanticsLabel: 'Linear progress indicator',
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
        SizedBox(height: 20),
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                  color: Color(0xcc000000),
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70))),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('Up next',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                            Icon(
                              Icons.expand_more,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                        // Icon(
                        //   Icons.repeat,
                        //   color: Colors.white,
                        //   size: 20,
                        // )
                      ]),
                ),
                SongsList(songs: songs, optionStyle: optionStyle)
              ])),
        )
      ],
    );
  }
}
