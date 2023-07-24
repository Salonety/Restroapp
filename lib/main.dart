import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'dart:async';
import 'dart:convert';


class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff191919),
        automaticallyImplyLeading: false,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Row(
                children: [
                  PopupMenuButton(
                    icon: const Icon(
                      Icons.account_circle,
                      color: Color(0xffb3ff66),
                      size: 40,
                    ),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'profile',
                        child: Row(
                          children: [
                            Icon(Icons.person),
                            SizedBox(width: 8),
                            Text('Profile'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                          value: 'menu',
                          child:Row(children: [Icon(Icons.menu_book),SizedBox(width: 8),Text('Menu'), ],)
                      ),
                      const PopupMenuItem(
                          value: 'settings',
                          child: Row(children: [Icon(Icons.settings),SizedBox(width: 8),Text('Settings'), ],)
                      ),
                      const PopupMenuItem(
                          value: 'sign Out',
                          child: Row(children: [Icon(Icons.logout),SizedBox(width: 8),Text('Sign Out'), ],)
                      )

                    ],
                    onSelected: (value) {
                      // Handle menu item selection here
                      if (value == 'profile') {
                        // Handle profile menu item click
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyProfile()),
                        );
                      } else if (value == 'menu') {
                        // Handle menu menu item click
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Menu()),
                        );
                      } else if (value == 'settings') {
                        // Handle happy menu item click
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Settings()),
                        );
                      }
                      else if (value == 'sign Out') {
                        // Handle happy menu item click
                      }
                    },
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    'Restro Magic',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Circle showing amount of tables occupied and empty
              Container(
                height: 200,
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 150,
                        height: 150,
                        child: const CircularProgressIndicator(
                          value: 0.7, // Example value for occupied tables (70%)
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.yellowAccent),
                          backgroundColor: Colors.indigoAccent,
                          strokeWidth: 10,
                        ),
                      ),
                    ),
                    const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '23', // Example value for occupied tables (70%)
                            style: TextStyle(fontSize: 24),
                          ),
                          Text(
                            'Running Tables',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '\$1000.99', // Example value for empty tables (30%)
                            style: TextStyle(fontSize: 24),
                          ),
                          Text(
                            'Total Sales',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Legend for circle colors and percentages
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildLegendItem(Colors.yellowAccent, 'Running Tables', '40%'),
                  _buildLegendItem(Colors.indigoAccent, 'Total Sales', '70%'),
                ],
              ),
              const SizedBox(height: 16),
              // Recent Orders
              const Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 8),
                  Text(
                    'Recent Orders',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              _buildOrderItem('John Doe', '1234567890', 'Pizza', '\$10.99'),
              _buildOrderItem('Jane Smith', '9876543210', 'Burger', '\$8.99'),
              _buildOrderItem('Mike Johnson', '5555555555', 'Salad', '\$6.99'),
              _buildOrderItem('John Doe', '1234567890', 'Pizza', '\$10.99'),
              _buildOrderItem('Jane Smith', '9876543210', 'Burger', '\$8.99'),
              _buildOrderItem('Mike Johnson', '5555555555', 'Salad', '\$6.99'),
              _buildOrderItem('John Doe', '1234567890', 'Pizza', '\$10.99'),
              _buildOrderItem('Jane Smith', '9876543210', 'Burger', '\$8.99'),
              _buildOrderItem('Mike Johnson', '5555555555', 'Salad', '\$6.99'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              IconButton(
                icon: const Icon(Icons.restaurant),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DineInScreen()),
                  );
                },
              ),
              IconButton(

                icon: const Icon(Icons.takeout_dining),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TakeawayScreen()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delivery_dining),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DeliveryScreen()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.not_interested),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NcScreen()),
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => LoginPage()),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label, String percentage) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(label),
        const SizedBox(width: 4),
        Text(percentage),
      ],
    );
  }

  Widget _buildOrderItem(
      String name, String phoneNumber, String order, String amountPaid) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(phoneNumber),
            Text(order),
            Text(amountPaid),
          ],
        ),
        trailing: const Icon(Icons.payment),
      ),
    );
  }
}

class MenuListScreen extends StatefulWidget {
  final FoodItem foodItem;

  MenuListScreen({required this.foodItem});

