import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tourism/const/const.dart';
import 'package:tourism/presentation/screens/hotels/hotels_search.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key}) : super();

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  final List<String> _texts = [
    'Hotels in Damascus',
    'Hotels in London',
    'Flights to Tokyo',
    'Activites in Paris'
  ];
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _startTextAnimation();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideAnimation = Tween<double>(
      begin: -1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  Timer? _timer;

  void _startTextAnimation() {
    const duration = Duration(seconds: 4);
    _timer = Timer.periodic(duration, (_) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _texts.length;
        _animationController.reset();
        _animationController.forward();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, generalSearch);
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        height: 54,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(borderColors), width: 0.5),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: Color(kPrimaryColor),
            ),
            const SizedBox(
              width: 10,
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: Transform.translate(
                    offset: Offset(0.0, _slideAnimation.value * 20.0),
                    child: child,
                  ),
                );
              },
              child: Text(
                _texts[_currentIndex],
                key: ValueKey<String>(_texts[_currentIndex]),
                style: const TextStyle(
                  color: Color(borderColors),
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
