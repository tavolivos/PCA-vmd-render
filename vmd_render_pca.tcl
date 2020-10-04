#THIS SCRIPT WAS WRITEN BY GUSTAVO E. OLIVOS-RAMIREZ. gustavo.olivos@upch.pe

set pdb [glob CA*.pdb] 
mol new $pdb

set sel [atomselect top all]
set gec [measure center $sel]
$sel moveby [vecscale -1.0 $gec]

color Display Background white
display projection Perspective
display depthcue off
axes location off

display height 6
rotate x by 180; rotate z by 90

mol delrep 0 top
mol color Timestep 
color scale method WBlk
mol representation Tube 0.1 40
mol material BrushedMetal
mol addrep top
mol drawframes top 0 {0:1:20}


mol color Chain
mol representation Tube 0.2 40
mol material Diffuse
mol addrep top

render POV3 $pdb.pov povray +W3500 +H4025 -I%s -O%s.tga +X +A +FN +UA
exit

#	vmd -dispdev text -e vmd_render_pca.tcl
