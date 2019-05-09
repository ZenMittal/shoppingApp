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
  final Map<String, dynamic> _formData = {
    "title": null,
    "description": null,
    "price": null,
    "imageURL": "lib/assets/img/cover.jpg"
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleInput() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Product Name"),
      validator: (value) {
        if (value.trim().isEmpty || value.trim().length < 5) {
          return ("Title is required and should be at least 5 characters");
        }
      },
      onSaved: (String value) {
        _formData["title"] = value;
      },
    );
  }

  Widget _buildDescrInput() {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(labelText: "Product Desciption"),
      validator: (value) {
        if (value.trim().isEmpty || value.trim().length < 10) {
          return ("Description is required and should be at least 10 characters");
        }
      },
      onSaved: (String value) {
        _formData["description"] = value;
      },
    );
  }

  Widget _buildPriceInput() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Product Price"),
      validator: (value) {
        if (value.trim().isEmpty || !RegExp(r"^[0-9/.]*$").hasMatch(value)) {
          return ("Price is required and should be a number");
        }
      },
      onSaved: (String value) {
        _formData["price"] = double.parse(value);
      },
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    widget.addProd(_formData);
    Navigator.pushReplacementNamed(context, "/products");
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final targetWidth = deviceWidth >= 550 ? 450 : deviceWidth * 0.90;
    final paddingWidth = deviceWidth - targetWidth;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: paddingWidth / 2),
            children: <Widget>[
              _buildTitleInput(),
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
      ),
    );
  }
}
