#!/bin/bash

CHECKLIST="adjustbox babel-german background bidi collectbox csquotes everypage filehook
footmisc footnotebackref framed fvextra letltxmacro ly1 mdframed mweights
needspace pagecolor sourcecodepro sourcesanspro titling ucharcat ulem
unicode-math upquote xecjk xurl zref"



for pkg in $CHECKLIST; do
    found=$(ls -la /usr/share/texlive/texmf-dist/tex/latex/*/*.sty | grep "/$pkg")
    if [[ -z $found ]]; then 
        echo " $pkg missing, install : "$(apt-file search $pkg | grep "$pkg.*\.sty")
    fi
done
