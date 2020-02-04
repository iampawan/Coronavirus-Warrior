import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:coronavirus_app/utils/coonst.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class MythPage extends StatelessWidget {
  static const String routeName = "myth";
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Myth-Busters"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => MythItem(
          height: height,
          index: index + 1,
          title: myths[index].title,
          subtitle: myths[index].subtitle,
        ),
        itemCount: 10,
      ),
    );
  }
}

class MythItem extends StatelessWidget {
  const MythItem({
    Key key,
    @required this.height,
    this.title,
    this.suffix = "m",
    this.index,
    this.subtitle,
  }) : super(key: key);

  final double height;
  final String title;
  final String subtitle;
  final int index;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            AutoSizeText(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            AutoSizeText(
              subtitle,
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PhotoView(
                  backgroundDecoration: BoxDecoration(color: Colors.white),
                  tightMode: true,
                  imageProvider: CachedNetworkImageProvider(
                    Coonst.fireStoreImageUrl(
                      "p$suffix$index",
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MythData {
  final String title;
  final String subtitle;

  MythData(this.title, this.subtitle);
}

var myths = <MythData>[
  MythData("Is it safe to receive a letter or a package from China?",
      "Yes, it is safe. People receiving packages from China are not at risk of contracting the new coronavirus. From previous analysis, we know coronaviruses do not survive long on objects, such as letters or packages."),
  MythData("Can pets at home spread the new coronavirus (2019-nCoV)?",
      "At present, there is no evidence that companion animals/pets such as dogs or cats can be infected with the new coronavirus. However, it is always a good idea to wash your hands with soap and water after contact with pets. This protects you against various common bacteria such as E.coli and Salmonella that can pass between pets and humans."),
  MythData(
      "Do vaccines against pneumonia protect you against the new coronavirus?",
      "No. Vaccines against pneumonia, such as pneumococcal vaccine and Haemophilus influenza type B (Hib) vaccine, do not provide protection against the new coronavirus.The virus is so new and different that it needs its own vaccine. Researchers are trying to develop a vaccine against 2019-nCoV, and WHO is supporting their efforts.Although these vaccines are not effective against 2019-nCoV, vaccination against respiratory illnesses is highly recommended to protect your health."),
  MythData(
      '''Can regularly rinsing your nose with saline help prevent infection with the new coronavirus?''',
      '''No. There is no evidence that regularly rinsing the nose with saline has protected people from infection with the new coronavirus. There is some limited evidence that regularly rinsing nose with saline can help people recover more quickly from the common cold. However, regularly rinsing the nose has not been shown to prevent respiratory infections.'''),
  MythData(
      '''Can gargling mouthwash protect you from infection with the new coronavirus?
 ''', '''No. There is no evidence that using mouthwash will protect you from infection with the new coronavirus.

Some brands or mouthwash can eliminate certain microbes for a few minutes in the saliva in your mouth. However, this does not mean they protect you from 2019-nCoV infection '''),
  MythData('''Can eating garlic help prevent infection with the new coronavirus?
 ''', '''Garlic is a healthy food that may have some antimicrobial properties. However, there is no evidence from the current outbreak that eating garlic has protected people from the new coronavirus.

 '''),
  MythData(
      '''Does putting on sesame oil block the new coronavirus from entering the body?
 ''', '''No. Sesame oil does not kill the new coronavirus. There are some chemical disinfectants that can kill the 2019-nCoV on surfaces. These include bleach/chlorine-based disinfectants, either solvents, 75% ethanol, peracetic acid and chloroform.

However, they have little or no impact on the virus if you put them on the skin or under your nose. It can even be dangerous to put these chemicals on your skin. '''),
  MythData(
      '''Does the new coronavirus affect older people, or are younger people also susceptible? ''',
      '''People of all ages can be infected by the new coronavirus (2019-nCoV). Older people, and people with pre-existing medical conditions (such as asthma, diabetes, heart disease) appear to be more vulnerable to becoming severely ill with the virus. 

WHO advises people of all ages to take steps to protect themselves from the virus, for example by following good hand hygiene and good respiratory hygiene. '''),
  MythData(
      '''Are antibiotics effective in preventing and treating the new coronavirus?
 ''', '''No, antibiotics do not work against viruses, only bacteria.

The new coronavirus (2019-nCoV) is a virus and, therefore, antibiotics should not be used as a means of prevention or treatment.

However, if you are hospitalized for the 2019-nCoV, you may receive antibiotics because bacterial co-infection is possible.

 '''),
  MythData(
      '''Are there any specific medicines to prevent or treat the new coronavirus?
 ''', '''To date, there is no specific medicine recommended to prevent or treat the new coronavirus (2019-nCoV).

However, those infected with the virus should receive appropriate care to relieve and treat symptoms, and those with severe illness should receive optimized supportive care. Some specific treatments are under investigation, and will be tested through clinical trials. WHO is helping to accelerate research and development efforts with a range or partners. '''),
];
