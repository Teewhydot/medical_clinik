/// Country Drop Down Widget that shows country name only
/// Uncomment code for a more simpler version

// // ignore_for_file: library_private_types_in_public_api
//
// import 'package:flutter/material.dart';
//
// class CountryDropdown extends StatefulWidget {
//   const CountryDropdown({super.key});
//
//   @override
//   _CountryDropdownState createState() => _CountryDropdownState();
// }
//
// class _CountryDropdownState extends State<CountryDropdown> {
//   String _selectedCountry = 'Select country';
//   final List<String> _countryList = const [
//     'Afghanistan',
//     'Albania',
//     'Algeria',
//     'Andorra',
//     'Angola',
//     'Antigua and Barbuda',
//     'Argentina',
//     'Armenia',
//     'Australia',
//     'Austria',
//     'Azerbaijan',
//     'Bahamas',
//     'Bahrain',
//     'Bangladesh',
//     'Barbados',
//     'Belarus',
//     'Belgium',
//     'Belize',
//     'Benin',
//     'Bhutan',
//     'Bolivia',
//     'Bosnia and Herzegovina',
//     'Botswana',
//     'Brazil',
//     'Brunei',
//     'Bulgaria',
//     'Burkina Faso',
//     'Burundi',
//     'Cambodia',
//     'Cameroon',
//     'Canada',
//     'Central African Republic',
//     'Chad',
//     'Chile',
//     'China',
//     'Colombia',
//     'Comoros',
//     'Congo, Democratic Republic of the',
//     'Congo, Republic of the',
//     'Costa Rica',
//     'Cote d\'Ivoire',
//     'Croatia',
//     'Cuba',
//     'Cyprus',
//     'Czech Republic',
//     'Denmark',
//     'Djibouti',
//     'Dominica',
//     'Dominican Republic',
//     'Ecuador',
//     'Egypt',
//     'El Salvador',
//     'Equatorial Guinea',
//     'Eritrea',
//     'Estonia',
//     'Eswatini (formerly Swaziland)',
//     'Ethiopia',
//     'Fiji',
//     'Finland',
//     'France',
//     'Gabon',
//     'Gambia',
//     'Georgia',
//     'Germany',
//     'Ghana',
//     'Greece',
//     'Grenada',
//     'Guatemala',
//     'Guinea',
//     'Guinea-Bissau',
//     'Guyana',
//     'Haiti',
//     'Honduras',
//     'Hungary',
//     'Iceland',
//     'India',
//     'Indonesia',
//     'Iran',
//     'Iraq',
//     'Ireland',
//     'Israel',
//     'Italy',
//     'Jamaica',
//     'Japan',
//     'Jordan',
//     'Kazakhstan',
//     'Kenya',
//     'Kiribati',
//     'Kosovo',
//     'Kuwait',
//     'Kyrgyzstan',
//     'Laos',
//     'Latvia',
//     'Lebanon',
//     'Lesotho',
//     'Liberia',
//     'Libya',
//     'Liechtenstein',
//     'Lithuania',
//     'Luxembourg',
//     'Madagascar',
//     'Malawi',
//     'Malaysia',
//     'Maldives',
//     'Mali',
//     'Malta',
//     'Marshall Islands',
//     'Mauritania',
//     'Mauritius',
//     'Mexico',
//     'Micronesia',
//     'Moldova',
//     'Monaco',
//     'Mongolia',
//     'Montenegro',
//     'Morocco',
//     'Mozambique',
//     'Myanmar (formerly Burma)',
//     'Namibia',
//     'Nauru',
//     'Nepal',
//     'Netherlands',
//     'New Zealand',
//     'Nicaragua',
//     'Niger',
//     'Nigeria',
//     'North Korea',
//     'North Macedonia (formerly Macedonia)',
//     'Norway',
//     'Oman',
//     'Pakistan',
//     'Palau',
//     'Palestine',
//     'Panama',
//     'Papua New Guinea',
//     'Paraguay',
//     'Peru',
//     'Philippines',
//     'Poland',
//     'Portugal',
//     'Qatar',
//     'Romania',
//     'Russia',
//     'Rwanda',
//     'Saint Lucia',
//     'Saint Vincent and the Grenadines',
//     'Samoa',
//     'San Marino',
//     'Sao Tome and Principe',
//     'Saudi Arabia',
//     'Senegal',
//     'Serbia',
//     'Seychelles',
//     'Sierra Leone',
//     'Singapore',
//     'Slovakia',
//     'Slovenia',
//     'Solomon Islands',
//     'Somalia',
//     'South Africa',
//     'South Korea',
//     'South Sudan',
//     'Spain',
//     'Sri Lanka',
//     'Sudan',
//     'Suriname',
//     'Sweden',
//     'Switzerland',
//     'Syria',
//     'Taiwan',
//     'Tajikistan',
//     'Tanzania',
//     'Thailand',
//     'Timor-Leste (formerly East Timor)',
//     'Togo',
//     'Tonga',
//     'Trinidad and Tobago',
//     'Tunisia',
//     'Turkey',
//     'Turkmenistan',
//     'Tuvalu',
//     'Uganda',
//     'Ukraine',
//     'United Arab Emirates',
//     'United Kingdom',
//     'United States of America',
//     'Uruguay',
//     'Uzbekistan',
//     'Vanuatu',
//     'Vatican City (Holy See)',
//     'Venezuela',
//     'Vietnam',
//     'Yemen',
//     'Zambia',
//     'Zimbabwe'
//   ];
//
//   void _selectCountry(String country) {
//     setState(() {
//       _selectedCountry = country;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 44,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.grey[200],
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 16),
//                 child: Text(
//                   _selectedCountry,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey[700],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 16),
//               child: InkWell(
//                 onTap: () {
//                   showModalBottomSheet(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return Container(
//                         height: MediaQuery.of(context).size.height * 0.5,
//                         child: ListView.builder(
//                           itemCount: _countryList.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return InkWell(
//                               onTap: () {
//                                 _selectCountry(_countryList[index]);
//                                 Navigator.pop(context);
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.all(16),
//                                 child: Text(
//                                   _countryList[index],
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   );
//                 },
//                 child: Icon(
//                   Icons.arrow_drop_down,
//                   color: Colors.grey[700],
//                   size: 32,
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }
/// More complex example with a custom flag widget
///
import 'package:flag/flag.dart';
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';

