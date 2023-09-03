// ignore_for_file: prefer_const_constructors, unnecessary_cast

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:easyappointment_mobile/models/salon.dart';
import 'package:easyappointment_mobile/screens/reservations/reservation_screen.dart';
import 'package:easyappointment_mobile/widgets/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/salon_employee.dart';
import '../providers/salon_employee_provider.dart';

class PregledRadnjePage extends StatefulWidget {
  Salon salon;
  PregledRadnjePage({required this.salon, super.key});

  @override
  State<PregledRadnjePage> createState() => _PregledRadnjePageState();
}

class _PregledRadnjePageState extends State<PregledRadnjePage> {
  Uint8List? bytes;
  File? _selectedImage;
  List<SalonEmployee> employees = [];
  late SalonEmployeeProvider _salonEmployeeProvider;

  @override
  void initState() {
    super.initState();
    _salonEmployeeProvider = context.read<SalonEmployeeProvider>();
    fetchData();
    initializeData();
  }

  Future<void> fetchData() async {
    var data = await _salonEmployeeProvider.get(
      filter: {
        'SalonId': widget.salon.salonId,
        'AreUsersIncluded': true,
      },
    );
    employees = data.result;
    setState(() {
      bytes = base64Decode(widget.salon.photo!);
    });
  }

  void initializeData() {
    // Initialize data or perform any other necessary setup
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MasterScreenWidget(
        hideNavBar: true,
        title: "Pregled radnje",
        index: 0,
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  decoration: BoxDecoration(
                    image: _selectedImage != null
                        ? DecorationImage(
                            image: FileImage(_selectedImage!),
                            fit: BoxFit.cover,
                          )
                        : bytes != null && bytes!.isNotEmpty
                            ? DecorationImage(
                                image: MemoryImage(bytes!),
                                fit: BoxFit.cover,
                              )
                            : null,
                    color: Colors.red,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                        child: Row(
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  image: _selectedImage != null
                                      ? DecorationImage(
                                          image: FileImage(_selectedImage!),
                                          fit: BoxFit.cover,
                                        )
                                      : bytes != null && bytes!.isNotEmpty
                                          ? DecorationImage(
                                              image: MemoryImage(bytes!),
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(45)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                children: [
                                  Text(
                                    widget.salon.salonName ?? "",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: 160,
                                    child: ListView.builder(
                                      primary: false,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return Icon(
                                          Icons.star,
                                          size: 30,
                                          color:
                                              Color.fromARGB(255, 255, 167, 34),
                                        );
                                      },
                                    ),
                                  ),
                                  Text(widget.salon.address ?? ""),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20),
                  child: Text(
                    "Our Employees",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 200, // Specify the height for the ListView
                  child: ListView.builder(
                    itemCount: employees.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: (employees[index].user?.photo != null &&
                                      employees[index].user?.photo != "")
                                  ? DecorationImage(
                                      image: MemoryImage(
                                        getUint8List(
                                            employees[index].user?.photo),
                                      ),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: (employees[index].user?.photo == null ||
                                    employees[index].user?.photo == "")
                                ? Icon(
                                    Icons.person_3_sharp,
                                    size: 24,
                                    color: Colors.grey,
                                  )
                                : null,
                          ),
                          title: Text(
                              '${employees[index].firstName} ${employees[index].lastName}'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ReservationScreen(
                  salon: widget.salon,
                ),
              ),
            );
          },
          child: const Text('Rezerviši Termin'),
        ),
      ),
    );
  }

  getUint8List(String? photo) {
    if (photo == null) return true;
    return base64Decode(photo);
  }
}
