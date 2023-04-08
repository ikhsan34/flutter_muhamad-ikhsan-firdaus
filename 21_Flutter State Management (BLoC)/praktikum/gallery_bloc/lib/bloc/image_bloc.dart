import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallery_bloc/models/image_model.dart';
import 'package:file_picker/file_picker.dart';

part 'image_event.dart';
part 'image_state.dart';

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
