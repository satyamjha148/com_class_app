import 'package:com_class/base_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:com_class/widgets/text_fields.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.02,
          ),
          child: Column(
            children: [
              primaryTextFields(
                '',
                TextEditingController(),
                [],
                (value) {
                  // Handle search validation if needed
                  return null;
                },
                TextInputType.text,
                'Search for tutors...',
                prefix: const Icon(Icons.search),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < 10; i++)
                        Column(
                          children: [
                            PhysicalModel(
                              color: Colors.blueGrey,
                              elevation: 10,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1,
                                padding: const EdgeInsets.only(right: 10),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.16,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.16,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                            'https://images.pexels.com/photos/943084/pexels-photo-943084.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Name : JOHN DOE",
                                          style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "Experty : JAVA",
                                          style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            for (int i = 0; i < 5; i++)
                                              const Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              )
                                          ],
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    const ImageIcon(
                                      AssetImage(BaseAssets.freind),
                                      color: Color(0xFF131c33),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
