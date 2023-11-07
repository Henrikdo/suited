import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:suited/views/components/components.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _header(context),
      body: Padding(padding:EdgeInsets.all(8),child: _productList()),
    );
  }

  AppBar _header(context) {
    return AppBar(
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.list,
                color: Colors.black,
              ),
            ),
            _searchBar(),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                  fill: 0,
                ))
          ],
        ));
  }

  Widget _searchBar() {
    return const Flexible(
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            isDense: true,
            border: OutlineInputBorder(),
            hintText: 'Procurando por ...',
            suffixIcon: Icon(FontAwesomeIcons.magnifyingGlass)),
      ),
    );
  }

  Widget _productList() {
    return Expanded(
        child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            
            children: List.generate(10,  (index) {
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child:ProductFrame(),
              );
            })));
  }
}
