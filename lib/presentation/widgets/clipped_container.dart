import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bussines_logic/cubits/cubit/cubit/activites_details_cubit.dart';
import '../../data/models/activites.dart';
import '../../data/models/activites_details_model.dart';

class ClippedContainer extends StatefulWidget {
  const ClippedContainer({
    required this.id,
    required this.cont,
    Key? key,
    this.height = 400,
    required this.activity,
    this.imgesURL,
    this.color,
  }) : super(key: key);
  final PageController cont;
  final int id ;
  final ActivitesDetailsModel activity;
  final double height;
  final List<dynamic>? imgesURL;
  final Color? color;

  @override
  _ClippedContainerState createState() => _ClippedContainerState();
}

class _ClippedContainerState extends State<ClippedContainer> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _CustomClipper(),
      child: Material(
        child: Stack(
          children: [
            Container(
              height: widget.height,
              color: (widget.imgesURL == null) ? const Color(0xFFE8AA42) : null,
              child:  (widget.id ==  2 )?  PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: widget.cont,
            itemCount: widget.activity.images!.length,
            itemBuilder: (context, index) {
              final imageUrl = widget.activity.images![index];
              return imageUrl!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.25,
                      placeholder: "assets/images/loading1.gif",
                      image: imageUrl!)
                  : Image.asset(
                      "assets/images/loading1.gif",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.25,
                    );
            },
          ): Container( color: const Color(0xFFE8AA42),),
            ),
            Positioned(
              top: 8.0,
              left: 8.0,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      key: Key('backButton'),
                      onPressed: () {
                        BlocProvider.of<ActivitesDetailsCubit>(context).reset();
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      key: Key('favoriteButton'),
                      onPressed: toggleFavorite,
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.1, size.width * 0.85,
        size.width * 0.3, size.width * 0.85);
    path.lineTo(size.width * 0.7, size.width * 0.85);
    path.quadraticBezierTo(
        size.width * 0.9, size.width * 0.85, size.width * 1, size.width * 1);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
