import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/addproduct.dart';
import 'package:flutter_application_1/class.dart';

import 'package:flutter_application_1/men.dart';

import 'package:flutter_application_1/productdetailspage.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: Shop3(),
  ));
}

class Shop3 extends StatefulWidget {
  @override
  State<Shop3> createState() {
    return Screen3();
  }
}

class Screen3 extends State<Shop3> {
  List<ProductRest> searchproduct = [];
  bool isSearch = false;
  TextEditingController controller = TextEditingController();
  final List<String> hello = [
    'assets/hb.jpg',
    'assets/he.jpg',
    'assets/hi.jpg',
    'assets/bi.jpg',
    'assets/hq.jpg'
  ];

  final List<String> userProfiles = [
    'assets/man.png',
    'assets/women.png',
    'assets/Tele.png',
  ];

  List<Widget> getImages() {
    return hello
        .map((e) => ClipRRect(
              child: Image.asset(
                e,
                width: 400,
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(20.1),
            ))
        .toList();
  }

  final PageController contro = PageController();
  int myindex = 0;

  Future<List<ProductRest>> _getproduct() async {
    var url = Uri.parse("https://fakestoreapi.com/products");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        List<ProductRest> products = data.map<ProductRest>((item) {
          return ProductRest.fromJson(item);
        }).toList();

        return products;
      } else {
        print('API returned an error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.red],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.redAccent,
              ))
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        elevation: 2.3,
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.person_2_sharp,
                  size: 30,
                  color: Colors.black,
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.all(0),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      Icons.male,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(width: 16),
                    Text(
                      "Men",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => storybar2()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding: EdgeInsets.all(0),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      Icons.female,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(width: 16),
                    Text(
                      "Women",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.all(0),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () async {},
                      icon: Icon(Icons.exit_to_app),
                    ),
                    SizedBox(width: 16),
                    Text(
                      "Logout",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
          child: Column(children: [
        Container(
          width: 500,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          child: AnimationSearchBar(
            onChanged: (keyword) {
              setState(() {
                isSearch = keyword.isNotEmpty;
              });
            },
            searchTextEditingController: controller,
            backIcon: Icons.arrow_back_ios_new,
            backIconColor: Colors.white,
            hintText: 'Search here...',
            centerTitleStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 20,
            ),
            hintStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            cursorColor: Colors.lightBlue.shade300,
            duration: const Duration(milliseconds: 500),
            searchFieldHeight: 35,
            searchBarHeight: 50,
            searchBarWidth: MediaQuery.of(context).size.width - 30,
            horizontalPadding: 5,
            verticalPadding: 0,
            searchIconColor: Colors.grey.withOpacity(.7),
            searchFieldDecoration: BoxDecoration(
              color: Colors.blueGrey.shade700,
              border:
                  Border.all(color: Colors.black.withOpacity(.2), width: .6),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        Container(
          height: 70,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://st2.depositphotos.com/3676619/7616/v/600/depositphotos_76164217-stock-illustration-fashion-girl-in-sketch-style.jpg"),
                  fit: BoxFit.cover,
                  alignment: Alignment.center)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => storybar()));
              },
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(userProfiles[1]),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Search()));
              },
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(userProfiles[0]),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) =>  s));
              },
              child: CircleAvatar(
                  radius: 30, backgroundImage: AssetImage(userProfiles[2])),
            )
          ]),
        ),
        Expanded(
          child: Isproducts(),
        ),
      ])),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myindex = index;
          });

          switch (index) {
            case 0:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Shop3()));
              break;
            case 1:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Center(child: Text("Shop Page"))));
              break;
            case 2:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Center(child: Text("Favorite Page"))));
              break;
            case 3:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Center(child: Text("Profile Page"))));
              break;
            case 4: 
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AddProductPage())); 
          }
        },
        currentIndex: myindex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: 'Shop',
              backgroundColor: Colors.pink),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add Product',
              backgroundColor: Colors.orange), // New icon and label
        ],
      ),
    );
  }
}

class Isproducts extends StatefulWidget {
  @override
  State<Isproducts> createState() {
    return Screen4();
  }
}

class Screen4 extends State<Isproducts> {
  List<ProductRest> searchproduct = [];
  bool isSearch = false;
  TextEditingController controller = TextEditingController();

  Future<List<ProductRest>> _getproduct() async {
    var url = Uri.parse("https://fakestoreapi.com/products");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        List<ProductRest> products = data.map<ProductRest>((item) {
          return ProductRest.fromJson(item);
        }).toList();

        return products;
      } else {
        print('API returned an error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductRest>>(
      future: _getproduct(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text('No products available.'),
          );
        } else {
          List<ProductRest> products = snapshot.data!;
          if (isSearch) {
            products = products.where((product) {
              final lowerCaseQuery = controller.text.toLowerCase();
              return product.title.toLowerCase().contains(lowerCaseQuery) ||
                  product.category.toLowerCase().contains(lowerCaseQuery);
            }).toList();
          }
          return GridView.builder(
            padding: EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        productImage: product.image,
                        productId: product.id,
                        productName: product.title,
                        productPrice: product.price,
                      ),
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        product.image,
                        height: 99,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Text(
                          product.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('\$${product.price.toStringAsFixed(2)}'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
