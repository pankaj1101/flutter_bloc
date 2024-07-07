part of 'sample_bloc.dart';

sealed class SampleState extends Equatable {
  const SampleState();

  @override
  List<Object?> get props => [];
}

final class SampleInitial extends SampleState {
  final XFile? file;
  const SampleInitial({this.file});

  SampleInitial copyWith({XFile? file}) {
    return SampleInitial(
      file: file ?? this.file,
    );
  }

  @override
  List<Object?> get props => [file];
}
