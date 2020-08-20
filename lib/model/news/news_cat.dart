import 'package:flutter/material.dart';

List tabList = [
  "Explore",
  "Entertainment",
  "Sport",
  "Technology",
  "Politics",
];

List<Widget> tabWidget = [
  Tab(
    child: Text("Explore", style: TextStyle(color: Colors.white)),
  ),
  Tab(
    child: Text("Entertainment", style: TextStyle(color: Colors.white)),
  ),
  Tab(
    child: Text("Sport", style: TextStyle(color: Colors.white)),
  ),
  Tab(
    child: Text("Technology", style: TextStyle(color: Colors.white)),
  ),
  Tab(
    child: Text("Politics", style: TextStyle(color: Colors.white)),
  ),
];
