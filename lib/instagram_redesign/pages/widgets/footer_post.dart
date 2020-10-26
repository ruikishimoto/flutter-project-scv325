import 'package:flutter/material.dart';
import 'package:flutter_projects/instagram_redesign/models/ig_post.dart';
import 'package:flutter_projects/instagram_redesign/pages/widgets/rounded_border_image.dart';

class FooterPost extends StatelessWidget {
  const FooterPost({
    Key key,
    @required this.post,
    this.colorDescription,
    this.colorMoreButton,
  }) : super(key: key);

  final IgPost post;
  final Color colorMoreButton;
  final Color colorDescription;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (index) {
        return Align(
          widthFactor: .8,
          child: RoundedBorderImage(
            imageUrl: post.comments[index].user.photoUrl,
            height: 30,
            borderWidth: 1.5,
          ),
        );
      })
        ..add(const SizedBox(width: 20))
        ..add(Flexible(
            child: Text(
          post.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: colorDescription ??
                  Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.bold),
        )))
        ..add(const SizedBox(width: 5))
        ..add(SizedBox(
          height: 30,
          child: FlatButton(
            color: colorMoreButton ?? Colors.white,
            textColor: colorDescription,
            shape: StadiumBorder(),
            onPressed: () {},
            child: Text(
              "More",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )),
    );
  }
}
