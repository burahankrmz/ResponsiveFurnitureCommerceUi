import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterresponsive/core/extensions/context_extension.dart';

class ColumnDesignView extends StatefulWidget {
  final String sampleChairsUrl;
  final String tag;
  const ColumnDesignView(
      {Key? key, required this.sampleChairsUrl, required this.tag})
      : super(key: key);

  @override
  _ColumnDesignViewState createState() => _ColumnDesignViewState();
}

class _ColumnDesignViewState extends State<ColumnDesignView> {
  @override
  Widget build(BuildContext context) {
    //we use usually scaffold for page design
    debugPrint(widget.sampleChairsUrl.toString());
    debugPrint(widget.tag);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Product Details',
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
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(context.dynamicWidth(0.04)),
            child:const  Icon(
              Icons.favorite,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.08)),
        child: Column(
          children: [
            Expanded(
              flex: 50,
              child: buildProductImage(),
            ),
            Expanded(
              flex: 2,
              child: buildSelectedImage(),
            ),
            const Spacer(
              flex: 4,
            ),
            Expanded(
              flex: 44,
              child: buildProductSpecs(),
            ),
          ],
        ),
      ),
    );
  }

  Column buildProductSpecs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          flex: 4,
          child: Text(
            'Primrose Accent',
            style: TextStyle(
              fontSize: 27.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Expanded(
          flex: 12,
          child: Text(
            'Energistically implement expanded arrchannels through visionary methods uickly customize act deploy funtionalts continually the mindulgent place to stay in country ',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
        ),
       const  Expanded(
            flex: 3,
            child: Text(
              'Color',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 18.0,
              ),
            )),
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 8,
                backgroundColor: Colors.blue,
              ),
              SizedBox(
                width: context.dynamicWidth(0.01),
              ),
              const CircleAvatar(
                radius: 8,
                backgroundColor: Colors.orange,
              ),
              SizedBox(
                width: context.dynamicWidth(0.01),
              ),
              const CircleAvatar(
                radius: 8,
                backgroundColor: Colors.pink,
              ),
              SizedBox(
                width: context.dynamicWidth(0.01),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 6,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      color: Colors.grey.shade300,
                      size: 25.0,
                    ),
                    SizedBox(
                      width: context.dynamicWidth(0.03),
                    ),
                    Text(
                      '01',
                      style: TextStyle(
                          color: Colors.grey.shade300, fontSize: 18.0),
                    ),
                    SizedBox(
                      width: context.dynamicWidth(0.03),
                    ),
                    Icon(
                      Icons.remove_circle_outline,
                      color: Colors.grey.shade300,
                      size: 25.0,
                    ),
                  ],
                ),
              ),
              const Text(
                'TL 240',
                style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(context.dynamicWidth(0.01)),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.grey.shade300,
                      size: 20.0,
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 5,
              ),
              Expanded(
                flex: 30,
                child: MaterialButton(
                  child: const Text(
                    'Add to cart',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                  color: Colors.blue.shade800,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 30,
                child: MaterialButton(
                  child: const Text(
                    'Buy Now',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                  color: Colors.blue.shade800,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row buildSelectedImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Spacer(
          flex: 15,
        ),
        CircleAvatar(
          radius: 5,
          backgroundColor: Colors.black26,
        ),
        Spacer(
          flex: 1,
        ),
        CircleAvatar(
          radius: 5,
          backgroundColor: Colors.black26,
        ),
        Spacer(
          flex: 1,
        ),
        CircleAvatar(
          radius: 5,
          backgroundColor: Colors.black87,
        ),
        Spacer(
          flex: 1,
        ),
        CircleAvatar(
          radius: 5,
          backgroundColor: Colors.black26,
        ),
        Spacer(
          flex: 1,
        ),
        CircleAvatar(
          radius: 5,
          backgroundColor: Colors.black26,
        ),
        Spacer(
          flex: 15,
        ),
      ],
    );
  }

  Widget buildProductImage() =>
      Hero(tag: widget.tag, child: Image.network(widget.sampleChairsUrl));

  BottomNavigationBar get buildBottomNavigationBar {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      ],
    );
  }
}
