import 'package:flutter/material.dart';
import 'package:tour_agency_app/Data/data.dart';
import 'package:tour_agency_app/Screens/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Container(
                    height: height * 0.35,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/topImage.jpg"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 05),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: ProductTopText(
                            leftTitle: "Popular",
                            rightTitle: "See All",
                          ),
                        ),
                        Container(
                          height: height * 0.25,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: popularList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              ProductModel data = popularList[index];
                              return PopularPart(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                        imageUrl: data.image,
                                      ),
                                    ),
                                  );
                                },
                                popularImg: data.image,
                                price: data.price,
                                title: data.name,
                              );
                            },
                          ),
                        ),
                        const ProductTopText(
                          leftTitle: "Categories",
                          rightTitle: "",
                        ),
                        Container(
                          height: height * 0.28 / 3,
                          child: ListView.builder(
                              itemCount: singleProductImgList.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                CategoryModel data =
                                    singleProductImgList[index];
                                return Column(
                                  children: [
                                    Categories(
                                      popularImg: data.image,
                                      title: data.name,
                                    ),
                                  ],
                                );
                              }),
                        ),
                        const ProductTopText(
                          leftTitle: "Recommend",
                          rightTitle: "See All",
                        ),
                        Container(
                          height: height * 0.28 / 3,
                          child: ListView.builder(
                              itemCount: recommend.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                CategoryModel data = recommend[index];
                                return Column(
                                  children: [
                                    Categories(
                                      popularImg: data.image,
                                      title: data.name,
                                    ),
                                  ],
                                );
                              }),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}

class Categories extends StatelessWidget {
  final String popularImg;
  final String title;

  const Categories({
    Key? key,
    required this.popularImg,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.28 / 3,
      width: size.width * 0.5,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(popularImg),
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.kWhite,
        ),
      ),
    );
  }
}

class PopularPart extends StatefulWidget {
  final String popularImg;
  final String title;
  final int price;
  final Function()? onTap;
  const PopularPart({
    Key? key,
    required this.popularImg,
    required this.onTap,
    required this.price,
    required this.title,
  }) : super(key: key);

  @override
  State<PopularPart> createState() => _PopularPartState();
}

class _PopularPartState extends State<PopularPart> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: size.height * 0.25,
        width: size.width * 0.7,
        alignment: Alignment.bottomCenter,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(widget.popularImg),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                AppColors.kBlack.withOpacity(.4),
                AppColors.kBlack.withOpacity(.4),
              ],
            ),
          ),
          child: ListTile(
            title: Text(
              "\$${widget.price}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.kWhite,
              ),
            ),
            subtitle: Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.kWhite,
              ),
            ),
            trailing: const Icon(
              Icons.forward_outlined,
              color: AppColors.kWhite,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}

class ProductTopText extends StatelessWidget {
  final String leftTitle;
  final String rightTitle;
  const ProductTopText({
    Key? key,
    required this.leftTitle,
    required this.rightTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        leftTitle,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.kBlack,
        ),
      ),
      trailing: Text(
        rightTitle,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.kBrownColor,
        ),
      ),
    );
  }
}
