import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String titleValue = "";
  String descrValue = "";
  double priceValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: ListView(
        children: <Widget>[
          TextField(
            onChanged: (String value) {
              setState(() {
                titleValue = value;
              });
            },
            decoration: InputDecoration(labelText: "Product Name"),
          ),
          TextField(
            maxLines: 4,
            onChanged: (String value) {
              setState(() {
                descrValue = value;
              });
            },
            decoration: InputDecoration(labelText: "Product Desciption"),
          ),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              setState(() {
                priceValue = double.parse(value);
              });
            },
            decoration: InputDecoration(labelText: "Product Price"),
          )
        ],
      ),
    );
  }
}
