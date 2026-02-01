

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/cart_screen/cart_screen.dart';
import '../../home/home_screen/home_screen.dart';
import '../../products/product_list/product_lists.dart';
import '../../profile/profile_screen/profile_screen.dart';
import '../bottom_bloc/bottom_bloc.dart';
import '../bottom_bloc/bottom_event.dart';
import '../bottom_bloc/bottom_state.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  static const screens = [
    HomeScreen(),
    ProductListScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  BottomNavigationBarItem _navItem(
      BuildContext context,
      IconData icon,
      String label,
      int index,
      int currentIndex,
      ) {
    return BottomNavigationBarItem(
      icon: _animatedIcon(
        Icon(icon),
        index == currentIndex,
      ),
      label: label,
    );
  }

  Widget _animatedIcon(Widget icon, bool isSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: EdgeInsets.all(isSelected ? 10 : 6),
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.deepPurple.withOpacity(0.15)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: AnimatedScale(
        scale: isSelected ? 1.2 : 1.0,
        duration: const Duration(milliseconds: 250),
        child: icon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.currentIndex,
            children: screens,
          ),

          bottomNavigationBar: Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: state.currentIndex,
                backgroundColor: Colors.white,
                elevation: 0,
                selectedItemColor: Colors.deepPurple,
                unselectedItemColor: Colors.grey,

                onTap: (i) {
                  context
                      .read<BottomNavBloc>()
                      .add(BottomNavChanged(i));
                },

                items: [
                  _navItem(context, Icons.home, "Home", 0, state.currentIndex),
                  _navItem(context, Icons.list, "Products", 1, state.currentIndex),

                  BottomNavigationBarItem(
                    icon: _animatedIcon(
                      buildCartBadgeBottomNav(context),
                      state.currentIndex == 2,
                    ),
                    label: "Cart",
                  ),

                  _navItem(context, Icons.person, "Profile", 3, state.currentIndex),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  Widget buildCartBadgeBottomNav(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Icon(Icons.shopping_cart),

        Positioned(
          right: -6,
          top: -6,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: const Text(
              '2', // later Bloc se aayega
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }




}

