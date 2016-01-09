import re
import string

def word_count(sentence):
    sentence         = sentence.lower()
    word_list        = re.split('[,_\W]+', sentence)

    count            = {word: word_list.count(word) for word in word_list if word != ''}
    return count
