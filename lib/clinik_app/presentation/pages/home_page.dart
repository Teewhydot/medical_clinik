import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/custom_textfield.dart';
import 'package:medical_clinik/generated/assets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> tags = [
    'heart',
    'lungs',
    'stomach',
    'eyes',
    'brain',
    'skin',
    'mouth',
    'teeth',
    'lungs',
  ];
  final List<Map<String, dynamic>> doctors = [
    {
      'name': 'Dr Hannah',
      'profession': 'Dentist',
      'rating': '4.8',
      'image': Assets.imagesImageDrFloydMiles,
      'reviews': '220'
    },
    {
      'name': 'Dr Anvil',
      'profession': 'Dentist',
      'rating': '3.8',
      'image': Assets.imagesImageDrAnnetteBlack,
      'reviews': '230'
    },
    {
      'name': 'Dr Mathew',
      'profession': 'Surgeon',
      'rating': '4.8',
      'image': Assets.imagesImageDrEleanorPena,
      'reviews': '120'
    },
    {
      'name': 'Dr Kruger',
      'profession': 'Cardiologist',
      'rating': '4.8',
      'image': Assets.imagesImageDrGuyHawkins,
      'reviews': '320'
    },
    {
      'name': 'Dr Reiner',
      'profession': 'Cancer Expert',
      'rating': '4.8',
      'image': Assets.imagesImageDrJacobJones,
      'reviews': '310'
    },
    {
      'name': 'Dr Annie',
      'profession': 'Nurse',
      'rating': '4.9',
      'image': Assets.imagesImageDrJaneCooper,
      'reviews': '20'
    },
    {
      'name': 'Dr Eren',
      'profession': 'Mass Murderer',
      'rating': '5.0',
      'image': Assets.imagesImageDrMarvinMckinney,
      'reviews': '2250'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome back, Mark!',
                    style: kHeaderTextStyleBlack,
                  ),
                  const Icon(
                    Icons.notification_important,
                    color: kDarkGreyShade600,
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined,
                      color: kDarkGreyShade600),
                  Text(
                    'Warsaw, Poland',
                    style: kSubHeaderTextStyleGrey,
                  )
                ],
              ),
              addVerticalSpacing(30),
              Row(
                children: [
                  const Expanded(
                    flex: 6,
                    child: HomeTextField(
                      keyboardType: TextInputType.visiblePassword,
                      hintText: 'Example: heart, lungs, stomach, eyes, brain',
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(Assets.iconsFilter),
                  ))
                ],
              ),
              HorizontalListOfTags(tags: tags),
              addVerticalSpacing(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Recent',
                    style: kHeaderTextStyleBlack,
                  ),
                  Text(
                    'See all',
                    style: kHeaderTextStyleBlack.copyWith(fontSize: 15),
                  ),
                ],
              ),
              addVerticalSpacing(20),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kAccentPrimaryBlue,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                Assets.imagesImageDrAnnetteBlack,
                                width: 36,
                                height: 36,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Dr. Eleanor Pena',
                                      style: kHeaderTextStyleWhite.copyWith(
                                          fontSize: 18),
                                    ),
                                    Text(
                                      'Pediatrician',
                                      style: kHeaderTextStyleWhite.copyWith(
                                          fontSize: 14),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              addHorizontalSpacing(20),
                              Text(
                                "(220 reviews)",
                                style: kHeaderTextStyleWhite.copyWith(
                                    fontSize: 14),
                              ),
                              const Icon(
                                Icons.star,
                                color: kAccentPrimaryPurple,
                              ),
                              Text(
                                '4.8',
                                style: kHeaderTextStyleWhite.copyWith(
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                Assets.imagesIconCalendar,
                                width: 14,
                                height: 14,
                              ),
                              addHorizontalSpacing(5),
                              Text(
                                '23 Mar',
                                style: kHeaderTextStyleWhite.copyWith(
                                    fontSize: 14),
                              ),
                              addHorizontalSpacing(30),
                              Image.asset(
                                Assets.imagesIconTime,
                                width: 14,
                                height: 14,
                              ),
                              addHorizontalSpacing(5),
                              Text(
                                '16:00',
                                style: kHeaderTextStyleWhite.copyWith(
                                    fontSize: 14),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '\$80',
                                style: kHeaderTextStyleWhite.copyWith(
                                    fontSize: 14),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              addVerticalSpacing(10),
              Image.asset(Assets.iconsBloodTest),
              addVerticalSpacing(30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Categories',
                    style: kHeaderTextStyleBlack.copyWith(fontSize: 20)),
              ),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(Assets.iconsCardiologist),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(Assets.iconsOpthamilogist),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(Assets.iconsDentist),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(Assets.iconsCardiologist),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(Assets.iconsOpthamilogist),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(Assets.iconsDentist),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(Assets.iconsCardiologist),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(Assets.iconsOpthamilogist),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(Assets.iconsDentist),
                    ),
                  ],
                ),
              ),
              addVerticalSpacing(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Popular Doctors',
                    style: kHeaderTextStyleBlack,
                  ),
                  Text(
                    'See all',
                    style: kHeaderTextStyleBlack.copyWith(fontSize: 15),
                  ),
                ],
              ),
              ListView.builder(
                  itemCount: doctors.length,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 74,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        doctors[index]['image'],
                                        width: 36,
                                        height: 36,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              doctors[index]['name'],
                                            ),
                                            Text(
                                              doctors[index]['profession'],
                                              style: kSubHeaderTextStyleGrey,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      addHorizontalSpacing(20),
                                      Text(
                                        "(${doctors[index]['rating']} reviews)",
                                      ),
                                      const Icon(
                                        Icons.star,
                                        color: kAccentPrimaryPurple,
                                      ),
                                      Text(
                                        doctors[index]['rating'],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        )),
      ),
      backgroundColor: kScaffoldColor,
    );
  }
}

class HorizontalListOfTags extends StatelessWidget {
  const HorizontalListOfTags({
    super.key,
    required this.tags,
  });

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tags.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                    color: kDarkGreyShade600,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '#${tags[index]}',
                    style: kSubHeaderTextStyleGrey,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
