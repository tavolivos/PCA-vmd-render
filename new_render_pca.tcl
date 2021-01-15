#THIS SCRIPT WAS WRITEN BY GUSTAVO E. OLIVOS-RAMIREZ. gustavo.olivos@upch.pe

set pdb [glob extreme1.pdb] 
mol new $pdb

set sel [atomselect top all]
set gec [measure center $sel]
$sel moveby [vecscale -1.0 $gec]

color Display Background white
display projection Orthographic
display depthcue off
axes location off
display nearclip set 0.00
display height 6
scale by 1.300000

material add copy AOChalky
material rename Material23 AOChalky2
material change shininess AOChalky2 0.000000
material add copy AOChalky2


mol delrep 0 top
mol color Timestep 
color scale method WBlk
mol representation Tube 0.1 50
mol material AOChalky2
mol addrep top
mol drawframes top 0 {0:1:20}


mol color Chain
mol representation Tube 0.3 50
mol material Diffuse
mol addrep top
mol modcolor 1 0 ColorID 1
animate goto 16

render POV3 $.pov povray +W3500 +H4025 -I%s -O%s.tga +X +A +FN +UA
exit

# vmd -dispdev text -e vmd_render_pca.tcl
