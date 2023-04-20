import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest/core/MyStore.dart';
import 'package:rest/utils/MySnakBar.dart';
import 'package:rest/utils/MyTheme.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final _cart = Get.find<MyStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
      ),
      body: Column(
        children: [
          _CartList().py32().expand(),
          const Divider(
            thickness: 3,
          ),
          _CartTotal().objectBottomCenter().expand().p8().h20(context)
        ],
      ).py8(),
    );
  }
}

class _CartTotal extends StatelessWidget {
  var _cart = Get.find<MyStore>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Obx(() => ),
          Text("\$${_cart.totalCartPrice}").text.xl.color(Colors.brown).make(),
          30.widthBox,
          ElevatedButton(
              onPressed: () {
                MySnakBar.snakBarFn(context, "Buying Not Supported");
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
              ),
              child: "Buy".text.color(MyTheme.creamColor).xl.make())
        ],
      ).px8(),
    );
  }
}

class _CartList extends StatefulWidget {
  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  //object call
  final _cart = Get.find<MyStore>();

  @override
  Widget build(BuildContext context) {

    // return _cart.cartItem.isEmpty
    return _cart.weightData.isEmpty
        ? "Nothing In Cart".text.xl4.make()
        : ListView.builder(
            itemCount: _cart.weightData.length,
            itemBuilder: (context, index) => ListTile(
                  title: _cart.weightData[index].restaurantItemsList.name.text
                      .make(),
                  leading: (Image.network(
                      _cart.weightData[index].restaurantItemsList.image)),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Quantity ${_cart.weightData[index].count}"
                          .text
                          .make()
                          .px32(),
                      "Rs ${_cart.weightData[index].restaurantItemsList.price * _cart.weightData[index].count}"
                          .text
                          .make(),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      // Obx(() =>   _cart.removeItem(_cart.weightData[index]));
                      _cart.weightData.remove(_cart.weightData[index]);
                      setState(() {
                        //map update
                      });
                      _cart.resp.remove(_cart.weightData[index].restaurantItemsList);

                      print("removed");
                    },
                  ),
                ));
  }
}
