part of 'sample_bloc.dart';

sealed class SampleEvent extends Equatable {
  const SampleEvent();

  @override
  List<Object> get props => [];
}

class CameraCapture extends SampleEvent {}

class GalleryCapture extends SampleEvent {}
