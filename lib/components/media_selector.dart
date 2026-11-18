import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:mydj/components/video_preview.dart';

enum MediaType{
  photo,
  video
}

class MediaSelector extends StatefulWidget {
  final MediaType mediaType;
  const MediaSelector({super.key, this.mediaType = MediaType.photo});

  @override
  State<MediaSelector> createState() => _MediaSelectorState();
}

class _MediaSelectorState extends State<MediaSelector> {
  String _mediaPath = '';
  
  Widget _mediaPlaceHolder() {
    Icon icon;
    String caption = '';
    Widget placeHolderWidget;  
    //mengecek jenis media (foto/video)
    if (widget.mediaType == MediaType.photo) {
      icon = Icon(Icons.image_not_supported, color: Colors.grey,);
      caption = 'No photo';
      placeHolderWidget = Image.file(
        File(_mediaPath),
        width: double.infinity,     //widt melebar sampai penuh
        fit: BoxFit.fitWidth,       //tinggi otomatis sesuai ratio
      );
    } else {
      icon =Icon(Icons.videocam_off, color: Colors.grey,);
      caption = 'No Video';
      placeHolderWidget = VideoPreview(path: _mediaPath);
      //jika path kosong, tampilkan "no photo/video"
    } if (_mediaPath.isEmpty) {
      return SizedBox(
        height: 56,
        child: Row(
          children: [
            icon,
            SizedBox(width: 8,),
            Text(caption)
          ],
        ),
      );
    }
      //jika path ada isinya, tampilkan media
    else {
      return SizedBox(
        width: double.infinity,
        child: placeHolderWidget,
      );
    }

    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: _mediaPlaceHolder(),         //fungsi yang dibuat di panggil disini
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                color: Colors.blue[50],
                child: Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: () => {_selectFromCamera()}, 
                        child: Icon(Icons.photo_camera)
                      ) 
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: FilledButton(
                        child: Icon(Icons.photo_library),
                        onPressed: () {_selectFromGallery();}, 
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(child: FilledButton(
                      child: Icon(Icons.delete), 
                      onPressed: () {_deleteSelected();} ))
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
  Future<XFile?> _retriveMedia(ImageSource source) async {
    final picker = ImagePicker();
    XFile? media;

    if (widget.mediaType == MediaType.photo) {
      media = await picker.pickImage(source: source);
    } else {
      media = await picker.pickVideo(source: source);
    }
    return media;
  }
  //method untuk memilih media dari camera
  void _selectFromCamera() async {
    XFile? media = await _retriveMedia(ImageSource.camera);
    if (media != null) {
      setState(() {
        _mediaPath = media.path;
      });
    }
  }

  //method untuk memilih media dari gallery
  void _selectFromGallery() async {
    XFile? media = await _retriveMedia(ImageSource.gallery);
    if (media != null) {
      setState(() {
        _mediaPath = media.path;
      });
    }
  }

  void _deleteSelected() {
    setState(() {
      _mediaPath = '';
    });
  }
  
  
}