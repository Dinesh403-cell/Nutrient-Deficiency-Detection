import os
import numpy as np
import pandas as pd
from tensorflow import keras
from sklearn.base import BaseEstimator, TransformerMixin
from sklearn.pipeline import Pipeline
from keras.preprocessing import image
from PIL import Image
import streamlit as st

st.set_page_config(layout="wide")

# Set background image function
def set_bg_hack_url():
    st.markdown(
        """
        <style>
        .stApp {
            background: url("https://wallpaperbat.com/img/161069-neural-network-wallpaper.gif");
            background-size: cover
        }
        </style>
        """,
        unsafe_allow_html=True
    )

# Load the model with the corrected reduction argument
@st.cache_resource
def load_model():
    model = keras.models.load_model('weights.hdf5', compile=False)
    # Re-compile with valid reduction parameter
    model.compile(
        optimizer=keras.optimizers.Adam(learning_rate=1e-5),
        loss=keras.losses.CategoricalCrossentropy(reduction='sum_over_batch_size'),
        metrics=['accuracy']
    )
    # Optionally unfreeze layers for fine-tuning
    for layer in model.layers[-4:]:
        layer.trainable = True
    return model

# Define a prediction pipeline
def get_pipeline():
    model = load_model()

    # Preprocessor for image
    class Preprocessor(BaseEstimator, TransformerMixin):
        def fit(self, img_object):
            return self

        def transform(self, img_object):
            img_array = image.img_to_array(img_object)
            expanded = np.expand_dims(img_array, axis=0)
            return expanded

    # Predictor for classifying nutrient deficiencies
    class Predictor(BaseEstimator, TransformerMixin):
        def fit(self, img_array):
            return self

        def predict(self, img_array):
            probabilities = model.predict(img_array)
            predicted_class = ['P_Deficiency', 'Healthy', 'N_Deficiency', 'K_Deficiency'][probabilities.argmax()]
            return predicted_class

    return Pipeline([('preprocessor', Preprocessor()), ('predictor', Predictor())])

# Load uploaded image
def load_image(image_file):
    img = Image.open(image_file)
    return img

# Predict function
def output(full_pipeline, img):
    img = img.resize((224, 224))
    prediction = full_pipeline.predict(img)
    return prediction

# Main function for the Streamlit app
def main():
    set_bg_hack_url()
    col1, col2 = st.columns(2)

    with col1:
        st.title('NUTRIENT DEFICIENCY DETECTION')
        st.subheader('Image Classification Using CNN for identifying Plant Nutrient Deficiencies')
        image_file = st.file_uploader("Upload Images", type=["png", "jpg", "jpeg"])

        if st.button('Predict'):
            if image_file is not None:
                with st.spinner('Loading Image and Model...'):
                    full_pipeline = get_pipeline()
                file_details = {"filename": image_file.name, "filetype": image_file.type, "filesize": image_file.size}
                st.write(file_details)
                img = load_image(image_file)
                w, h = img.size
                display_width = 600 if w > h else int(w * (600.0 / h))
                st.image(img, width=display_width)

                with st.spinner('Predicting...'):
                    prediction = output(full_pipeline, img)
                st.success(f"Prediction: {prediction}")

if __name__ == '__main__':
    main()
