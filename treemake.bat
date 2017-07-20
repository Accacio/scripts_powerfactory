@echo off
tree /a > .tree.txt
more +3 ".tree.txt">".tree.txt.new"
move /y ".tree.txt.new" ".tree.txt" >nul
clip< .tree.txt
del .tree.txt

