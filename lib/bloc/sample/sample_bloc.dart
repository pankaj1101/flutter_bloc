import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sample/utils/image_picker_utils.dart';

part 'sample_event.dart';
part 'sample_state.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  final ImagePickerUtis imagePickerUtis;

  SampleBloc(this.imagePickerUtis) : super(const SampleInitial()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryCapture>(_galleryCapture);
  }

  Future<FutureOr<void>> _cameraCapture(
      CameraCapture event, Emitter<SampleState> emit) async {
    final currentState = state as SampleInitial;
    XFile? file = await imagePickerUtis.takePicker();
    emit(currentState.copyWith(file: file));
  }

  Future<FutureOr<void>> _galleryCapture(
      GalleryCapture event, Emitter<SampleState> emit) async {
    final currentState = state as SampleInitial;
    XFile? file = await imagePickerUtis.galleryPicker();
    emit(currentState.copyWith(file: file));
  }
}
