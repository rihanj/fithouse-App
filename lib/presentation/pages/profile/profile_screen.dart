import 'package:fithouse_app/presentation/themes/dimens.dart';
import 'package:fithouse_app/presentation/themes/f_h_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_provider/cache_service_imp.dart';
import '../../../generated/l10n.dart';
import '../../../utils/App_data.dart';
import '../../../utils/route_generator.dart';
import '../../widgets/model_sheet.dart';
import '../../widgets/shapes.dart';
import 'cubit/profile_screen_cubit.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final GlobalKey<PopupMenuButtonState<int>> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ProfileScreenCubit cubit = context.watch<ProfileScreenCubit>();
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Shapes.container(
                  borderRadius: BorderRadius.circular(20),
                  bgColor: FHColor.whiteColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Stack(
                              children: [
                                Container(
                                    width: 90,
                                    height: 80,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(60, 50)),
                                      color: FHColor.appColor,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'MK',
                                        style: TextStyle(
                                          color: FHColor.whiteColor,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                        ),
                                      ),
                                    )),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.grey.shade600,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Text(
                                    maxLines: 3,
                                    AppData.userDetails!.fullName!,
                                    style: const TextStyle(
                                      color: FHColor.blackColor,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Male 37',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: FHColor.appColor,
                      )
                    ],
                  )),
              Dimens.height(10),
              Shapes.container(
                  bgColor: FHColor.whiteColor,
                  borderRadius: BorderRadius.circular(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.card_giftcard,
                            size: 20,
                          ),
                          Dimens.width(10),
                          const Text(
                            "Rewards",
                            style: TextStyle(
                              color: FHColor.blackColor,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              letterSpacing: 1,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            S.current.ProfileRewardPoints("370"),
                            //"You have 315 points",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              letterSpacing: 1,
                            ),
                          ),
                          Dimens.width(10),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: FHColor.appColor,
                          ),
                        ],
                      ),
                    ],
                  )),
              Dimens.height(10),
              Shapes.container(
                  borderRadius: BorderRadius.circular(20),
                  bgColor: FHColor.whiteColor,
                  child: Column(
                    children: [
                      const Divider(
                        color: FHColor.appColor,
                        thickness: 4,
                      ),
                      Dimens.height(5),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '5 days remaining',
                              style: TextStyle(
                                color: FHColor.appColor,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Wednesday, Mar 29 last delivery',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              Dimens.height(10),
              Shapes.container(
                  padding: EdgeInsets.zero,
                  bgColor: FHColor.whiteColor,
                  borderRadius: BorderRadius.circular(20),
                  child: Row(children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.pause_circle_filled,
                          color: Colors.grey.shade400,
                        )),
                    const Text(
                      'Pause Subscription',
                      style: TextStyle(
                        color: FHColor.blackColor,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        letterSpacing: 1,
                      ),
                    )
                  ])),
              Dimens.height(10),
              Shapes.container(
                  borderRadius: BorderRadius.circular(20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  bgColor: FHColor.whiteColor,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.list_alt,
                                color: Colors.grey.shade400,
                              ),
                              Dimens.width(10),
                              const Text(
                                "Dietary Plan",
                                style: TextStyle(
                                  color: FHColor.blackColor,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "Balanced",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                              Dimens.width(10),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                                color: FHColor.appColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        indent: 10,
                        endIndent: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_card,
                                  color: Colors.grey.shade400,
                                ),
                                Dimens.width(10),
                                const Text(
                                  "Packages & Days ",
                                  style: TextStyle(
                                    color: FHColor.blackColor,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    letterSpacing: 1,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Dimens.width(5),
                          const Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    maxLines: 4,
                                    "Ramdan Package 5 Day’s/Week",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                                // Dimens.width(5),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: FHColor.appColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        indent: 10,
                        endIndent: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.radar,
                                color: Colors.grey.shade400,
                              ),
                              Dimens.width(10),
                              const Text(
                                "Target Calories ",
                                style: TextStyle(
                                  color: FHColor.blackColor,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "1530",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                              Dimens.width(10),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                                color: FHColor.appColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        indent: 10,
                        endIndent: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.warning_outlined,
                                color: Colors.grey.shade400,
                              ),
                              Dimens.width(10),
                              const Text(
                                "Ingredient Warnings ",
                                style: TextStyle(
                                  color: FHColor.blackColor,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "Turkey",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                              Dimens.width(10),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                                color: FHColor.appColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        indent: 10,
                        endIndent: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.favorite_border,
                                color: Colors.grey.shade400,
                              ),
                              Dimens.width(10),
                              const Text(
                                "Favorites ",
                                style: TextStyle(
                                  color: FHColor.blackColor,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              )
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: FHColor.appColor,
                          ),
                        ],
                      ),
                      Divider(
                        indent: 10,
                        endIndent: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.edit_location_alt_outlined,
                                color: Colors.grey.shade400,
                              ),
                              Dimens.width(10),
                              const Text(
                                "Automatic Tracking",
                                style: TextStyle(
                                  color: FHColor.blackColor,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "OFF",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                              Dimens.width(10),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                                color: FHColor.appColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
              Dimens.height(10),
              Shapes.container(
                  borderRadius: BorderRadius.circular(20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  bgColor: FHColor.whiteColor,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.grey.shade400,
                            ),
                            Dimens.width(10),
                            const Text(
                              "Address",
                              style: TextStyle(
                                color: FHColor.blackColor,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                letterSpacing: 1,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "Office ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                letterSpacing: 1,
                              ),
                            ),
                            Dimens.width(10),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: FHColor.appColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      indent: 10,
                      endIndent: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.delivery_dining,
                                color: Colors.grey.shade400,
                              ),
                              Dimens.width(10),
                              const Expanded(
                                child: Text(
                                  "Delivery Time",
                                  style: TextStyle(
                                    color: FHColor.blackColor,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    letterSpacing: 2,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  "7 AM to 11 AM (Morning)",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    letterSpacing: 1,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              Dimens.width(10),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                                color: FHColor.appColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Dimens.height(10),
                  ])),
              Dimens.height(10),
              Shapes.container(
                borderRadius: BorderRadius.circular(20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                bgColor: FHColor.whiteColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.language,
                          color: Colors.grey.shade400,
                        ),
                        Dimens.width(10),
                        const Text(
                          "Language",
                          style: TextStyle(
                            color: FHColor.blackColor,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            letterSpacing: 1,
                          ),
                        )
                      ],
                    ),
                    PopupMenuButton(
                      onSelected: (value) {
                        cubit.changeLanguage(value);
                      },
                      key: _key,
                      child: Row(
                        children: [
                          Text(
                            AppData.language,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              letterSpacing: 1,
                            ),
                            textAlign: TextAlign.end,
                          ),
                          Dimens.width(10),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: FHColor.appColor,
                          ),
                        ],
                      ),
                      itemBuilder: (BuildContext context) {
                        return const [
                          PopupMenuItem(
                            value: 'English',
                            child: Text("English"),
                          ),
                          PopupMenuItem(
                            value: 'Arabic',
                            child: Text("Arabic"),
                          )
                        ];
                      },
                    ),
                  ],
                ),
              ),
              Dimens.height(10),
              Shapes.container(
                borderRadius: BorderRadius.circular(20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                bgColor: FHColor.whiteColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.restaurant_menu_rounded,
                          color: Colors.grey.shade400,
                        ),
                        Dimens.width(10),
                        const Text(
                          "Cutlery",
                          style: TextStyle(
                            color: FHColor.blackColor,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            letterSpacing: 1,
                          ),
                        )
                      ],
                    ),
                    Switch(
                        activeColor: FHColor.appColor,
                        value: cubit.cutlery,
                        onChanged: (val) {
                          cubit.cutleryChange(val);
                        }),
                  ],
                ),
              ),
              Dimens.width(10),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "off by default to save the environment",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              Dimens.width(10),
              Shapes.container(
                  borderRadius: BorderRadius.circular(20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  bgColor: FHColor.whiteColor,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.wallet,
                              color: Colors.grey.shade400,
                            ),
                            Dimens.width(10),
                            const Text(
                              "Get 100 SAR",
                              style: TextStyle(
                                color: FHColor.blackColor,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                letterSpacing: 1,
                              ),
                            )
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: FHColor.appColor,
                        ),
                      ],
                    ),
                    Dimens.height(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.payments_outlined,
                              color: Colors.grey.shade400,
                            ),
                            Dimens.width(10),
                            const Text(
                              "Payment History",
                              style: TextStyle(
                                color: FHColor.blackColor,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                letterSpacing: 1,
                              ),
                            )
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: FHColor.appColor,
                        ),
                      ],
                    ),
                    const Divider(
                      indent: 10,
                      endIndent: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.payments,
                                color: Colors.grey.shade400,
                              ),
                              Dimens.width(10),
                              const Expanded(
                                child: Text(
                                  "Payment Method",
                                  style: TextStyle(
                                    color: FHColor.blackColor,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    letterSpacing: 2,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: FHColor.appColor,
                        ),
                      ],
                    ),
                  ])),
              Dimens.height(10),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Shapes.container(
                    padding: EdgeInsets.all(2),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: Colors.red.shade800),
                    onTap: () {
                      ModelSheet.showAlertDialog(
                          context: context,
                          title: "Are you sure?",
                          child: const Text(
                            "Do you want to Logout from App?",
                            style: TextStyle(
                              color: FHColor.theme2Color,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: Text("No")),
                            TextButton(
                                onPressed: () async {
                                  await CacheServiceImp().logOut;
                                  // Restart.restartApp();
                                  await CacheServiceImp().setLogin(false);
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    RouteGenerator.loginRoute,
                                    (Route route) => false,
                                  );
                                },
                                child: Text("Yes")),
                          ]);
                    },
                    child: Center(
                        child: Text(
                      "LOGOUT",
                      style: TextStyle(
                        color: Colors.red.shade800,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 2,
                      ),
                    ))),
              )
            ],
          ),
        ));
  }
}
