import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterresponsive/ui/basketpage.dart';
import 'package:flutterresponsive/ui/column_design_view.dart';
import 'package:flutterresponsive/ui/constants.dart';
import 'package:flutterresponsive/ui/context_extension.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Constants constants = Constants();
  @override
  Widget build(BuildContext context) {
    const sampleChairsUrl =
        'https://sc04.alicdn.com/kf/Hffa523a2dddd41efa8ead8462639a82eb.png';
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: context.paddingMediumHorizontal,
          child: ListView(
            //shrinkWrap: true,
            children: [
              buildSearchBar(),
              buildExploreText(),
              buildExploreCards(sampleChairsUrl),
              buildCategoryListView(),
              gridProductCards(sampleChairsUrl),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  GridView gridProductCards(String sampleChairsUrl) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: constants.products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 12,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ColumnDesignView(
                    tag: 'Grid + $index',
                    sampleChairsUrl: constants.products[index],
                  ),
                ));
          },
          child: GridProductCard(
            tag: 'Grid + $index',
            sampleChairsUrl: constants.products[index],
            productName: 'Primrose Accent',
            productPrice: 'TL 240',
          ),
        );
      },
    );
  }

  BottomNavigationBar buildBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      elevation: 2.0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border), label: 'Discover'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
      ],
    );
  }

  Padding buildCategoryListView() {
    return Padding(
      padding: context.paddingMediumVertical,
      child: SizedBox(
        height: context.dynamicHeight(0.03),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            const Text('All'),
            SizedBox(
              width: context.dynamicWidth(0.06),
            ),
            const Text('Chairs'),
            SizedBox(
              width: context.dynamicWidth(0.06),
            ),
            const Text('Sofas'),
            SizedBox(
              width: context.dynamicWidth(0.06),
            ),
            const Text('Beds'),
            SizedBox(
              width: context.dynamicWidth(0.06),
            ),
            const Text('Mini Table'),
            SizedBox(
              width: context.dynamicWidth(0.06),
            ),
            const Text('Cabinet'),
            SizedBox(
              width: context.dynamicWidth(0.06),
            ),
            const Text('Television'),
            SizedBox(
              width: context.dynamicWidth(0.06),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildExploreCards(String sampleChairsUrl) {
    return SizedBox(
      height: context.dynamicHeight(0.2),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: ProductCard(
                  sampleChairsUrl: sampleChairsUrl,
                  productName: 'Primrose Accent',
                  productPrice: 'TL 240',
                  productColor: Colors.blue.shade500)),
          Expanded(
              flex: 1,
              child: ProductCard(
                  sampleChairsUrl: sampleChairsUrl,
                  productName: 'Primrose Accent',
                  productPrice: 'TL 240',
                  productColor: Colors.orange.shade100)),
          Expanded(
              flex: 1,
              child: ProductCard(
                  sampleChairsUrl: sampleChairsUrl,
                  productName: 'Primrose Accent',
                  productPrice: 'TL 240',
                  productColor: Colors.pink.shade300)),
        ],
      ),
    );
  }

  Text buildExploreText() {
    return Text(
      'Explore',
      style:
          Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black),
    );
  }

  Row buildSearchBar() {
    return Row(
      children: [
        Expanded(
          flex: 86,
          child: Padding(
            padding: context.paddingHighVertical,
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              elevation: 3.0,
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search Location',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 12,
          child: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: const BasketPage(),
                      type: PageTransitionType.rightToLeft));
            },
            icon: const Icon(
              Icons.shopping_basket,
              size: 30.0,
            ),
          ),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.sampleChairsUrl,
    required this.productName,
    required this.productPrice,
    required this.productColor,
  }) : super(key: key);

  final String sampleChairsUrl;
  final String productName;
  final String productPrice;
  final Color productColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Image.network(sampleChairsUrl),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productName,
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(fontSize: 11.0, color: Colors.white),
            ),
            Text(
              productPrice,
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(fontSize: 11.0, color: Colors.white),
            ),
          ],
        ),
        tileColor: productColor,
      ),
    );
  }
}

class GridProductCard extends StatelessWidget {
  const GridProductCard({
    Key? key,
    required this.sampleChairsUrl,
    required this.productName,
    required this.productPrice,
    required this.tag,
  }) : super(key: key);

  final String sampleChairsUrl;
  final String productName;
  final String productPrice;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Hero(tag: tag, child: Image.network(sampleChairsUrl)),
        subtitle: Column(
          children: [
            Text(
              productName,
              style: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 11.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              productPrice,
              style: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 11.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        tileColor: Colors.white,
      ),
    );
  }
}
