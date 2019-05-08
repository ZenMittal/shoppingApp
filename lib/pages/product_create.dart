import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  ProductCreatePage(this.addProd, this.deleteProd);
  final Function addProd;
  final Function deleteProd;

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue = "";
  String _descrValue = "";
  double _priceValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: ListView(
        children: <Widget>[
          TextField(
            onChanged: (String value) {
              setState(() {
                _titleValue = value;
              });
            },
            decoration: InputDecoration(labelText: "Product Name"),
          ),
          TextField(
            maxLines: 4,
            onChanged: (String value) {
              setState(() {
                _descrValue = value;
              });
            },
            decoration: InputDecoration(labelText: "Product Desciption"),
          ),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              setState(() {
                _priceValue = double.parse(value);
              });
            },
            decoration: InputDecoration(labelText: "Product Price"),
          ),
          SizedBox(height: 10.0,),
          RaisedButton(
            child: Text("Save Product"),
            color: Theme.of(context).accentColor,
            onPressed: () {
              widget.addProd({
                "title": _titleValue,
                "description": _descrValue,
                "price": _priceValue,
                "imageURL": "lib/assets/img/cover.jpg"
              });
              Navigator.pushReplacementNamed(context, "/products");
            },
          ),
        ],
      ),
    );
  }
}
