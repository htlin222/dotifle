from googletrans import Translator
import os
import pyperclip as pc
text = pc.paste()
translator = Translator()
translated =translator.translate(text, dest='zh-tw')
print(translated.text)
# pc.copy(text1)
