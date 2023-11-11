import 'package:cryptoapp/Services/auth_services.dart';
import 'package:cryptoapp/Utils/Constants/AssetConstants.dart';
import 'package:cryptoapp/Utils/Constants/ColorConstants.dart';
import 'package:cryptoapp/controllers/user_controller.dart';
import 'package:cryptoapp/views/widgets/rate_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserController userController = Get.find(tag: "userController");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            width: 360.0,
            height: 180.0,
            child: Stack(
              children: [
                Positioned(
                  top: 60,
                  left: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 242, 242, 242),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    width: 330,
                    height: 130,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            userController.getName(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            userController.getEmail(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                          TextButton(
                            onPressed: () => {},
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              width: 170,
                              height: 30,
                              child: const Center(
                                child: Text(
                                  "Update Username",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: ClipOval(
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      color: Colors.black,
                      child: userController.getDP().isEmpty
                          ? const Icon(
                              Icons.person,
                              color: ColorConstants.filledButonTextColor,
                            )
                          : Image.network(
                              userController.getDP(),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Image.asset(AssetConstants.balanceCard),
          ),
          const SizedBox(
            height: 40,
          ),
          TextButton(
              onPressed: () => {
                    AuthService().signOut(),
                  },
              child: Container(
                height: 70,
                width: 300,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Center(
                    child: Text(
                  "Logout",
                  style: TextStyle(
                      fontSize: 17,
                      color: ColorConstants.filledButonTextColor,
                      fontWeight: FontWeight.bold),
                )),
              )),
        ],
      ),
    );
  }
}
