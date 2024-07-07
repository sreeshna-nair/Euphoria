import cv2
import numpy as np
import tensorflow as tf
import os
from .models import tbl_emotiondetection



emotion_dict = {0: "Angry", 1: "Disgusted", 2: "Neutral", 3: "Happy", 4: "Fearful", 5: "Sad", 6: "Surprised"}

def detect_emotion(image_path):
    emotion_model = tf.keras.models.load_model('emotionapp/EMOTIONSS.h5')

    image = cv2.imread(image_path)
 
    face_detector = cv2.CascadeClassifier('emotionapp/haarcascade_frontalface_default.xml')

    gray_frame = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    num_faces = face_detector.detectMultiScale(gray_frame, scaleFactor=1.3, minNeighbors=5)

    detected_emotions = []

    for (x, y, w, h) in num_faces:
        cv2.rectangle(image, (x, y-50), (x+w, y+h+10), (0, 255, 0), 4)
        roi_gray_frame = gray_frame[y:y + h, x:x + w]
        cropped_img = cv2.resize(roi_gray_frame, (48, 48))
        cropped_img = cropped_img / 255.0 

        cropped_img = np.expand_dims(cropped_img, axis=0)
        cropped_img = np.expand_dims(cropped_img, axis=-1)

        emotion_prediction = emotion_model.predict(cropped_img)
        maxindex = int(np.argmax(emotion_prediction))
        detected_emotions.append(emotion_dict[maxindex])

        cv2.putText(image, emotion_dict[maxindex], (x+5, y-20), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 2, cv2.LINE_AA)

    detected_emotions_str = ', '.join(detected_emotions)
    emotion_detection = tbl_emotiondetection.objects.create(emotionfile=image_path, emotion=detected_emotions_str)
    emotion_detection.save()

    return image, detected_emotions

def main(image_path):
    print("Provided Image Path:", image_path)

    if not os.path.isfile(image_path):
        print("Error: Image file does not exist.")
        return

    result_image, detected_emotions = detect_emotion(image_path)

    # Display the result image
    # cv2.imshow('Emotion Detected Image', result_image)
    # cv2.waitKey(0)
    # cv2.destroyAllWindows()

    if detected_emotions:
        print("Detected Emotions:")
        for emotion in detected_emotions:
            print(emotion)


if __name__ == "__main__":
    image_path = 'media/emotion.jpg'  
    main(image_path)
