import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File pickedImage) onPickImage;

  const UserImagePicker({super.key, required this.onPickImage});

  @override
  State<UserImagePicker> createState() {
    // TODO: implement createState
    return _UserImagePickerState();
  }
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImageFile;

  void _pickImage() async {
    XFile? pickedImage;

    if (Platform.isIOS) {
      pickedImage = await ImagePicker().pickImage(
          source: ImageSource.gallery, imageQuality: 50, maxWidth: 150);
    } else {
      pickedImage = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 50, maxWidth: 150);
    }

    if (pickedImage == null) {
      return;
    }
    setState(() {
      _pickedImageFile = File(pickedImage!.path);
    });
    widget.onPickImage(_pickedImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          foregroundImage:
              _pickedImageFile != null ? FileImage(_pickedImageFile!) : null,
        ),
        TextButton.icon(
          onPressed: _pickImage,
          label: Text(
            "Add image",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          icon: const Icon(Icons.image),
        )
      ],
    );
  }
}
