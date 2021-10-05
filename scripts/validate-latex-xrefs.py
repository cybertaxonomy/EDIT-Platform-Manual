import sys
import re

latexFile=sys.argv[1]

with open(latexFile) as f:
    contents = f.read()

anchors = re.findall(r'''\\\hypertarget\{(?P<anchor>[a-zA-Z_\-0-1]*)\}''', contents)
danglingCrossRefs = []
for m in re.finditer(r'''\\\hyperlink\{(?P<xref>[a-zA-Z_\-0-1]*)\}{(?P<label>[a-zA-Z_\-0-1]*)}''', contents):
    #print(m.group('xref'))
    if m.group('xref') not in anchors:
        danglingCrossRefs.append("[" + m.group('label') +"](#" + m.group('xref') + ")")
  
if len(danglingCrossRefs) > 0:
    print("ERROR - cross references without target found:")
    print("")
    print("anchors in file: %s" %  anchors)
    print("")
    print("broken x-refs:")
    for xref in danglingCrossRefs:
        print(" -> " + xref)
    sys.exit(1)
    