  List<VegItem> vegItems = [
    VegItem(
      name: 'CHOLE BHATURE',
      price: '100 INR',
      imagePath: 'assets/images/chloe.jpg',
    ),
    VegItem(
      name: 'MATAR KULCHA',
      price: '102 INR',
      imagePath: 'assets/images/matar.jpg',
    ),
    VegItem(
      name: 'PAV BHAJI',
      price: '150 INR',
      imagePath: 'assets/images/paw.jpg',
    ),
    VegItem(
      name: 'KATHI ROLLS',
      price: '155 INR',
      imagePath: 'assets/images/kathi.jpg',
    ),
    VegItem(
      name: 'PAKORA',
      price: '800 INR',
      imagePath: 'assets/images/pakoda.jpg',
    ),
    VegItem(
      name: 'Pani Puri',
      price: '115 INR',
      imagePath: 'assets/images/panipuri.jpg',
    ),
    VegItem(
      name: 'Thali',
      price: '615 INR',
      imagePath: 'assets/images/thali.jpg',
    ),
    VegItem(
      name: 'Halwa',
      price: '155 INR',
      imagePath: 'assets/images/gajar.jpg',
    ),
    VegItem(
      name: 'Palak dal',
      price: '215 INR',
      imagePath: 'assets/images/palakdaal.jpg',
    ),
    VegItem(
      name: 'Bhindi do pyaza',
      price: '150 INR',
      imagePath: 'assets/images/bhindi.jpg',
    ),

    // Add more veg items as needed
  ];
  @override
  _MenuListScreenState createState() => _MenuListScreenState();
}
bool showAdditionalButton=false;
class _MenuListScreenState extends State<MenuListScreen>

    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<bool> showFirstButtonList;
  late int counter=0;
  List<int> counterList = [];
  List<Addinal>additems=[];
  List<MenuItemm> indians = [];


  Future<List<MenuItemm>> fetchMenuItems() async {
    final response = await http.get(Uri.parse('http://demo.wspl.co/api/Menus'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print('ssdfsdfsdfs:$response.body');

      return data.map((item) => MenuItemm.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load menu items');
    }
  }


  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    showFirstButtonList = List<bool>.filled(widget.vegItems.length, false);
    counterList = List<int>.filled(widget.vegItems.length, 0);
    additems = [];
    indians=[];
    fetchMenuItems();
    print("comingggthisblock");


  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    List<VegItem> vegItems = [
      VegItem(
        name: 'CHOLE BHATURE',
        price: '100 INR',
        imagePath: 'assets/images/chloe.jpg',
      ),
      VegItem(
        name: 'MATAR KULCHA',
        price: '102 INR',
        imagePath: 'assets/images/matar.jpg',
      ),
      VegItem(
        name: 'PAV BHAJI',
        price: '150 INR',
        imagePath: 'assets/images/paw.jpg',
      ),
      VegItem(
        name: 'KATHI ROLLS',
        price: '155 INR',
        imagePath: 'assets/images/kathi.jpg',
      ),
      VegItem(
        name: 'PAKORA',
        price: '800 INR',
        imagePath: 'assets/images/pakoda.jpg',
      ),
      VegItem(
        name: 'Pani Puri',
        price: '115 INR',
        imagePath: 'assets/images/panipuri.jpg',
      ),
      VegItem(
        name: 'Thali',
        price: '615 INR',
        imagePath: 'assets/images/thali.jpg',
      ),
      VegItem(
        name: 'Halwa',
        price: '155 INR',
        imagePath: 'assets/images/gajar.jpg',
      ),
      VegItem(
        name: 'Palak dal',
        price: '215 INR',
        imagePath: 'assets/images/palakdaal.jpg',
      ),
      VegItem(
        name: 'Bhindi do pyaza',
        price: '150 INR',
        imagePath: 'assets/images/bhindi.jpg',
      ),

      // Add more veg items as needed
    ];

    List<VegItem> nonvegItems = [
      VegItem(
        name: ' Mutton Korma',
        price: '100 INR',
        imagePath: 'assets/images/mutton.jpg',
      ),
      VegItem(
        name: 'Pina Colada Pork Ribs',
        price: '102 INR',
        imagePath: 'assets/images/prk.jpg',
      ),
      VegItem(
        name: 'Tandoori Lamb Chops',
        price: '150 INR',
        imagePath: 'assets/images/tandoorilamp.jpg',
      ),
      VegItem(
        name: 'Malabar Fish Biryani',
        price: '155 INR',
        imagePath: 'assets/images/Fishbiryani.jpg',
      ),
      VegItem(
        name: 'Keema Samosa with Yoghurt Dip',
        price: '800 INR',
        imagePath: 'assets/images/keemasamosa.jpg',
      ),
      VegItem(
        name: 'Curried Parmesan Fish Fingers',
        price: '115 INR',
        imagePath: 'assets/images/Curried.jpg',
      ),
      VegItem(
        name: 'Chicken 65',
        price: '615 INR',
        imagePath: 'assets/images/chicken65.jpg',
      ),
      VegItem(
        name: 'Nihari Gosht',
        price: '155 INR',
        imagePath: 'assets/images/niharighost.jpg',
      ),
      VegItem(
        name: 'Butter Chicken',
        price: '215 INR',
        imagePath: 'assets/images/butterchicken.jpg',
      ),
      VegItem(
        name: 'Hyderabadi Chicken Fry',
        price: '150 INR',
        imagePath: 'assets/images/hyderbaad.jpg',
      ),

      // Add more veg items as needed
    ];
    List<VegItem> chaiveg = [
      VegItem(
        name: 'Veg Manchurian',
        price: '200 INR',
        imagePath: 'assets/chaina/man.jpg',
      ),
      VegItem(
        name: 'Fried Rice',
        price: '102 INR',
        imagePath: 'assets/chaina/fried.jpg',
      ),
      VegItem(
        name: 'Chilli Potato',
        price: '150 INR',
        imagePath: 'assets/chaina/chilli.jpg',
      ),
      VegItem(
        name: 'Honey Chilli Potato',
        price: '155 INR',
        imagePath: 'assets/chaina/honey.jpg',
      ),
      VegItem(
        name: 'Noodles ',
        price: '800 INR',
        imagePath: 'assets/chaina/noodles.jpg',
      ),
      VegItem(
        name: 'SpringRolls',
        price: '115 INR',
        imagePath: 'assets/chaina/springro.jpg',
      ),
      VegItem(
        name: 'Manchow Soup',
        price: '615 INR',
        imagePath: 'assets/chaina/soup.jpg',
      ),
      VegItem(
        name: 'Hakka Noodles',
        price: '155 INR',
        imagePath: 'assets/chaina/hakka.jpg',
      ),
      VegItem(
        name: 'Chilli Paneer Dry',
        price: '215 INR',
        imagePath: 'assets/chaina/chilipanner.jpg',
      ),
      VegItem(
        name: 'Crunchy Iceberg Dumpling',
        price: '150 INR',
        imagePath: 'assets/chaina/dumpling.jpg',
      ),

      // Add more veg items as needed
    ];    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff191919),
         title:  Text('${widget.foodItem.title}',style:TextStyle( fontWeight: FontWeight.bold, // Add this line for bold font weight
             fontFamily: 'serif'),),

        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Veg'),
            Tab(text: 'Non-Veg'),

          ],
        ),
      ),

      body: Container(
        color: Colors.grey[300],

        child:TabBarView(
          controller: _tabController,

          children: [
/////////////vegsection
//           if (widget.foodItem.title == 'Indian Food')
//             {

            Padding(

              padding: EdgeInsets.all(8.0),

              child: ListView.builder(
                  itemCount: vegItems.length,
                  itemBuilder: (context, index) {
                    final item = vegItems[index];



                    print('ssSaadd4 :${showAdditionalButton}');
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 2,
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            item.imagePath,
                            width: 72,
                            height: 72,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(item.name,style:TextStyle(  // Add this line for bold font weight
                            fontFamily: 'serif'),),
                        subtitle: Text(item.price,style:TextStyle(  // Add this line for bold font weight
                            fontFamily: 'serif'),),

                        trailing: Column(
                            children: [
                              Visibility(
                                visible: !showFirstButtonList[index],
                                child:Container(
                                  margin: EdgeInsets.only(top: 15.0),
                                  width: 80,
                                  height: 30,

                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        showFirstButtonList[index] = true;
                                        counterList[index] = counterList[index] + 1;
                                        counter=counter+1;
                                        additems.add(Addinal( id: counter,
                                            name: vegItems[index].name,
                                            price: vegItems[index].price,
                                            imagePath: vegItems[index].imagePath));

                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.black, // Set the background color of the button
                                      onPrimary: Colors.white, // Set the text color of the button
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0), // Set the border radius
                                      ),
                                    ),
                                    child: Text('Add', style: TextStyle(fontSize: 10,// Add this line for bold font weight
                                        fontFamily: 'serif'),),
                                  ),


                                ),
                              ),

                              Visibility(
                                visible: showFirstButtonList[index],
                                child: Container(
                                    margin: EdgeInsets.only(top: 15.0),
                                    width: 80,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child:Row(
                                      mainAxisAlignment: MainAxisAlignment.start,

                                      children: [
                                        Container(
                                          width: 30, // Set the desired width
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                if( counterList[index]>0) {
                                                  counterList[index] =
                                                      counterList[index] - 1;
                                                  counter=counter-1;
                                                  int s=  counterList[index];
                                                  additems.removeAt(s);
                                                  int additemsSize = additems.length;
                                                  print('additemssize: $additemsSize');

                                                  if(counterList[index]==0)
                                                  {
                                                    showFirstButtonList[index] = false;
                                                  }
                                                }

                                              });
                                              // Handle minus button tap
                                            },
                                            icon: Icon(Icons.remove, size: 12),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            counterList[index].toString(),
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.center,

                                          ),
                                        ),
                                        Container(
                                          width: 30, // Adjust the width as needed
                                          child: IconButton(
                                            onPressed: () {
                                              // Handle plus button tap
                                              setState(() {
                                                counterList[index] = counterList[index] + 1;
                                                counter=counter+1;
                                                additems.add(Addinal( id: counter,
                                                    name: vegItems[index].name,
                                                    price: vegItems[index].price,
                                                    imagePath: vegItems[index].imagePath));
                                                int additemsSize = additems.length;
                                                print('additemssize: $additemsSize');

                                              });


                                            },
                                            icon: Icon(Icons.add, size: 12),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),





                            ]
                        ),

                      ),
                    );


                    // Rest of the code for Chinese Food items
                  }


              ),


            ),


//////////////

            // Non-Veg tab content
///////////////////nonversection
            Padding(
              padding: EdgeInsets.all(8.0), // Adjust the margin value as needed
              child: ListView.builder(
                itemCount: nonvegItems.length,
                itemBuilder: (context, index) {
                  final item = nonvegItems[index];

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 2,
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          item.imagePath,
                          width: 72,
                          height: 72,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(item.name),
                      subtitle: Text(item.price),
                      trailing: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          // Perform action when add button is pressed
                        },
                      ),
                    ),
                  );
                },
              ),

            ),

          ],

        ),

      ),

      bottomNavigationBar: BottomAppBar(
        color: const Color(0xff191919),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Add to Card : $counter Items",  style: TextStyle(
                fontSize: 20,color: Colors.white,fontFamily: "serif",
            ),
            ),
            IconButton(
              icon: Image.asset('assets/images/rightback.png'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context)=>FinalitemListScreen(additems:additems)),);

                // Handle button press
              },
            ),
          ],
        ),
      ),
    );

  }


}


////////////////////////////////

class MenuItemm {
  final String disName;
  final String largePrice;

  MenuItemm({required this.disName, required this.largePrice});

  factory MenuItemm.fromJson(Map<String, dynamic> json) {
    return MenuItemm(
      disName: json['disName'],
      largePrice: json['largePrice'],
    );
  }
}

class TableCard extends StatelessWidget {
  final String time;
  final String number;
  final int index;
  final bool isRed;
  final bool isGreen;
  final String ammount;
  final bool isResGreen;

