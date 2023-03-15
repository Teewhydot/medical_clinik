import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/pages/doctor_details.dart';
import 'package:medical_clinik/clinik_app/presentation/pages/home_page.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/custom_textfield.dart';
import 'package:medical_clinik/generated/assets.dart';

class ListOfDoctorsPage extends StatelessWidget {
  const ListOfDoctorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      backgroundColor: kScaffoldColor,
      appBar: AppBar(
        backgroundColor: kScaffoldColor,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: kDarkGrey,
        ),
        actions: const [
          Icon(
            Icons.notification_important,
            color: kDarkGreyShade600,
          )
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              addVerticalSpacing(20),
              const LeftAlignedText(text: 'Doctors'),
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
              const LeftAlignedText(text: 'All'),
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
        ),
      ),
    );
  }
}
