part of 'image_bloc.dart';

abstract class ImageEvent {}

class AddImageButton extends ImageEvent {}

class RemoveImageButton extends ImageEvent {

  final int index;

  RemoveImageButton({required this.index});
}