  const TableCard({
    required this.time,
    required this.number,
    required this.index,
    this.isRed = false,
    this.isGreen = false,
    required this.ammount,
    this.isResGreen = false,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(

        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          color: Colors.white,
         // color: isResGreen ? Colors.grey[300] : Colors.grey[300],
          border: Border.all(
            color: Colors.black,
            width: 0.8,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold, // Add this line for bold font weight
                  fontFamily: 'serif',
                  color: isRed ? Colors.red : isGreen ? Colors.green : Colors.black,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                number,
                // style: const TextStyle(
                //   fontSize: 16.0,
                //   color: Colors.black,
                //
                //   //color: isRed ? Colors.red : isGreen ? Colors.green : Colors.black,
                // ),
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold, // Add this line for bold font weight
                  fontFamily: 'serif',
                  color: isRed ? Colors.red : isGreen ? Colors.green : Colors.black,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                ammount,
                // style: const TextStyle(
                //   fontSize: 16.0,
                //   color: Colors.black,
                //
                //   //color: isRed ? Colors.red : isGreen ? Colors.green : Colors.black,
                // ),
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'serif',
                  color: isRed ? Colors.red : isGreen ? Colors.green : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class TakeawayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff191919),
        title: const Text('Takeaway Screen'),
      ),
      body: const Center(
        child: Text('Takeaway Screen'),
      ),
    );
  }
}

class Recommendations {
  final String name;
  final double price;
  final double rating;
  final double Servings;
  final String imagePath;
  Recommendations({required this.name, required this.price, required this.rating, required this.Servings, required this.imagePath});


}
class Dessert {
  final String name;
  final double price;
  final double rating;
  final double Servings;
  final String imagePath;
  Dessert({required this.name, required this.price, required this.rating, required this.Servings, required this.imagePath});


}
class MenuItem {
  final String name;
  final String description;
  final double price;
  final String imagePath;

  MenuItem({required this.name, required this.description, required this.price,required this.imagePath});
}
class SlideItem {
  final String title;
  final String imagePath;

  SlideItem({required this.title, required this.imagePath});
}

class DeliveryScreen extends StatefulWidget {
  bool showAdditionalButton=false;

  List<MenuItem> menuItems = [
    MenuItem(name: 'Indian', description: 'Description of item 1', price: 10.99, imagePath: 'assets/images/chloe.jpg'),
    MenuItem(name: 'Chinese', description: 'Description of item 2', price: 8.99, imagePath: 'assets/images/hakka.jpg'),
    MenuItem(name: 'Spanish', description: 'Description of item 2', price: 8.99, imagePath: 'assets/images/japni.jpg'),
    MenuItem(name: 'korean', description: 'Description of item 2', price: 8.99, imagePath: 'assets/images/dumpling.jpg'),
    MenuItem(name: 'South Indian', description: 'Description of item 2', price: 8.99, imagePath: 'assets/images/southindian.jpg'),
    MenuItem(name: 'Italian', description: 'Description of item 2', price: 8.99, imagePath: 'assets/images/italic.jpg'),
    // Add more menu items here
  ];
  List<Recommendations> recommendations =[
    Recommendations(name:'Chole Bhature', price:200, rating:4.3, Servings:2, imagePath:'assets/images/chloe.jpg'),
    Recommendations(name:'Pav Bhaji', price:150, rating:4.2, Servings:1, imagePath:'assets/images/paw.jpg'),
    Recommendations(name:'Butter Chicken', price:250, rating:4.7, Servings:2, imagePath:'assets/images/butterchicken.jpg'),
    Recommendations(name:'Palak Dal', price:200, rating:4.0, Servings:2, imagePath:'assets/images/palakdaal.jpg')];
  List<Dessert> dessert =[
    Dessert(name:'Jalebi', price:200, rating:4.2, Servings:2, imagePath:'assets/images/jalebi.jpeg'),
    Dessert(name:'chocolate cake', price:150, rating:4.3, Servings:1, imagePath:'assets/images/cake.jpeg'),
    Dessert(name:'Chocolate tart', price:250, rating:4.4, Servings:2, imagePath:'assets/images/tart.jpeg'),
    Dessert(name:'Rasmalai', price:200, rating:5.0, Servings:2, imagePath:'assets/images/rasmlai.jpeg')];




  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}
