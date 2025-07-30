import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum SeatStatus { available, selected, reserved }

class ChooseSeatsPage extends StatefulWidget {
  const ChooseSeatsPage({super.key});

  @override
  State<ChooseSeatsPage> createState() => _ChooseSeatsPageState();
}

class _ChooseSeatsPageState extends State<ChooseSeatsPage> {
  final int rows = 8;
  final int cols = 4;
  final Color selectedColor = Color(0xFFB29BFF);
  final Color reservedColor = Colors.black;
  final Color availableColor = Color(0xFFE5E1DA);

  late List<List<SeatStatus>> leftSeats;
  late List<List<SeatStatus>> rightSeats;

  @override
  void initState() {
    super.initState();
    leftSeats = List.generate(rows, (r) => List.generate(cols, (c) => SeatStatus.available));
    rightSeats = List.generate(rows, (r) => List.generate(cols, (c) => SeatStatus.available));

    leftSeats[1][1] = SeatStatus.selected;
    leftSeats[6][1] = SeatStatus.reserved;
    rightSeats[1][1] = SeatStatus.reserved;
    rightSeats[1][3] = SeatStatus.reserved;
    rightSeats[4][1] = SeatStatus.selected;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor;
    final seatSize = screenWidth * 0.09;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F2E9),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  // Header
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage('images/sandra.jpg'),
                            ),
                            const SizedBox(width: 10),
                            Text("Samantha", style: TextStyle(fontSize: 16 * textScale, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        const Icon(FontAwesomeIcons.magnifyingGlass),
                      ],
                    ),
                  ),

                  // Title
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: 10),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back, size: 30),
                        ),
                        Text("Choose Seats", style: TextStyle(fontSize: 28 * textScale, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),

                  // Seat Grid
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Block
                        Expanded(
                          child: Column(
                            children: List.generate(rows, (row) {
                              return Row(
                                children: List.generate(cols, (col) {
                                  final isMissing = (row == 0 && col == 0) || (row == 7 && col == 0);
                                  return Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: isMissing
                                        ? SizedBox(width: seatSize, height: seatSize)
                                        : GestureDetector(
                                      onTap: () {
                                        if (leftSeats[row][col] != SeatStatus.reserved) {
                                          setState(() {
                                            leftSeats[row][col] = leftSeats[row][col] == SeatStatus.selected
                                                ? SeatStatus.available
                                                : SeatStatus.selected;
                                          });
                                        }
                                      },
                                      child: seatCircle(leftSeats[row][col], seatSize),
                                    ),
                                  );
                                }),
                              );
                            }),
                          ),
                        ),

                        SizedBox(width: screenWidth * 0.05),

                        // Right Block
                        Expanded(
                          child: Column(
                            children: List.generate(rows, (row) {
                              return Row(
                                children: List.generate(cols, (col) {
                                  final isMissing = (row == 0 && col == 3) || (row == 7 && col == 3);
                                  return Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: isMissing
                                        ? SizedBox(width: seatSize, height: seatSize)
                                        : GestureDetector(
                                      onTap: () {
                                        if (rightSeats[row][col] != SeatStatus.reserved) {
                                          setState(() {
                                            rightSeats[row][col] = rightSeats[row][col] == SeatStatus.selected
                                                ? SeatStatus.available
                                                : SeatStatus.selected;
                                          });
                                        }
                                      },
                                      child: seatCircle(rightSeats[row][col], seatSize),
                                    ),
                                  );
                                }),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Seat Legend
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        legendDot(selectedColor, "Selected"),
                        legendDot(reservedColor, "Reserved"),
                        legendDot(availableColor, "Available"),
                      ],
                    ),
                  ),

                  // Bottom Card
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.white),
                              SizedBox(width: 8),
                              Text("Cinema Max", style: TextStyle(color: Colors.white, fontSize: 20)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              seatInfo("08.04", "Date"),
                              seatInfo("21:55", "Hour", highlight: true),
                              seatInfo("2,3", "Seats"),
                              seatInfo("2,5", "Row"),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Price", style: TextStyle(color: Colors.grey)),
                                  Text("\$35,50", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  const snackBar = SnackBar(content: Text('Yay! Ticket Purchased!'));
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFB29BFF),
                                  shape: const StadiumBorder(),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.15,
                                    vertical: screenHeight * 0.015,
                                  ),
                                ),
                                child: const Text("Buy", style: TextStyle(color: Colors.black)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget seatCircle(SeatStatus status, double size) {
    Color color;
    switch (status) {
      case SeatStatus.selected:
        color = selectedColor;
        break;
      case SeatStatus.reserved:
        color = reservedColor;
        break;
      default:
        color = availableColor;
    }
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  Widget legendDot(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(label),
      ],
    );
  }

  static Widget seatInfo(String title, String subtitle, {bool highlight = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: highlight ? Colors.grey[800] : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}
