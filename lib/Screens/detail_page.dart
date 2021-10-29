import 'package:flutter/material.dart';
import 'package:tour_agency_app/Data/data.dart';
import 'package:tour_agency_app/Screens/home_page.dart';

class DetailPage extends StatelessWidget {
  final String imageUrl;
  const DetailPage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        bottomNavigationBar: Container(
          height: height * 0.25 / 2,
          width: double.infinity,
          decoration: BoxDecoration(color: AppColors.kWhite, boxShadow: [
            BoxShadow(
                blurRadius: 3,
                spreadRadius: 7,
                color: AppColors.kGrey.withOpacity(0.5),
                offset: const Offset(0, 2)),
          ]),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '\$50',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    '\$PER PERSON',
                    style: TextStyle(
                      color: AppColors.kBlack54,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Container(
                width: 140,
                height: height * 0.1 - 30,
                decoration:  BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomRight,
                      stops: [
                        0.0,
                        8.0
                      ],
                      colors: [
                        Colors.pinkAccent,
                        Colors.red,
                      ]),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  child:const Text('Book Now'),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    primary: Colors.transparent
                  ),
                ),
              )
            ],
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                height: height * 0.52,
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(imageUrl)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.kWhite,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.kBlack.withOpacity(0.5),
                        spreadRadius: 15,
                        blurRadius: 7,
                        offset: const Offset(0, -20)),
                  ],
                  color: AppColors.kWhite,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 10,
                        right: 10,
                        bottom: 2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Overview',
                            style: TextStyle(
                              color: AppColors.kBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            'Photo',
                            style: TextStyle(
                              color: AppColors.kBlack54,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Reviews',
                            style: TextStyle(
                              color: AppColors.kBlack54,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    const CenterListTile(
                      icon: Icons.access_alarm_sharp,
                      title: '8 Hours',
                    ),
                    const CenterListTile(
                      icon: Icons.g_translate_sharp,
                      title: 'Offered in: English ',
                    ),
                    Wrap(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'if you photography and natural beauty, this private door-to-door waterfall tour is for you.visit the three most beautiful waterfalls around ubud without the hasle of self-drive:',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.kGrey,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class CenterListTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const CenterListTile({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.kRed,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.kBlack,
        ),
      ),
    );
  }
}
