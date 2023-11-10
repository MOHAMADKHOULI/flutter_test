import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class geo_lat extends StatelessWidget {
  const geo_lat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: get_data(),
        builder: (context, snapchot) {
          if (snapchot.hasData) {
            dynamic dat = snapchot.data;
            List data =
                List.generate(dat.length, (index) => dat[index]['username']);
            List data2 = List.generate(
                dat.length, (index) => dat[index]['address']!['geo']!['lng']);
            return ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      title: Text(data[index]),
                      subtitle: Text(data2[index]),
                    ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: data.length);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