class _DeliveryScreenState extends State<DeliveryScreen>

    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<bool> showFirstButtonList;
  late int counter=0;
  List<int> counterList = [];
  List<Addinal>additems=[];


  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    showFirstButtonList = List<bool>.filled(widget.recommendations.length, false);
    counterList = List<int>.filled(widget.recommendations.length, 0);
    additems = [];

  }



  @override
  Widget build(BuildContext context) {

    List<MenuItem> menuItems = [
      MenuItem(name: 'Indian', description: 'Description of item 1', price: 10.99, imagePath: 'assets/images/chloe.jpg'),
      MenuItem(name: 'Chinese', description: 'Description of item 2', price: 8.99, imagePath: 'assets/images/hakka.jpg'),
      MenuItem(name: 'Spanish', description: 'Description of item 2', price: 8.99, imagePath: 'assets/images/japni.jpg'),
      MenuItem(name: 'korean', description: 'Description of item 2', price: 8.99, imagePath: 'assets/images/dumpling.jpg'),
      MenuItem(name: 'South Indian', description: 'Description of item 2', price: 8.99, imagePath: 'assets/images/southindian.jpg'),
      MenuItem(name: 'Italian', description: 'Description of item 2', price: 8.99, imagePath: 'assets/images/italic.jpg'),
      // Add more menu items here
    ];
    List<Recommendations> recommendations =[
      Recommendations(name:'Chole Bhature', price:200, rating:4.3, Servings:2, imagePath:'assets/images/chloe.jpg'),
      Recommendations(name:'Pav Bhaji', price:150, rating:4.2, Servings:1, imagePath:'assets/images/paw.jpg'),
      Recommendations(name:'Butter Chicken', price:250, rating:4.7, Servings:2, imagePath:'assets/images/butterchicken.jpg'),
      Recommendations(name:'Palak Dal', price:200, rating:4.0, Servings:2, imagePath:'assets/images/palakdaal.jpg')];
    List<Dessert> dessert =[
      Dessert(name:'Jalebi', price:200, rating:4.2, Servings:2, imagePath:'assets/images/jalebi.jpeg'),
      Dessert(name:'chocolate cake', price:150, rating:4.3, Servings:1, imagePath:'assets/images/cake.jpeg'),
      Dessert(name:'Chocolate tart', price:250, rating:4.4, Servings:2, imagePath:'assets/images/tart.jpeg'),
      Dessert(name:'Rasmalai', price:200, rating:5.0, Servings:2, imagePath:'assets/images/rasmlai.jpeg')];



    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff191919),
        title: const Text('Delivery Screen'),
      ),
      body: SingleChildScrollView(child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for dishes...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Container(
            height: 150,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 150,
                viewportFraction: 1.0,
                autoPlay: true,
                autoPlayInterval: const Duration(milliseconds: 1500),
              ),
              items: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/images/slide1.jpeg'),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/images/slide2.jpeg'),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/images/slide3.jpeg'),
                ),
              ],
            ),
          )
          ,
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'What would you like to order?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 120,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage(menuItems[index].imagePath),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        menuItems[index].name,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Our Top Recommendations',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recommendations.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 120,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                            image: AssetImage(recommendations[index].imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        recommendations[index].name,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        "Price: ${recommendations[index].price}",
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Servings: ${recommendations[index].Servings}",
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Rating: ${recommendations[index].rating}",
                        textAlign: TextAlign.center,
                      ),
                      RatingBar.builder(
                        initialRating: recommendations[index].rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 16.0,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.lightGreen,
                        ),
                        onRatingUpdate: (rating) {
                          // Do something with the new rating
                        },
                      ),
                      ////////////
                     Column(
                          children: [
                            Visibility(
                              visible: !showFirstButtonList[index],
                              child:Container(
                                margin: EdgeInsets.only(top: 15.0),
                                width: 80,
                                height: 30,

                                child: ElevatedButton(
                                  onPressed: () {
                                    // setState(() {
                                    //   showFirstButtonList[index] = true;
                                    //   counterList[index] = counterList[index] + 1;
                                    //   counter=counter+1;
                                    //   additems.add(Addinal( id: counter,
                                    //       name: vegItems[index].name,
                                    //       price: vegItems[index].price,
                                    //       imagePath: vegItems[index].imagePath));
                                    //
                                    // });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black, // Set the background color of the button
                                    onPrimary: Colors.white, // Set the text color of the button
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0), // Set the border radius
                                    ),
                                  ),
                                  child: Text('Add', style: TextStyle(fontSize: 10)),
                                ),


                              ),
                            ),

                            Visibility(
                              visible: showFirstButtonList[index],
                              child: Container(
                                  margin: EdgeInsets.only(top: 15.0),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.start,

                                    children: [
                                      Container(
                                        width: 30, // Set the desired width
                                        child: IconButton(
                                          onPressed: () {
                                            // setState(() {
                                            //   if( counterList[index]>0) {
                                            //     counterList[index] =
                                            //         counterList[index] - 1;
                                            //     counter=counter-1;
                                            //     int s=  counterList[index];
                                            //     additems.removeAt(s);
                                            //     int additemsSize = additems.length;
                                            //     print('additemssize: $additemsSize');
                                            //
                                            //     if(counterList[index]==0)
                                            //     {
                                            //       showFirstButtonList[index] = false;
                                            //     }
                                            //   }
                                            //
                                            // });
                                            // Handle minus button tap
                                          },
                                          icon: Icon(Icons.remove, size: 12),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          counterList[index].toString(),
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,

                                        ),
                                      ),
                                      Container(
                                        width: 30, // Adjust the width as needed
                                        child: IconButton(
                                          onPressed: () {
                                            // Handle plus button tap
                                            // setState(() {
                                            //   counterList[index] = counterList[index] + 1;
                                            //   counter=counter+1;
                                            //   additems.add(Addinal( id: counter,
                                            //       name: vegItems[index].name,
                                            //       price: vegItems[index].price,
                                            //       imagePath: vegItems[index].imagePath));
                                            //   int additemsSize = additems.length;
                                            //   print('additemssize: $additemsSize');
                                            //
                                            // });


                                          },
                                          icon: Icon(Icons.add, size: 12),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),





                          ]
                      ),

                      ////////////

                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recommendations.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 120,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                            image: AssetImage(recommendations[index].imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        recommendations[index].name,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        "Price: ${recommendations[index].price}",
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Servings: ${recommendations[index].Servings}",
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Rating: ${recommendations[index].rating}",
                        textAlign: TextAlign.center,
                      ),
                      RatingBar.builder(
                        initialRating: recommendations[index].rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 16.0,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.lightGreen,
                        ),
                        onRatingUpdate: (rating) {
                          // Do something with the new rating
                        },
                      ),
                      ///
                      Column(
                          children: [
                            Visibility(
                              visible: !showFirstButtonList[index],
                              child:Container(
                                margin: EdgeInsets.only(top: 15.0),
                                width: 80,
                                height: 30,

                                child: ElevatedButton(
                                  onPressed: () {
                                    // setState(() {
                                    //   showFirstButtonList[index] = true;
                                    //   counterList[index] = counterList[index] + 1;
                                    //   counter=counter+1;
                                    //   additems.add(Addinal( id: counter,
                                    //       name: vegItems[index].name,
                                    //       price: vegItems[index].price,
                                    //       imagePath: vegItems[index].imagePath));
                                    //
                                    // });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black, // Set the background color of the button
                                    onPrimary: Colors.white, // Set the text color of the button
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0), // Set the border radius
                                    ),
                                  ),
                                  child: Text('Add', style: TextStyle(fontSize: 10)),
                                ),


                              ),
                            ),

                            Visibility(
                              visible: showFirstButtonList[index],
                              child: Container(
                                  margin: EdgeInsets.only(top: 15.0),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.start,

                                    children: [
                                      Container(
                                        width: 30, // Set the desired width
                                        child: IconButton(
                                          onPressed: () {
                                            // setState(() {
                                            //   if( counterList[index]>0) {
                                            //     counterList[index] =
                                            //         counterList[index] - 1;
                                            //     counter=counter-1;
                                            //     int s=  counterList[index];
                                            //     additems.removeAt(s);
                                            //     int additemsSize = additems.length;
                                            //     print('additemssize: $additemsSize');
                                            //
                                            //     if(counterList[index]==0)
                                            //     {
                                            //       showFirstButtonList[index] = false;
                                            //     }
                                            //   }
                                            //
                                            // });
                                            // Handle minus button tap
                                          },
                                          icon: Icon(Icons.remove, size: 12),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          counterList[index].toString(),
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,

                                        ),
                                      ),
                                      Container(
                                        width: 30, // Adjust the width as needed
                                        child: IconButton(
                                          onPressed: () {
                                            // Handle plus button tap
                                            // setState(() {
                                            //   counterList[index] = counterList[index] + 1;
                                            //   counter=counter+1;
                                            //   additems.add(Addinal( id: counter,
                                            //       name: vegItems[index].name,
                                            //       price: vegItems[index].price,
                                            //       imagePath: vegItems[index].imagePath));
                                            //   int additemsSize = additems.length;
                                            //   print('additemssize: $additemsSize');
                                            //
                                            // });


                                          },
                                          icon: Icon(Icons.add, size: 12),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),





                          ]
                      ),
                      ///

                    ],
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Top dessert To Satisfy Your Sweet Tooth',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dessert.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 120,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                            image: AssetImage(dessert[index].imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        dessert[index].name,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        "Price: ${dessert[index].price}",
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Servings: ${dessert[index].Servings}",
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Rating: ${dessert[index].rating}",
                        textAlign: TextAlign.center,
                      ),
                      RatingBar.builder(
                        initialRating: dessert[index].rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 16.0,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.lightGreen,
                        ),
                        onRatingUpdate: (rating) {
                          // Do something with the new rating
                        },
                      ),
                      Column(
                          children: [
                            Visibility(
                              visible: !showFirstButtonList[index],
                              child:Container(
                                margin: EdgeInsets.only(top: 15.0),
                                width: 80,
                                height: 30,

                                child: ElevatedButton(
                                  onPressed: () {
                                    // setState(() {
                                    //   showFirstButtonList[index] = true;
                                    //   counterList[index] = counterList[index] + 1;
                                    //   counter=counter+1;
                                    //   additems.add(Addinal( id: counter,
                                    //       name: vegItems[index].name,
                                    //       price: vegItems[index].price,
                                    //       imagePath: vegItems[index].imagePath));
                                    //
                                    // });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black, // Set the background color of the button
                                    onPrimary: Colors.white, // Set the text color of the button
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0), // Set the border radius
                                    ),
                                  ),
                                  child: Text('Add', style: TextStyle(fontSize: 10)),
                                ),


                              ),
                            ),

                            Visibility(
                              visible: showFirstButtonList[index],
                              child: Container(
                                  margin: EdgeInsets.only(top: 15.0),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.start,

                                    children: [
                                      Container(
                                        width: 30, // Set the desired width
                                        child: IconButton(
                                          onPressed: () {
                                            // setState(() {
                                            //   if( counterList[index]>0) {
                                            //     counterList[index] =
                                            //         counterList[index] - 1;
                                            //     counter=counter-1;
                                            //     int s=  counterList[index];
                                            //     additems.removeAt(s);
                                            //     int additemsSize = additems.length;
                                            //     print('additemssize: $additemsSize');
                                            //
                                            //     if(counterList[index]==0)
                                            //     {
                                            //       showFirstButtonList[index] = false;
                                            //     }
                                            //   }
                                            //
                                            // });
                                            // Handle minus button tap
                                          },
                                          icon: Icon(Icons.remove, size: 12),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          counterList[index].toString(),
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,

                                        ),
                                      ),
                                      Container(
                                        width: 30, // Adjust the width as needed
                                        child: IconButton(
                                          onPressed: () {
                                            // Handle plus button tap
                                            // setState(() {
                                            //   counterList[index] = counterList[index] + 1;
                                            //   counter=counter+1;
                                            //   additems.add(Addinal( id: counter,
                                            //       name: vegItems[index].name,
                                            //       price: vegItems[index].price,
                                            //       imagePath: vegItems[index].imagePath));
                                            //   int additemsSize = additems.length;
                                            //   print('additemssize: $additemsSize');
                                            //
                                            // });


                                          },
                                          icon: Icon(Icons.add, size: 12),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),





                          ]
                      ),
                    ],
                  ),
                );
              },
            ),
          )


        ],
      ),),

    );
  }

}

class NcScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff191919),
        title: const Text('N/C Screen'),
      ),
      body: const Center(
        child: Text('N/C Screen'),
      ),
    );
  }
}
class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff191919),
        title: const Text('My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage('https://example.com/profile_image.jpg'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: FloatingActionButton(backgroundColor:  Color(0xff191919),
                      onPressed: () {
                        // Implement upload functionality here
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt, color: Color(0xffb3ff66)),
                        ],
                      ),

                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.person),
              title: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter name',
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  hintText: 'Enter phone number',
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Enter email',
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: TextFormField(
                controller: dobController,
                decoration: const InputDecoration(
                  hintText: 'Enter date of birth',
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Implement update information functionality here
                  String name = nameController.text;
                  String phone = phoneController.text;
                  String email = emailController.text;
                  String dob = dobController.text;

                  // Perform the update operation with the obtained values
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>( Color(0xff191919)),
                ),
                icon: Icon(Icons.update, color: Color(0xffb3ff66)),
                label: const Text('Update Information', style: TextStyle(color: Colors.white)),
              ),

            ),
          ],
        ),
      ),
    );
  }
}



class Menu extends StatelessWidget {
  final List<FoodItem> foodList = [
    FoodItem(title: 'Indian Food ', imagePath: 'assets/images/indian_food_1.jpg'),
    FoodItem(title: 'Chainese Food', imagePath: 'assets/images/chainesefood.jpg'),
    FoodItem(title: 'South Indian Food', imagePath: 'assets/images/southindian.jpg'),
    FoodItem(title: "Japanese Food", imagePath: 'assets/images/japni.jpg'),
    FoodItem(title: "Italian Food", imagePath: 'assets/images/italic.jpg'),
    FoodItem(title: "Thai Food", imagePath: 'assets/images/italic.jpg'),
    FoodItem(title: "Continental Food", imagePath: 'assets/images/coo.jpg'),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff191919),
        title: const Text('Menu' ,style: TextStyle( fontWeight: FontWeight.bold, // Add this line for bold font weight
            fontFamily: 'serif'),),
      ),
      // body: const Center(
      //   child: Text('Menu'),
      // ),
      backgroundColor: Colors.grey[300],
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: foodList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {

              print('hdhsdhsd:${foodList[index].title}');
              if(foodList[index].title=='Indian Food ')
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuListScreen(foodItem: foodList[index])),
                );
              }
              else if(foodList[index].title=='Chainese Food')
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuListScreenchai(foodItem: foodList[index])),
                );
              }
              else
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuListScreen(foodItem: foodList[index])),
                );
              }

              print('Tapped on ${foodList[index].title}');
              print('Tapped on ${foodList[index].title}');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Card(
                margin: EdgeInsets.all(8),

                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        foodList[index].imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        foodList[index].title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                            // Add this line for bold font weight
                            fontFamily: 'serif',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );

        },
      ),



    );
  }
}
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff191919),
        title: const Text('Settings'),
      ),
      body: const Center(
        child: Text('Settings'),
      ),
    );
  }
}




class DineInScreen extends StatefulWidget {


