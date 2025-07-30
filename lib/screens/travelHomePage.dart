import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webingo_demo/model/stay_model.dart';
import 'package:webingo_demo/providers/stay_provider.dart';
import 'package:webingo_demo/services/stay_service.dart';

class TravelHomePage extends StatefulWidget {
  const TravelHomePage({super.key});

  @override
  State<TravelHomePage> createState() => _TravelHomePageState();
}

class _TravelHomePageState extends State<TravelHomePage> {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.width*0.7,
              floating: false,
              pinned: false,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  Icon(Icons.near_me, color: Colors.white, size: 18,),
                  SizedBox(width: 10),
                  Text("Norway", style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
              actionsPadding: EdgeInsets.only(right: 20),
              actions: [
                IconButton(
                  onPressed: () {

                  },
                  icon: Icon(Icons.account_circle_outlined, color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: EdgeInsets.all(15.0),
                background: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/glass_hotel.jpg'),
                            fit: BoxFit.cover
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                      Positioned(
                        bottom: 140,
                        left: 20,
                        child: Text(
                          "Hey, Martin! Tell us where you\nwant to go",
                          style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 25,
                        left: 20,
                        right: 20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(Icons.search, color: Colors.white),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Search places",
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "Date range • Number of guests",
                                        style: TextStyle(color: Colors.white70, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 25),

              // Section Title
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text("The most relevant",
                      style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold,
                        fontFamily: "Poppins"
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Listing Card
                  Consumer(
                    builder: (context, ref, _){
                      final stayAsync = ref.watch(stayListProvider);
                      return stayAsync.when(
                        data: (stayListData){


                          return SizedBox(
                            height: 350,
                            child: ListView.separated(
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              scrollDirection: Axis.horizontal,
                              itemCount: stayListData.length,
                              itemBuilder: (context, index){
                                final stay = stayListData[index];
                                return Container(
                                  width: MediaQuery.of(context).size.width*0.8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                image: DecorationImage(
                                                  image: NetworkImage(stay.image),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 10,
                                              right: 10,
                                              child: InkWell(
                                                onTap: (){
                                                  if(stay.isFavorite != true){
                                                    StayService().favouriteStay(stay.id);
                                                  } else {
                                                    StayService().unFavouriteStay(stay.id);
                                                  }
                                                },
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.grey.withOpacity(0.5),
                                                  child: Icon(
                                                    stay.isFavorite ? Icons.favorite : Icons.favorite_border, size: 25,
                                                    color: stay.isFavorite? Colors.red : Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    stay.title, style: TextStyle(fontWeight: FontWeight.w600),
                                                    maxLines: 1, overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(Icons.star_rounded, size: 25, color: Colors.black),
                                                    SizedBox(width: 4),
                                                    Text("${stay.rating} (${stay.reviewsCount})", style: TextStyle(fontWeight: FontWeight.w600)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Text("${stay.guests} guests • ${stay.bedrooms} bedrooms • ${stay.beds} beds • ${stay.bathrooms} bathroom",
                                              style: TextStyle(color: Colors.grey,
                                                  fontSize: 12
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                Text("€${stay.originalPrice.toStringAsFixed(0)}",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    decoration: TextDecoration.lineThrough,
                                                  ),
                                                ),
                                                Text(" €${stay.discountedPrice.toStringAsFixed(0)} night • ", style: TextStyle(fontWeight: FontWeight.w500)),
                                                Expanded(
                                                  child: Text("€${stay.totalPrice.toStringAsFixed(0)} total",
                                                    style: TextStyle(color: Colors.grey),
                                                    maxLines: 1, overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(width: 10);
                              },
                            ),
                          );
                        },
                        // error: (err, _) => Center(child: Text(err.toString()),),
                        error: (err, _) => Center(child: Text("Error loading data"),),
                        loading: ()=> Center(child: CircularProgressIndicator(),),
                      );
                    },
                  ),
                ],
              ),


              const SizedBox(height: 25),

              // Discover Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text("Discover new places",
                      style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins"
                      ),
                    ),
                  ),
                  SizedBox(height: 15),

                  // Horizontal Scroll
                  SizedBox(
                    height: 120,
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      scrollDirection: Axis.horizontal,
                      children: [
                        discoverCard(context, "images/place1.jpg"),
                        discoverCard(context, "images/place2.jpg"),
                        discoverCard(context, "images/place3.jpg"),
                      ],
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),
      ),

      //Bottom navigation bar
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NavIcon(icon: FontAwesomeIcons.compass,
                      label: "Discover",
                      index: 0,
                      selectedIndex: _selectedIndex,
                      onTap: _onItemTapped,
                    ),
                    NavIcon(
                      icon: Icons.favorite_border,
                      label: "Favorites",
                      index: 1,
                      selectedIndex: _selectedIndex,
                      onTap: _onItemTapped,
                    ),
                    NavIcon(
                      icon: FontAwesomeIcons.calendarDay,
                      label: "Bookings",
                      index: 2,
                      selectedIndex: _selectedIndex,
                      onTap: _onItemTapped,
                    ),
                    NavIcon(
                      icon: FontAwesomeIcons.comments,
                      label: "Messages",
                      index: 3,
                      selectedIndex: _selectedIndex,
                      onTap: _onItemTapped,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  Widget discoverCard(context, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: MediaQuery.of(context).size.width*0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class NavIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const NavIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedIndex == index;
    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.grey),
            SizedBox(height: 4),
            Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.grey, fontSize: 12),
              maxLines: 1, overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
