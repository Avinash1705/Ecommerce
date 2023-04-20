import 'package:flutter/material.dart';
import 'package:rest/models/categorySubItemsModel.dart';
import 'package:rest/utils/MyTheme.dart';

import 'package:velocity_x/velocity_x.dart';

class DetailPage extends StatelessWidget {
  RestaurantItemsList argumentCat;

  DetailPage({required this.argumentCat});

  get item => null;

  // var argumentCat = Get.arguments as RestaurantItemsList;

  @override
  Widget build(BuildContext context) {
    // print(
    //     "argDetail ${argumentCat.id} ${argumentCat.price} ${argumentCat.name}  ${argumentCat.image}  ${argumentCat.desc}");
    // return Placeholder();
    return Scaffold(
      appBar: AppBar(
        title: Text("${argumentCat.id}"),
        backgroundColor: Colors.white70,
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              "\$${argumentCat.price}".text.xl4.color(Colors.deepOrange).make()
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () {
                // _cart.add(homeArgs);
                // // print("${homeArgs.name} Clicked");
                // Navigator.pushNamed(context, MyRoutes.cartRoute);
              },
              child: const Text("Cart").text.xl.make())
        ],
      ).p8(),
      backgroundColor: Colors.white70,
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
                  tag: Key(argumentCat.id.toString()),
                  child: Image.network(argumentCat.image))
              .h32(context),
          Expanded(
            child: VxArc(
              height: 25,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                width: context.screenWidth,
                color: MyTheme.creamColor,
                child: Column(
                  children: [
                    argumentCat.name.text.xl4.color(Colors.black87).bold.make(),
                    argumentCat.desc.text.xl.color(Colors.black54).bold.make(),
                    // Text(MyStore)
                    //     .text
                    //     .color(Colors.orange)
                    //     .center
                    //     .xl
                    //     .make()
                    //     .py64(),
                  ],
                ).py64(),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