  @override
  _DineInScreenState createState() => _DineInScreenState();
}
class _DineInScreenState extends State<DineInScreen>

    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff191919),
           title:  Text(
             'Dine IN',
             style: TextStyle(
               fontFamily: 'serif',
             ),
           ),

          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                child: Text(
                  'Indoor',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                      fontFamily: 'serif'
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Balcony',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'serif'
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Garden',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'serif'
                  ),
                ),
              ),
            ],
          ),
            actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality here
            },
          ),
          IconButton(
            icon: const Icon(Icons.remove_red_eye_rounded),
            onPressed: () {
              // Implement search functionality here
              Fluttertoast.showToast(
                msg: 'show table reservation.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.grey[700],
                textColor: Colors.white,
                fontSize: 16.0,
              );

            },
          ),
          IconButton(
            icon: const Icon(Icons.table_restaurant),
            onPressed: () {
              // Implement search functionality here
              Fluttertoast.showToast(
                msg: 'add table',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.grey[700],
                textColor: Colors.white,
                fontSize: 16.0,
              );

            },
          )
        ],
        ),

        body: Container(
          color: Colors.white,
          child:TabBarView(
            controller: _tabController,

            children: [

            SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Padding(

                    padding: EdgeInsets.only(top: 16, left: 0, bottom: 0, right: 0),
                    child:Row(
                      children: [

                        Container(
                          margin: EdgeInsets.only(left: 10.0,right: 10.0),
                          decoration: BoxDecoration(

                            color: Color(0xffb3ff66), // Set the desired background color
                            shape: BoxShape.circle, // Set the shape of the container (circle in this case)
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5.0), // Optional padding for the icon
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),

                        Text(
                          'Table Reservation',
                          style: TextStyle(fontSize: 20, color: Colors.black, // Add this line for italic font style
                              fontWeight: FontWeight.bold, // Add this line for bold font weight
                              fontFamily: 'serif'),
                        ),

              ]
                    ),
                  ),
                  Padding(

                    padding: EdgeInsets.only(top: 10, left: 1, bottom: 10, right: 1),
                    child:Row(
                        children: [

                          Container(
                            margin: EdgeInsets.only(left: 15.0,right: 10.0),
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(

                              color: Colors.white, // Set the desired background color
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black, // Set the desired border color
                                width: 2.0, // Set the desired border width
                              ),

                              // Set the shape of the container (circle in this case)
                            ),

                          ),

                          Text(
                            'Blank Table',
                            style: TextStyle(fontSize: 12, color: Colors.black, // Add this line for italic font style
                                fontWeight: FontWeight.bold, // Add this line for bold font weight
                                fontFamily: 'serif'),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 11.0,right: 10.0),
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(

                              color: Color(0xffb3ff66), // Set the desired background color
                              shape: BoxShape.circle,
                              // Set the shape of the container (circle in this case)
                            ),

                          ),

                          Text(
                            'Running Table',
                            style: TextStyle(fontSize: 12, color: Colors.black, // Add this line for italic font style
                                fontWeight: FontWeight.bold, // Add this line for bold font weight
                                fontFamily: 'serif'),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 11.0,right: 10.0),
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(

                              color: Colors.red, // Set the desired background color
                              shape: BoxShape.circle,
                              // Set the shape of the container (circle in this case)
                            ),

                          ),

                          Text(
                            'Payment Pending',
                            style: TextStyle(fontSize: 11, color: Colors.black, // Add this line for italic font style
                                fontWeight: FontWeight.bold, // Add this line for bold font weight
                                fontFamily: 'serif'),
                          ),
                        ]
                    ),


                  ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
                 child: GridView.count(
                    shrinkWrap: true,
                   physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time: "", number: 'T1', index: 4, ammount: ""),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"54 min",number: 'T2', index: 2, isGreen: true,ammount: '\Rs10.99'),),
                      Container(
                      margin: EdgeInsets.only(top: 25.0),
                        child:TableCard(time:" ",number: 'T3', index: 3, ammount: "", isResGreen: true),),

                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T4', index: 4, ammount: ""),),

                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T5', index: 5, ammount: ""),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T6', index: 6, isRed: true, ammount: ""),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T7', index: 7, ammount: ""),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T8', index: 8, isRed: true,ammount: ""),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                     child: TableCard(time:"",number: 'T9', index: 9, ammount: ""),),

                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T10', index: 10, isRed: false, ammount: "",isResGreen: true),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T11', index: 11, isRed: true, ammount: ""),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"12 min",number: 'T12', index: 12, isGreen: true , ammount: '\Rs10.99'),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"77 min",number: 'T13', index: 13, isGreen: true,ammount: '\Rs10.99'),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T14', index: 14, isRed: true, ammount: ""),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T15', index: 15, ammount: ""),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T16', index: 16, ammount: ""),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T17', index: 17, ammount: ""),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T18', index: 18, isRed: false, ammount: ""),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T19', index: 19, isRed: true,ammount: ""),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T20', index: 20, isRed: true,ammount: ""),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T21', index: 21, ammount: ""),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"77 min",number: 'T22', index: 22, isGreen: true,ammount: '\Rs10.99'),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                     child: TableCard(time:"7 min",number: 'T23', index: 23, isGreen: true,ammount: '\Rs10.99'),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"7 min",number: 'T24', index: 24, isGreen: true,ammount: '\Rs10.99'),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T25', index: 25, ammount: "",isResGreen: true),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T26', index: 26, isRed: true, ammount: ""),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T27', index: 27, ammount: ""),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T28', index: 28, ammount: ""),),

                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T29', index: 29, ammount: ""),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T30', index: 30, isRed: true, ammount: "",isResGreen: true),),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T31', index: 31, ammount: ""),),

                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                      child:TableCard(time:"",number: 'T31', index: 32,isRed: true, ammount: ""),),

                    ],
                  ),

            ),
          ],
              ),
            ),
          ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Padding(

                        padding: EdgeInsets.only(top: 16, left: 0, bottom: 0, right: 0),
                        child:Row(
                            children: [

                              Container(
                                margin: EdgeInsets.only(left: 10.0,right: 10.0),
                                decoration: BoxDecoration(

                                  color: Color(0xffb3ff66), // Set the desired background color
                                  shape: BoxShape.circle, // Set the shape of the container (circle in this case)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5.0), // Optional padding for the icon
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                              ),

                              Text(
                                'Table Reservation',
                                style: TextStyle(fontSize: 20, color: Colors.black, // Add this line for italic font style
                                    fontWeight: FontWeight.bold, // Add this line for bold font weight
                                    fontFamily: 'serif'),
                              ),

                            ]
                        ),
                      ),
                      Padding(

                        padding: EdgeInsets.only(top: 10, left: 1, bottom: 10, right: 1),
                        child:Row(
                            children: [

                              Container(
                                margin: EdgeInsets.only(left: 15.0,right: 10.0),
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(

                                  color: Colors.white, // Set the desired background color
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.black, // Set the desired border color
                                    width: 2.0, // Set the desired border width
                                  ),

                                  // Set the shape of the container (circle in this case)
                                ),

                              ),

                              Text(
                                'Blank Table',
                                style: TextStyle(fontSize: 11, color: Colors.black, // Add this line for italic font style
                                    fontWeight: FontWeight.bold, // Add this line for bold font weight
                                    fontFamily: 'serif'),
                              ),

                              Container(
                                margin: EdgeInsets.only(left: 12.0,right: 10.0),
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(

                                  color: Color(0xffb3ff66), // Set the desired background color
                                  shape: BoxShape.circle,
                                  // Set the shape of the container (circle in this case)
                                ),

                              ),

                              Text(
                                'Running Table',
                                style: TextStyle(fontSize: 11, color: Colors.black, // Add this line for italic font style
                                    fontWeight: FontWeight.bold, // Add this line for bold font weight
                                    fontFamily: 'serif'),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 12.0,right: 10.0),
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(

                                  color: Colors.red, // Set the desired background color
                                  shape: BoxShape.circle,
                                  // Set the shape of the container (circle in this case)
                                ),

                              ),

                              Text(
                                'Payment Pending',
                                style: TextStyle(fontSize: 11, color: Colors.black, // Add this line for italic font style
                                    fontWeight: FontWeight.bold, // Add this line for bold font weight
                                    fontFamily: 'serif'),
                              ),
                            ]
                        ),


                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 4,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time: "", number: 'T1', index: 4, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"54 min",number: 'T2', index: 2, isGreen: true,ammount: '\Rs10.99'),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:" ",number: 'T3', index: 3, ammount: "", isResGreen: true),),

                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T4', index: 4, ammount: ""),),

                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T5', index: 5, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T6', index: 6, isRed: true, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T7', index: 7, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T8', index: 8, isRed: true,ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child: TableCard(time:"",number: 'T9', index: 9, ammount: ""),),

                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T10', index: 10, isRed: false, ammount: "",isResGreen: true),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T11', index: 11, isRed: true, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"12 min",number: 'T12', index: 12, isGreen: true , ammount: '\Rs10.99'),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"77 min",number: 'T13', index: 13, isGreen: true,ammount: '\Rs10.99'),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T14', index: 14, isRed: true, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T15', index: 15, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T16', index: 16, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T17', index: 17, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T18', index: 18, isRed: false, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T19', index: 19, isRed: true,ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T20', index: 20, isRed: true,ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T21', index: 21, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"77 min",number: 'T22', index: 22, isGreen: true,ammount: '\Rs10.99'),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child: TableCard(time:"7 min",number: 'T23', index: 23, isGreen: true,ammount: '\Rs10.99'),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"7 min",number: 'T24', index: 24, isGreen: true,ammount: '\Rs10.99'),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T25', index: 25, ammount: "",isResGreen: true),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T26', index: 26, isRed: true, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T27', index: 27, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T28', index: 28, ammount: ""),),

                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T29', index: 29, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T30', index: 30, isRed: true, ammount: "",isResGreen: true),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T31', index: 31, ammount: ""),),

                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T31', index: 32,isRed: true, ammount: ""),),

                          ],
                        ),

                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Padding(

                        padding: EdgeInsets.only(top: 16, left: 0, bottom: 0, right: 0),
                        child:Row(
                            children: [

                              Container(
                                margin: EdgeInsets.only(left: 10.0,right: 10.0),
                                decoration: BoxDecoration(

                                  color: Color(0xffb3ff66), // Set the desired background color
                                  shape: BoxShape.circle, // Set the shape of the container (circle in this case)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5.0), // Optional padding for the icon
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                              ),

                              Text(
                                'Table Reservation',
                                style: TextStyle(fontSize: 20, color: Colors.black, // Add this line for italic font style
                                    fontWeight: FontWeight.bold, // Add this line for bold font weight
                                    fontFamily: 'serif'),
                              ),

                            ]
                        ),
                      ),
                      Padding(

                        padding: EdgeInsets.only(top: 10, left: 1, bottom: 10, right: 1),
                        child:Row(
                            children: [

                              Container(
                                margin: EdgeInsets.only(left: 15.0,right: 10.0),
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(

                                  color: Colors.white, // Set the desired background color
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.black, // Set the desired border color
                                    width: 2.0, // Set the desired border width
                                  ),

                                  // Set the shape of the container (circle in this case)
                                ),

                              ),

                              Text(
                                'Blank Table',
                                style: TextStyle(fontSize: 11, color: Colors.black, // Add this line for italic font style
                                    fontWeight: FontWeight.bold, // Add this line for bold font weight
                                    fontFamily: 'serif'),
                              ),

                              Container(
                                margin: EdgeInsets.only(left: 12.0,right: 10.0),
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(

                                  color: Color(0xffb3ff66), // Set the desired background color
                                  shape: BoxShape.circle,
                                  // Set the shape of the container (circle in this case)
                                ),

                              ),

                              Text(
                                'Running Table',
                                style: TextStyle(fontSize: 11, color: Colors.black, // Add this line for italic font style
                                    fontWeight: FontWeight.bold, // Add this line for bold font weight
                                    fontFamily: 'serif'),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 12.0,right: 10.0),
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(

                                  color: Colors.red, // Set the desired background color
                                  shape: BoxShape.circle,
                                  // Set the shape of the container (circle in this case)
                                ),

                              ),

                              Text(
                                'Payment Pending',
                                style: TextStyle(fontSize: 11, color: Colors.black, // Add this line for italic font style
                                    fontWeight: FontWeight.bold, // Add this line for bold font weight
                                    fontFamily: 'serif'),
                              ),
                            ]
                        ),


                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 4,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time: "", number: 'T1', index: 4, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"54 min",number: 'T2', index: 2, isGreen: true,ammount: '\Rs10.99'),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:" ",number: 'T3', index: 3, ammount: "", isResGreen: true),),

                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T4', index: 4, ammount: ""),),

                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T5', index: 5, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T6', index: 6, isRed: true, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T7', index: 7, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T8', index: 8, isRed: true,ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child: TableCard(time:"",number: 'T9', index: 9, ammount: ""),),

                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T10', index: 10, isRed: false, ammount: "",isResGreen: true),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T11', index: 11, isRed: true, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"12 min",number: 'T12', index: 12, isGreen: true , ammount: '\Rs10.99'),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"77 min",number: 'T13', index: 13, isGreen: true,ammount: '\Rs10.99'),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T14', index: 14, isRed: true, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T15', index: 15, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T16', index: 16, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T17', index: 17, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T18', index: 18, isRed: false, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T19', index: 19, isRed: true,ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T20', index: 20, isRed: true,ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T21', index: 21, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"77 min",number: 'T22', index: 22, isGreen: true,ammount: '\Rs10.99'),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child: TableCard(time:"7 min",number: 'T23', index: 23, isGreen: true,ammount: '\Rs10.99'),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"7 min",number: 'T24', index: 24, isGreen: true,ammount: '\Rs10.99'),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T25', index: 25, ammount: "",isResGreen: true),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T26', index: 26, isRed: true, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T27', index: 27, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T28', index: 28, ammount: ""),),

                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T29', index: 29, ammount: ""),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T30', index: 30, isRed: true, ammount: "",isResGreen: true),),
                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T31', index: 31, ammount: ""),),

                            Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child:TableCard(time:"",number: 'T31', index: 32,isRed: true, ammount: ""),),

                          ],
                        ),

                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

        ),


    );

  }


}
/////////////
class MenuListScreenchai extends StatefulWidget {
  final FoodItem foodItem;

