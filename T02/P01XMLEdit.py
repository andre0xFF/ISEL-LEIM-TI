import xml.etree.ElementTree as ElementTree

################################
# Edição de XML: adição, alteração, remoção

################################
# função que devolve uma string com a árvore XML recebida, mas num formato pretty
def prettyXML(elem):
    return prettyXMLInternal(elem, "")
   

################################
# função auxiliar de prettyXML
def prettyXMLInternal(elem, prefix):
    prettyXML = prefix + "<" + elem.tag
    
    # attributes
    for att in elem.keys():
        prettyXML += " " + att + "=\"" + elem.get(att) + "\""
    
    childs = elem.findall("*")
    
    # empty element and with text
    if len(childs) == 0:
        if elem.text == None:
            return prettyXML + "/>"
        else: 
            return prettyXML + ">" + elem.text + "</" + elem.tag + ">"

    prettyXML += ">\n" 
    
    # childs
    for child in childs:
        prettyXML += str(prettyXMLInternal(child, prefix + "  ")) + "\n"
         
    return prettyXML + prefix + "</" + elem.tag + ">"
    
################################
# função que devolve uma string com a árvore XML recebida, mas num formato pretty
def prettyXML2(elem):
    lines = prettyXMLInternal(elem)
    content = ""
    last = lines[len(lines) - 1]
    for s in lines:
        content += s
        if s != last: content += "\n"
    return content

################################
# função auxiliar de prettyXML
def prettyXMLInternal2(elem):
    lines = []
    e = "<" + elem.tag
    
    # attributes
    for att in elem.keys():
        e += " " + att + "=\"" + elem.get(att) + "\""
    
    childs = elem.findall("*")
    
    # empty element and with text
    if len(childs) == 0:
        if elem.text == None:
            e += "/>"
        else: 
            e += ">" + elem.text + "</" + elem.tag + ">"
        lines.append(e)
        return lines
        
    e += ">"
    lines.append(e)
    
    # childs
    for child in childs:
        childLines = prettyXMLInternal2(child)
        childLines = ["  " + x for x in childLines]
        lines.extend(childLines)
            
    lines.append("</" + elem.tag + ">")
    return lines

################################
# Função auxiliar que devolve uma string formado pelas strings recebidas 
# na lista de argumento e com os seus elemento separados por uma vírgula
def comaSeparated(l):
    s = ""
    if(len(l) > 0):
        s = l[0]
    for i in range(1, len(l)):
        s += ", " + l[i]
    return s

################################
def main():   

    a = ElementTree.Element('a')
    b = ElementTree.SubElement(a, 'b')
    c = ElementTree.SubElement(a, 'c')
    d = ElementTree.SubElement(c, 'd')
    
    x = ElementTree.Element('x')
    a.append(x)
    
    z1 = ElementTree.Element('z1')
    z2 = ElementTree.Element('z2')
    l = [z1, z2]
    a.extend(l)
    
    x1 = ElementTree.SubElement(x, 'x1')
    ElementTree.SubElement(x1, 'x11')
   
    b.set("id", "a1")
    b.set("name", "Boo")
    d.text = "Helloooo"
   
    ElementTree.dump(a)
    print(prettyXML(a))
    
    b.set("id", "a2")
    print(prettyXML(a))
    print("Coma separated strings = " + comaSeparated(["a", "b", "c"]))
    
    # criar uma ElememtTree com o elemento ‘a’ com elemento raiz
    tree = ElementTree.ElementTree(a)
    # escrever o conteúdo de tree em ficheiro
    tree.write("newXMLFile.xml", encoding='UTF-8', xml_declaration=True)
    
    # Função auxiliar criada para devolver uma string formada pelas strings 
    # recebidas na lista de argumento e com os seus elemento separados por
    # uma vírgula
    print("Coma separated strings = " + comaSeparated(["a", "b", "c"]))
    
    # Teste a "List Comprehensions"
    # ss = ["w", "e" , "f"]
    # sr = ["  " + x for x in ss]
    # print(sr)
   
################################
if __name__ == '__main__':
    main()
