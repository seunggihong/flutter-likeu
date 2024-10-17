# flutter_likeu

- /lib/views/camera/camera_view.dart에서 gallary를 누르면 갤러리에서 동영상을 선택하고 upload를 누르면 flask로 http post해서 동영상 전송됨.

- 전송된 동영상을 flask에서 yolov8을 통해 keypoint와 관걸 각도를 추출하여 csv파일로 저장후 camera_view.dart로 csv파일을 return함.

- return된 csv파일을 열어서 내용을 출력함.