  MenuListScreenchai({required this.foodItem});



  @override
  _MenuListScreenChaiState createState() => _MenuListScreenChaiState();
}
class _MenuListScreenChaiState extends State<MenuListScreenchai>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    List<VegItem> nonvegItems = [
      VegItem(
        name: ' SHOWLIN CHICKEN',
        price: '100 INR',
        imagePath: 'assets/images/mutton.jpg',
      ),
      VegItem(
        name: 'FISH IN SCHEZWAN SAUCE',
        price: '102 INR',
        imagePath: 'assets/images/prk.jpg',
      ),
      VegItem(
        name: 'GINGER PRAWNS(GRAVY)',
        price: '150 INR',
        imagePath: 'assets/images/tandoorilamp.jpg',
      ),
      VegItem(
        name: 'FISH MANCHURIAN GRAVY',
        price: '155 INR',
        imagePath: 'assets/images/Fishbiryani.jpg',
      ),
      VegItem(
        name: 'GINGER CHICKEN(GRAVY)',
        price: '800 INR',
        imagePath: 'assets/images/keemasamosa.jpg',
      ),
      VegItem(
        name: 'SWEET & SOUR CHICKEN',
        price: '115 INR',
        imagePath: 'assets/images/Curried.jpg',
      ),
      VegItem(
        name: 'HONG KONG CHICKEN',
        price: '615 INR',
        imagePath: 'assets/images/chicken65.jpg',
      ),
      VegItem(
        name: 'LAMB WITH BLACK PEPPER SAUCE',
        price: '155 INR',
        imagePath: 'assets/images/niharighost.jpg',
      ),
      VegItem(
        name: 'PRAWNS MANCHURIAN GRAVY',
        price: '215 INR',
        imagePath: 'assets/images/butterchicken.jpg',
      ),
      VegItem(
        name: 'CHICKEN SUPREME',
        price: '150 INR',
        imagePath: 'assets/images/hyderbaad.jpg',
      ),

      // Add more veg items as needed
    ];
    List<VegItem> vegItems = [
      VegItem(
        name: 'Veg Manchurian',
        price: '200 INR',
        imagePath: 'assets/images/matar1.jpg',
      ),
      VegItem(
        name: 'Fried Rice',
        price: '102 INR',
        imagePath: 'assets/images/fried.jpg',
      ),
      VegItem(
        name: 'Chilli Potato',
        price: '150 INR',
        imagePath: 'assets/images/chilli.jpg',
      ),
      VegItem(
        name: 'Honey Chilli Potato',
        price: '155 INR',
        imagePath: 'assets/images/honey.jpg',
      ),
      VegItem(
        name: 'Noodles ',
        price: '800 INR',
        imagePath: 'assets/images/chilli.jpg',
      ),
      VegItem(
        name: 'SpringRolls',
        price: '115 INR',
        imagePath: 'assets/images/chilli.jpg',
      ),
      VegItem(
        name: 'Manchow Soup',
        price: '615 INR',
        imagePath: 'assets/images/fried.jpg',
      ),
      VegItem(
        name: 'Hakka Noodles',
        price: '155 INR',
        imagePath: 'assets/images/fried.jpg',
      ),
      VegItem(
        name: 'Chilli Paneer Dry',
        price: '215 INR',
        imagePath: 'assets/images/fried.jpg',
      ),
      VegItem(
        name: 'Crunchy Iceberg Dumpling',
        price: '150 INR',
        imagePath: 'assets/images/fried.jpg',
      ),

      // Add more veg items as needed
    ];    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff191919),
          title:  Text('${widget.foodItem.title}'),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Veg'),
              Tab(text: 'Non-Veg'),
            ],
          ),
        ),

        body: Container(
          color: Colors.grey[300],

          child:TabBarView(
            controller: _tabController,

            children: [
              Padding(

                padding: EdgeInsets.all(8.0),

                child: ListView.builder(
                    itemCount: vegItems.length,
                    itemBuilder: (context, index) {
                      final item = vegItems[index];



                      print('firstt2');
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 2,
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              item.imagePath,
                              width: 72,
                              height: 72,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(item.name),
                          subtitle: Text(item.price),
                          trailing: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              print("ckciedAddd");
                              // Perform action when add button is pressed
                            },
                          ),
                        ),
                      );
                      // Rest of the code for Chinese Food items
                    }


                ),
              ),

              Padding(
                padding: EdgeInsets.all(8.0), // Adjust the margin value as needed
                child: ListView.builder(
                  itemCount: nonvegItems.length,
                  itemBuilder: (context, index) {
                    final item = nonvegItems[index];

                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 2,
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            item.imagePath,
                            width: 72,
                            height: 72,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(item.name),
                        subtitle: Text(item.price),
                        trailing: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            // Perform action when add button is pressed
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}

//////////
class FinalitemListScreen extends StatelessWidget {
  final List<Addinal> additems;
  // Callback function to remove item

  //alitemListScreen({required this.additems, required this.removeItem});

 FinalitemListScreen({required this.additems});


  @override
  Widget build(BuildContext context) {
    double totalPrice=0;
    for (final item in additems) {
      final abc = item.price.split(" ");
      if (abc.isNotEmpty) {
        final price = double.tryParse(abc[0]);
        if (price != null) {
          totalPrice += price;
        }
      }
    }

    print("hello :$totalPrice");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff191919),
        title: Text('Item List'),
      ),
      body: Padding(

        padding: EdgeInsets.all(8.0),

        child: ListView.builder(
            itemCount: additems.length,
            itemBuilder: (context, index) {
              final item = additems[index];



              print('firstt2');
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 2,
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      item.imagePath,
                      width: 72,
                      height: 72,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(item.name),
                  subtitle: Text(item.price),
                  // trailing: IconButton(
                  //   icon: Icon(Icons.delete),
                  //   onPressed: () {
                  //
                  //     print("ckciedAddd");
                  //
                  //     // Perform action when add button is pressed
                  //   },
                  // ),
                ),
              );
              // Rest of the code for Chinese Food items
            }


        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: const Color(0xff191919),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Proceed To Pay : $totalPrice",style: TextStyle(
              fontFamily: 'Roboto',color: Colors.white,
              fontSize: 20,
            ),
            ),
            IconButton(
              icon: Image.asset('assets/images/rightback.png'),
              onPressed: () {
                // Handle button press
              },
            ),
          ],
        ),
      ),



    );
  }
}
//////////////////
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();

}



