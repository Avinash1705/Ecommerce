import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest/core/MyStore.dart';
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
          // _CartTotal().objectBottomCenter().expand().p8().h20(context)
        ],
      ).py8(),
    );
    return Placeholder();
  }
}

// class _CartTotal extends StatelessWidget {
//   var _cart = Get.find<MyStore>();
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text("\$${_cart.totalPrice}").text.xl.color(Colors.brown).make(),
//           30.widthBox,
//           ElevatedButton(
//               onPressed: () {
//                 MySnakBar.snakBarFn(context, "Buying Not Supported");
//               },
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
//               ),
//               child: "Buy".text.color(MyTheme.creamColor).xl.make())
//         ],
//       ).px8(),
//     );
//   }
// }

class _CartList extends StatelessWidget {
  //object call
  final _cart = Get.find<MyStore>();

  @override
  Widget build(BuildContext context) {
    // print(_cart.resp);
    // print(_cart.listCartConversion());
    return _cart.cartItem.isEmpty
        ? "Nothing In Cart".text.xl4.make()
        : ListView.builder(
            itemCount: _cart.weightData.length,
            itemBuilder: (context, index) => ListTile(
                  title: _cart.weightData[index].restaurantItemsList.name.text.make(),
                  // leading: (Image.network(_cart.items[index].image)),
                  // subtitle: _cart.items[index].price.text.make(),
                  subtitle: "${_cart.weightData[index].count}".text.make(),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {},
                  ),
                  // title: _cart.items[index].name.text.make(),
                ));
  }
}
