library(stylo)

stylo() 
# culling - сколько процентов слов должно быть во всех текстах коллекции
# wordlist можно задать вручную
# тексты должны быть в папке corpus по умолчанию 

oppose(corpus.lang = "Other", encoding="UTF-8") # сравнивает два набора текстов, 
# по умолчанию primary_set, secondary_set, test_set
# preferred - из primary_set
# avoided - из secondary_set (т.е. это слова, которых мало у первого, но которые характерны для второго)

help(oppose) #помощь

# stylo_config - можно прописать все параметры

# https://github.com/computationalstylistics/stylo_howto - source 

classify() # классификатор на машинном обучении
# primary_set - тренировочный
# secondary_set - тестовый

# Метаинформацию по классам подтягивает из названий файлов! Т.е. файлы одного класса должны иметь общую подстроку в названии

# culling везде лучше 100