import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:news_app_with_api/controller/home-screen_controller.dart';
import 'package:provider/provider.dart';

class ItemViewScreen extends StatelessWidget {
  const ItemViewScreen({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.rating,
  });

  final String title;
  final int price;
  final String description;
  final String category;
  final String imageUrl;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xff6A3DE8), size: 30),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("---------"
                      // "$sourceName | ${DateFormat('dd/MM/yyyy').format(date!).toString()}"
                    )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 40 / 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover)),
              ),
              Text(
                "$description",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Text("---------"
                  // "$contant",
                  // style: const TextStyle(
                  //     fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                // onTap: () {
                //   Provider.of<HomeScreenController>(context, listen: false)
                //       .launchURL(url);
                // },
                child: const Text(
                  "Click here to Read more",
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
