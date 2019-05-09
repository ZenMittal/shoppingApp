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
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEmailInput() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Product Name"),
      onSaved: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescrInput() {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(labelText: "Product Desciption"),
      onSaved: (String value) {
        setState(() {
          _descrValue = value;
        });
      },
    );
  }

  Widget _buildPriceInput() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Product Price"),
      onSaved: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      },
    );
  }

  void _submitForm() {
    _formKey.currentState.save();
    widget.addProd({
      "title": _titleValue,
      "description": _descrValue,
      "price": _priceValue,
      "imageURL": "lib/assets/img/cover.jpg"
    });
    Navigator.pushReplacementNamed(context, "/products");
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final targetWidth = deviceWidth >= 550 ? 450 : deviceWidth * 0.90;
    final paddingWidth = deviceWidth - targetWidth;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: paddingWidth / 2),
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            _buildEmailInput(),
            _buildDescrInput(),
            _buildPriceInput(),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text("Save Product"),
              onPressed: _submitForm,
            ),
          ],
        ),
      ),
    );
  }
}
