import 'package:image_picker/image_picker.dart';

class ImagePickerUtis {
  final ImagePicker _imagePicker = ImagePicker();

  Future<XFile?> takePicker() async {
    XFile? file = await _imagePicker.pickImage(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> galleryPicker() async {
    XFile? file = await _imagePicker.pickImage(source: ImageSource.gallery);
    return file;
  }
}