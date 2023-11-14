import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:suited/views/components/components.dart';
import 'package:suited/views/login_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: _bottomNavBar(context),
      body: Padding(padding: EdgeInsets.all(8), child: _topics()[_currentIndex]),
    );
  }

  BottomNavigationBar _bottomNavBar(context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: Colors.red,
      onTap: (int newIndex) {
        setState(() {
          _currentIndex = newIndex;
        });
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user), label: 'Account'),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bagShopping), label: 'Products'),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.cartShopping), label: 'Cart')
      ],
    );
  }

  AppBar _header(context) {
    return AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: _searchBar(),
        ));
  }

  Widget _searchBar() {
    return const TextField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          isDense: true,
          border: OutlineInputBorder(),
          hintText: 'Procurando por ...',
          suffixIcon: Icon(FontAwesomeIcons.magnifyingGlass)),
    );
  }

  Widget _productList() {
    return Column(
      children: [
        _header(context),
        Expanded(
          child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              children: List.generate(10, (index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ProductFrame(),
                );
              })),
        ),
      ],
    );
  }

  List<Widget> _topics(){
    return  [
      LoginScreen(),
      _productList(),
      _productList()
    ];
  }
}
