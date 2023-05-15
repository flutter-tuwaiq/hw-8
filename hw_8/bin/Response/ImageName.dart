
import 'dart:io';
import 'dart:math';  

// Just a training to get the user to create the name of the image

ImageName(){
  int id = Random().nextInt(999999999999);
  print("enter the image name");
  var imageName = stdin.readByteSync();

  if (imageName == null){
    imageName = id;
  }

  return imageName;

}