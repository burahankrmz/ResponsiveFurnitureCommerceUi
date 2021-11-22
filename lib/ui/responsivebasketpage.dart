import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutterresponsive/core/constants/constants.dart';
import 'package:flutterresponsive/core/extensions/context_extension.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  Constants constants = Constants();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Padding(
        padding: context.paddingHighHorizontal,
        child: Column(
          children: [
            const Spacer(
              flex: 5,
            ),
            Expanded(
              flex: 75,
              child: ListView(
                children: [
                  BasketProductCard(constants: constants),
                  BasketProductCard(constants: constants),
                  BasketProductCard(constants: constants),
                  BasketProductCard(constants: constants),
                  BasketProductCard(constants: constants),
                  BasketProductCard(constants: constants),
                ],
              ),
            ),
            Expanded(
              flex: 20,
              child: Column(
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    flex: 8,
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            'Total',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          child: Text(
                            'TL 1150',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {},
                            child:const  Text(
                              'Checkout',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.deepPurple.shade800,
                          ),
                        ),
                      ],
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

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        'Cart Page',
        style: Theme.of(context).textTheme.headline6,
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(0.02)),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          elevation: 2.0,
          backgroundColor: Colors.white,
          mini: true,
          child:const  Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(context.dynamicWidth(0.04)),
          child: const Icon(
            Icons.favorite,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class BasketProductCard extends StatelessWidget {
  const BasketProductCard({
    Key? key,
    required this.constants,
  }) : super(key: key);

  final Constants constants;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingMediumVertical,
      child: Material(
        elevation: 5,
        child: Slidable(
          endActionPane: const ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                flex: 1,
                onPressed: null,
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
              ),
            ],
          ),
          child: ListTile(
            tileColor: Colors.white,
            contentPadding: context.dynamicVerticalPadding(0.018),
            leading: Padding(
              padding: context.paddingMediumHorizontal,
              child: Image.network(
                constants.products[0],
              ),
            ),
            title: Text(
              'Primrose Accent',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple.shade800,
                  fontSize: 18),
            ),
            subtitle: Text(
              'TL240',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple.shade800,
                  fontSize: 16),
            ),
            trailing: Column(
              children: [
                Expanded(
                  child: Icon(
                    Icons.remove_circle_outline,
                    color: Colors.grey.shade300,
                    size: 25.0,
                  ),
                ),
                Expanded(
                  child: Text(
                    '01',
                    style:
                        TextStyle(color: Colors.grey.shade300, fontSize: 16.0),
                  ),
                ),
                Expanded(
                  child: Icon(
                    Icons.add_circle_outline,
                    color: Colors.grey.shade300,
                    size: 25.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
