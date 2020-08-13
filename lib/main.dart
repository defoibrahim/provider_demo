import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/model/productModel.dart';

import 'controller/AuthProvider.dart';
import 'controller/ProductsProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductsProvider>(
          create: (context) => ProductsProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Test"),
      ),
      body: Center(
        child: Consumer<ProductsProvider>(
          builder: (context, prod, child) {
            return ListView.builder(
                itemCount: prod.myList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Text(prod.myList[index].name,
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold)),
                        Image.asset("${prod.myList[index].imageUrl}"),
                        RaisedButton(
                          color: Theme.of(context).accentColor,
                          child: Text("Delete"),
                          onPressed: () => Provider.of<ProductsProvider>(
                                  context,
                                  listen: false)
                              .removeProduct(index),
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(bottom: 8, left: 16, right: 16),
                  );
                });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: Provider.of<ProductsProvider>(context).addProduct,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