class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final TextEditingController phoneNumberController = TextEditingController();
  void submit() async {

    if (phoneNumberController.text == "") return;

    var appSignatureID = await SmsAutoFill().getAppSignature;
    Map sendOtpData = {
      "mobile_number": phoneNumberController.text,
      "app_signature_id": appSignatureID
    };


    print(sendOtpData);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  OTPScreen(phoneNumberController.text)),
    );
  }

  Future<void> sendMessage(BuildContext context, String mobileNumber, String message) async {
    final apiKey = 'de6cba5a46a24e16ad25f58d557c86bd';
    final url = Uri.parse('http://msgclub.softhubinc.com/rest/otpservice/generate-otp?AUTH_KEY=$apiKey&mobileNumber=$mobileNumber&message=$message');



    try {
      setState(() {
        _isLoading = false; // Start showing the progress indicator
      });

      final response = await http.get(url);
      var ssss = response.statusCode;
      print('printasaa :$ssss');

      if (response.statusCode == 200) {
        String phoneNumber = phoneNumberController.text;
        String responseBody = response.body;
        print("Hellooo: $responseBody");
        print("Hellooo: $phoneNumber");

        if (responseBody.contains("Mobile number is required")) {
          Fluttertoast.showToast(
            msg: 'Please Enter mobile number',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red[700],
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else if (phoneNumber.length < 10) {
          Fluttertoast.showToast(
            msg: 'Please enter 10 digit mobile number',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red[700],
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => OTPScreen(phoneNumber)),
          // );
          submit();
        }

        print('Message sent!');
      } else {
        print('Failed to send the message');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        _isLoading = false; // Stop showing the progress indicator
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 200.0, top: 80.0),
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),

              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Icon(
                   Icons.restaurant,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Text("Restromagic",
                style:TextStyle(fontSize: 25,fontFamily: "serif",fontWeight: FontWeight.bold,color: Colors.black)

              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50.0),
              child: Text("Login with your phone number",
                  style:TextStyle(fontSize: 15,fontFamily: "serif",color: Colors.black, fontStyle: FontStyle.italic,)

              ),
            ),
            // TextField(
            //   controller: phoneNumberController,
            //   keyboardType: TextInputType.phone,
            //   decoration: InputDecoration(
            //     labelText: 'Enter your mobile number',
            //     prefixIcon: Icon(
            //       Icons.phone,
            //       color: Colors.black,
            //     ),
            //     prefixStyle: TextStyle(
            //       color: Colors.black,
            //     ),
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.grey),
            //       borderRadius: BorderRadius.circular(10.0),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.black),
            //       borderRadius: BorderRadius.circular(10.0),
            //     ),
            //   ),
            // ),
            ListTile(
              title: TextFormField(
                controller: phoneNumberController,
                decoration: InputDecoration(
                  hintText: 'Enter your number',
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                      fontFamily: "serif",
                      fontSize: 15,
                   // Replace with your desired font size
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,

                      // Replace with your desired line color
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: _isLoading
                  ? null
                  : () {
                String phoneNumber = phoneNumberController.text;
                print("hettggg:$phoneNumber");
                sendMessage(context, phoneNumber, 'hello');
              },
              child: _isLoading
                  ? CircularProgressIndicator()
                  : Text('Send OTP'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///
class OTPScreen extends StatefulWidget {
  final String phoneNumber;


  //late var otpstring = " ";
  //final TextEditingController otpController = TextEditingController();

  OTPScreen(this.phoneNumber);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen>  {
  late var otpstring = " ";
  final TextEditingController otpController = TextEditingController();
  String otpCode = "";
  String otp = "";


  @override
  void codeUpdated() {

    setState(() {
      print("codeUpdated");
    });
  }
  @override
  void initState() {
  //  _listenOtp();

    super.initState();

    // // Simulate OTP auto-fill after a delay of 2 seconds
    // Future.delayed(Duration(seconds: 2), () {
    //   setState(() {
    //     _listenOtp();
    //     otpCode = "123456"; // Replace with the actual OTP you want to auto-fill
    //   });
    // });
    _listenOtp();
  }



  void _listenOtp() async {
   //  await SmsAutoFill().unregisterListener();
   // listenForCode();
    await SmsAutoFill().listenForCode;

    print("OTP listen Called");



  }

  validateOtp(String otp) {
    print('Code received $otp');
  }



  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    print("Unregistered Listener");
    super.dispose();
  }



  Future<bool> verifyOTP(BuildContext context,String mobileNumber, String otp) async {
    final url = 'http://msgclub.softhubinc.com/rest/otpservice/verify-otp';
    final authKey = 'de6cba5a46a24e16ad25f58d557c86bd';

    final response = await http.get(
      Uri.parse('$url?AUTH_KEY=$authKey&mobileNumber=$mobileNumber&otp=$otp'),
    );

    if (response.statusCode == 200) {
      // OTP verification successful
      String responseBody = response.body;
      print('resposnebodyy:$responseBody');
      // Check the response body for success/failure indicators
      if (responseBody.contains('success')) {
        print("sucess1");
        Navigator.push(context, MaterialPageRoute(builder:(context)=>DashboardScreen()),);
        return true;
      } else if (responseBody.contains('Either OTP is already used or invalid')) {
        print("sucess2");

        Fluttertoast.showToast(
          msg: 'Invalid Otp',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[700],
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return false;
      }
    }

    // OTP verification failed (handle other status codes or errors)
    return false;
  }



  @override
  Widget build(BuildContext context) {
    otpstring=" ";
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return WillPopScope(
        onWillPop: () async {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
      print("yellooee");


      return true;
        },
    child: Scaffold(
      resizeToAvoidBottomInset : false,

      appBar: AppBar(
        backgroundColor: const Color(0xff191919),
        title: Text('OTP Verification',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'serif'
        ),),

      ),
      body: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 200.0, top: 80.0),
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),

              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                 // color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(100),
                  // border: Border.all(
                  //   color: Colors.black,
                  //   width: 2,
                  // ),
                ),
                child: Center(
                  child: Icon(
                    Icons.lock,
                    color: Colors.black,
                    size: 70,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Text("Restromagic",
                  style:TextStyle(fontSize: 25,fontFamily: "serif",fontWeight: FontWeight.bold,color: Colors.black)

              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50.0),
              child: Text("Please enter the verification code",
                  style:TextStyle(fontSize: 15,fontFamily: "serif",color: Colors.black, fontStyle: FontStyle.italic,)

              ),
            ),
            // OtpTextField(
            //   numberOfFields: 6,
            //   borderColor:  Colors.black,
            //   enabledBorderColor:	Colors.black,
            //   disabledBorderColor: Colors.black,
            //
            //   //set to true to show as box or false to show as dash
            //   showFieldAsBox: false,
            //   //runs when a code is typed in
            //   onCodeChanged: (String code) {
            //     print('sshgdhsgdhgs: $code');
            //     otpCode = code.toString();
            //     //handle validation or checks here
            //   },
            //   onSubmit: (String verificationCode){
            //     otpstring=verificationCode;
            //
            //     print('verificationn: $verificationCode');
            //
            //   }, // end onSubmit
            // ),

            PinFieldAutoFill(
              currentCode: otpstring,
              // decoration:  BoxLooseDecoration(
              //     radius: Radius.circular(12),
              //     strokeColorBuilder: FixedColorBuilder(
              //         Color(0xFF8C4A52))),
              codeLength: 6,
              onCodeChanged: (code) {
                print("OnCodeChanged : $code");
                // otpCode = code.toString();
                otpstring = code.toString();
                print("OnCodeChanged : $code");
              },
              onCodeSubmitted: (val) {
                print("OnCodeSubmitted : $val");
              },
            ),


            Padding(
              padding: EdgeInsets.only(top:20,left: 200,right: 15), //apply padding to all four sides
              child: Text("Resend Code",style:TextStyle(fontSize: 15,color:Colors.black,fontWeight: FontWeight.bold,
                  fontFamily: 'serif'), ),
            ),

            SizedBox(height: 30.0),

            ElevatedButton(
              onPressed: () {
                print('optstringgg1:$otpstring');
                print('optstringgg2');

                if(otpstring==" ")
                {
                  Fluttertoast.showToast(
                    msg: 'Please enter the OTP',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red[700],
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
                else {
                  print('ppppp3: $widget.phoneNumber');
                  verifyOTP(context, widget.phoneNumber, otpstring);

                }

              },
              child: Text('Submit',style: TextStyle( fontWeight: FontWeight.bold,
                  fontFamily: 'serif'),),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
              ),
            ),
          ],
        ),
      ),

    ),
    );

  }
}



// void main() {
//   runApp(MaterialApp(
//     home: DashboardScreen(),
//   ));
// }
void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.black,
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(MaterialApp(
    home: LoginPage(),


  ));

}

class FoodItem {
  final String title;
  final String imagePath;

  FoodItem({required this.title, required this.imagePath});
}
class VegItem {
  final String name;
  final String price;
  final String imagePath;

  VegItem({required this.name, required this.price, required this.imagePath});
}
class Addinal {
  final int id;
  final String name;
  final String price;
  final String imagePath;

  Addinal({required this.id,required this.name, required this.price, required this.imagePath});
}

////////////

