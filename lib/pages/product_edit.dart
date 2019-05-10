import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductEditPage extends StatefulWidget {
  ProductEditPage(
      {this.addProd,
      this.deleteProd,
      this.updateProd,
      this.product,
      this.productIndex});
  final Function addProd;
  final Function deleteProd;
  final Function updateProd;
  final Product product;
  final int productIndex;

  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  final Map<String, dynamic> _formData = {
    "title": null,
    "description": null,
    "price": null,
    "image": "lib/assets/img/cover.jpg"
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleInput() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Product Name"),
      initialValue: widget.product == null ? "" : widget.product.title,
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
      initialValue: widget.product == null ? "" : widget.product.description,
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
      initialValue:
          widget.product == null ? "" : widget.product.price.toString(),
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

    if (widget.product == null) {
      widget.addProd(
        Product(
          title: _formData["title"],
          description: _formData["description"],
          price: _formData["price"],
          image: _formData["image"],
        ),
      );
    } else {
      widget.updateProd(
        widget.productIndex,
        Product(
          title: _formData["title"],
          description: _formData["description"],
          price: _formData["price"],
          image: _formData["image"],
        ),
      );
    }
    Navigator.pushReplacementNamed(context, "/products");
  }

  Widget _buildpageContent() {
    final deviceWidth = MediaQuery.of(context).size.width;
    final targetWidth = deviceWidth >= 550 ? 450 : deviceWidth * 0.90;
    final targetPadding = deviceWidth - targetWidth;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
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

  @override
  Widget build(BuildContext context) {
    if (widget.product == null)
      return _buildpageContent();
    else
      return Scaffold(
        appBar: AppBar(
          title: Text("Edit Product"),
        ),
        body: _buildpageContent(),
      );
  }
}