class CountryPickerWidget extends StatefulWidget {
  const CountryPickerWidget({super.key});

  @override
  _CountryPickerWidgetState createState() => _CountryPickerWidgetState();
}

class _CountryPickerWidgetState extends State<CountryPickerWidget> {
  Map<String, String>? _selectedCountry = {
    'name': 'Select country',
    'code': '',
  };

  final List<Map<String, String>> _countryList = [
    {'name': 'Nigeria', 'code': 'NG'},
    {'name': 'Afghanistan', 'code': 'AF'},
    {'name': 'Albania', 'code': 'AL'},
    {'name': 'Algeria', 'code': 'DZ'},
    {'name': 'American Samoa', 'code': 'AS'},
    {'name': 'Andorra', 'code': 'AD'},
    {'name': 'Angola', 'code': 'AO'},
    {'name': 'Anguilla', 'code': 'AI'},
    {'name': 'Antarctica', 'code': 'AQ'},
    {'name': 'Antigua and Barbuda', 'code': 'AG'},
    {'name': 'Argentina', 'code': 'AR'},
    {'name': 'Armenia', 'code': 'AM'},
    {'name': 'Aruba', 'code': 'AW'},
    {'name': 'Australia', 'code': 'AU'},
    {'name': 'Austria', 'code': 'AT'},
    {'name': 'Azerbaijan', 'code': 'AZ'},
    {'name': 'Bahamas', 'code': 'BS'},
    {'name': 'Bahrain', 'code': 'BH'},
    {'name': 'Bangladesh', 'code': 'BD'},
    {'name': 'Barbados', 'code': 'BB'},
    {'name': 'Belarus', 'code': 'BY'},
    {'name': 'Belgium', 'code': 'BE'},
    {'name': 'Belize', 'code': 'BZ'},
    {'name': 'Benin', 'code': 'BJ'},
    {'name': 'Bermuda', 'code': 'BM'},
    {'name': 'Bhutan', 'code': 'BT'},
    {'name': 'Bolivia', 'code': 'BO'},
    {'name': 'Bosnia and Herzegovina', 'code': 'BA'},
    {'name': 'Botswana', 'code': 'BW'},
    {'name': 'Bouvet Island', 'code': 'BV'},
    {'name': 'Brazil', 'code': 'BR'},
    {'name': 'British Indian Ocean Territory', 'code': 'IO'},
    {'name': 'Brunei Darussalam', 'code': 'BN'},
    {'name': 'Bulgaria', 'code': 'BG'},
    {'name': 'Burkina Faso', 'code': 'BF'},
    {'name': 'Burundi', 'code': 'BI'},
    {'name': 'Cambodia', 'code': 'KH'},
    {'name': 'Cameroon', 'code': 'CM'},
    {'name': 'Canada', 'code': 'CA'},
    {'name': 'Cape Verde', 'code': 'CV'},
    {'name': 'Cayman Islands', 'code': 'KY'},
    {'name': 'Central African Republic', 'code': 'CF'},
    {'name': 'Chad', 'code': 'TD'},
    {'name': 'Chile', 'code': 'CL'},
    {'name': 'China', 'code': 'CN'},
    {'name': 'Christmas Island', 'code': 'CX'},
    {'name': 'Cocos (Keeling) Islands', 'code': 'CC'},
    {'name': 'Colombia', 'code': 'CO'},
    {'name': 'Comoros', 'code': 'KM'},
    {'name': 'Congo', 'code': 'CG'},
    {'name': 'Congo, The Democratic Republic of the', 'code': 'CD'},
    {'name': 'Cook Islands', 'code': 'CK'},
    {'name': 'Costa Rica', 'code': 'CR'},
    {'name': 'Cote D\'Ivoire', 'code': 'CI'},
    {'name': 'Croatia', 'code': 'HR'},
    {'name': 'Cuba', 'code': 'CU'},
    {'name': 'Cyprus', 'code': 'CY'},
    {'name': 'Czech Republic', 'code': 'CZ'},
    {'name': 'Denmark', 'code': 'DK'},
    {'name': 'Djibouti', 'code': 'DJ'},
    {'name': 'Dominica', 'code': 'DM'},
    {'name': 'Dominican Republic', 'code': 'DO'},
    {'name': 'Ecuador', 'code': 'EC'},
    {'name': 'Egypt', 'code': 'EG'},
    {'name': 'El Salvador', 'code': 'SV'},
    {'name': 'Equatorial Guinea', 'code': 'GQ'},
    {'name': 'Eritrea', 'code': 'ER'},
    {'name': 'Estonia', 'code': 'EE'},
    {'name': 'Ethiopia', 'code': 'ET'},
    {'name': 'Falkland Islands (Malvinas)', 'code': 'FK'},
    {'name': 'Faroe Islands', 'code': 'FO'},
    {'name': 'Fiji', 'code': 'FJ'},
    {'name': 'Finland', 'code': 'FI'},
    {'name': 'France', 'code': 'FR'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  _selectedCountry!['code']!.isNotEmpty
                      ? Flag.fromString(
                          _selectedCountry!['code']!,
                          height: 16,
                          width: 24,
                        )
                      : Container(),
                  addHorizontalSpacing(8),
                  Text(
                    _selectedCountry!['name']!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  builder: (context) {
                    return Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: ListView.builder(
                        itemCount: _countryList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: _countryList[index]['code']!.isNotEmpty
                                ? Flag.fromString(
                                    _countryList[index]['code']!,
                                    height: 20,
                                    width: 30,
                                  )
                                : Container(),
                            title: Text(_countryList[index]['name']!),
                            onTap: () {
                              setState(() {
                                _selectedCountry = _countryList[index];
                              });
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
              child: Icon(
                Icons.arrow_drop_down,
                color: Colors.grey[600],
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
