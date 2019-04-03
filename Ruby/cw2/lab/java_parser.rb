# ma parsować plik .java zwrocic listę klas, ich pola, ich 

def open_file(path)
    text = FILE.read(path)
    text = text.sub (/\/\/.*/ ,'')
    text = text.sub (/\/\*(.|\n)*?\*\/./ , '')
    
    
    