
#read original csv file with dead encoding and store content in variable
with open('Oldpost.csv', encoding='Windows-1252') as f:
    contents = f.read()

#write content to new file with utf-8 encoding
with open('post.csv', mode='w', encoding='utf-8') as f:
    f.write(contents)