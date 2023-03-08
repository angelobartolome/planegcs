#!/bin/bash

set -e

# see https://stackoverflow.com/questions/600079/how-do-i-clone-a-subdirectory-only-of-a-git-repository/52269934#52269934
git clone --depth 1 --filter=tree:0 --sparse https://github.com/FreeCAD/FreeCAD.git &> /dev/null
pushd FreeCAD
# the behaviour of this command might vary depending on the git version
git sparse-checkout set src/*.h src/*.hpp src/Mod/Sketcher/App/planegcs &> /dev/null
popd

# move the planegcs source files
mv FreeCAD/src/Mod/Sketcher/App/planegcs/* .
# move some required headers
mv FreeCAD/src/boost_graph_adjacency_list.hpp .
mv FreeCAD/src/FCConfig.h .
mv FreeCAD/src/FCGlobal.h .

rm -rf FreeCAD