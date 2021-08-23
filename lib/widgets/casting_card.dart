import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  final int movieid;

  const CastingCards(this.movieid);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 180.0,
      // color: Colors.red,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, int index) => _CardCast()),
    );
  }
}

class _CardCast extends StatelessWidget {
  const _CardCast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      // color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/150x300'),
              fit: BoxFit.cover,
              height: 140,
              width: 100,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            'actor.name cdsvdsdcv dv  sdcdscvds',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
