import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

class ProductFrame extends StatelessWidget {
  const ProductFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(
              color: Colors.grey, offset: Offset(0, 2), blurRadius: 4)]),

      child: Column(children: [_image(),_productName(),_productDescription(),_productPrice()]),
    );


    
  }

  Widget _image(){
    return Expanded(
      child: Image.asset("assets/images/luffy.png",width: 180,height: 180,fit: BoxFit.cover ,),

    );
  }
  Widget _productName(){
    return Text('Luffy',style: GoogleFonts.montserrat(fontSize: 10,color:Colors.black,fontWeight: FontWeight.w400));
  }
  Widget _productDescription(){
    return Text('É o luffy',style: GoogleFonts.montserrat(fontSize: 10,color:Colors.grey,fontWeight: FontWeight.w400));
  }
  Widget _productPrice(){
    return Text('\$49.99',style: GoogleFonts.montserrat(fontSize: 10,color:Colors.green,fontWeight: FontWeight.w400));
  }
}
