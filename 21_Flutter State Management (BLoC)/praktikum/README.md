# Praktikum Flutter BLoC

Folder project name \
**gallery_bloc**

## Flutter Gallery App with BLoC State Management

### Dashboard
<img src="https://user-images.githubusercontent.com/10411833/230734051-11b27553-0ce2-4d17-b9bd-97a56eec1ec3.png" height=600>

### Detail Image
<img src="https://user-images.githubusercontent.com/10411833/230734056-f91e5829-af47-471a-bce8-a136baa6de4d.png" height=600>

### File Picker
<img src="https://user-images.githubusercontent.com/10411833/230734061-63f722fb-7ea3-4ade-8ed8-cbba29fada3b.png" height=600>

### Code
#### ImageState()
##### Add Image
```dart
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
```

###### Remove Image
```dart
ImageState removeImageByIndex(int index) {    
    return copyWith(
      images: List.of(images)..removeAt(index)
    );
  }
```

#### ImageEvent()
```dart
class AddImageButton extends ImageEvent {}

class RemoveImageButton extends ImageEvent {

  final int index;

  RemoveImageButton({required this.index});
}
```

#### ImageBloc()
```dart
class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(const ImageState(images: [])) {
    on<ImageEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AddImageButton>((event, emit) async {
      emit(await state.addImage());
    });

    on<RemoveImageButton>((event, emit) {
      emit(state.removeImageByIndex(event.index));
    });
  }
}
```


























