import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

import 'colors.dart';

Widget imageErrorBuilderWidget(context, error, stackTrace, size) {
  return Container(
    color: Colors.grey,
    child: Center(
      child: Icon(Icons.broken_image, size: size, color: Colors.white),
    ),
  );
}

Widget appBarAction({
  required BuildContext context,
  IconData? icon,
  String? svgIcon,
  required VoidCallback onPressed,
}) {
  return IconButton(
    onPressed: onPressed,
    icon:
        svgIcon == null
            ? Icon(icon)
            : SvgPicture.asset(svgIcon, width: 20, height: 24),
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(primaryColor.withAlpha(30)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}

Widget searchView() {
  return TextFormField(
    style: const TextStyle(
      color: Colors.black,
      fontSize: 13,
      letterSpacing: 0.5,
      fontWeight: FontWeight.bold,
    ),
    decoration: InputDecoration(
      hintText: "Search",
      hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
      suffixIcon: const Icon(CupertinoIcons.search, color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      fillColor: const Color(0xFFf5f6fa),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

// Gallery Permission
Future<void> requestGalleryPermission(Function(bool) selectImage) async {
  late PermissionStatus status;
  if (Platform.isAndroid) {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt >= 33) {
      status = await Permission.photos.request();
    } else {
      status = await Permission.storage.request();
    }
  } else if (Platform.isIOS) {
    status = await Permission.photos.request();
  }

  if (status.isGranted) {
    selectImage(false);
  } else if (status.isDenied) {
    Fluttertoast.showToast(
      msg: "Permission is Denied",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  } else if (status.isPermanentlyDenied) {
    openAppSettings();
  }
}

// Camera Permission Request
Future<void> requestCameraPermission(Function(bool) selectImage) async {
  final status = await Permission.camera.request();
  if (status == PermissionStatus.granted) {
    selectImage(true);
  } else if (status == PermissionStatus.denied) {
    Fluttertoast.showToast(
      msg: "Permission is Denied",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  } else if (status == PermissionStatus.permanentlyDenied) {
    openAppSettings();
  }
}

void openSelectingImageTypeDialog({
  required BuildContext context,
  required Function(bool) selectImage,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        actions: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width - 20,
            child: Column(
              children: [
                Divider(color: Colors.grey.shade100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        requestCameraPermission(selectImage);
                      },
                      label: const Text(
                        "Camera",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      icon: const Icon(Icons.camera, size: 28),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        requestGalleryPermission(selectImage);
                      },
                      label: const Text(
                        "Gallery",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      icon: const Icon(Icons.photo, size: 28),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
        title: Text(
          "Choose Image",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    },
  );
}
