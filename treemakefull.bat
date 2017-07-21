@echo off
tree /f /a > .tree.txt
more +6 ".tree.txt">".tree.txt.new"
move /y ".tree.txt.new" ".tree.txt" >nul
clip< .tree.txt
del .tree.txt

