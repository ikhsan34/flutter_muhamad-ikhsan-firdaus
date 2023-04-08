part of 'image_bloc.dart';

class ImageState extends Equatable {

  final List<ImageModel> images;

  const ImageState({required this.images});

  ImageState copyWith({required List<ImageModel>? images}) {
    return ImageState(images: images ?? this.images);
  }

  Future<ImageState> addImage() async {

    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        final file = result.files.single;
        final ImageModel image = ImageModel(name: file.name, path: file.path!, file: File(file.path!));
        return copyWith(
          images: List.of(images)..add(image)
        );
    }

    return copyWith(images: null);
  }

  ImageState removeImageByIndex(int index) {    
    return copyWith(
      images: List.of(images)..removeAt(index)
    );
  }


  @override
  List<Object?> get props => [images];
}

