#!/usr/bin/python
import os
from google.cloud import texttospeech


os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = "path/to/credentials.json"
client = texttospeech.TextToSpeechClient()

file = open("script.txt", "r")
script = file.read()
file.close()
synthesis_input = texttospeech.SynthesisInput(text=script)
voice = texttospeech.VoiceSelectionParams(
	language_code='pt-PT',
	ssml_gender=texttospeech.SsmlVoiceGender.NEUTRAL,
	name='pt-PT-Wavenet-C'
)

audio_config = texttospeech.AudioConfig(
    audio_encoding=texttospeech.AudioEncoding.MP3
)

response = client.synthesize_speech(
    input=synthesis_input, voice=voice, audio_config=audio_config
)

with open("output.mp3", "wb") as out:
    out.write(response.audio_content)
    print('Audio content written to file "output.mp3"')


