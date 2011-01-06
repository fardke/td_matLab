% Permet de modifier la fonte et la taille d'un titre
% ===================================================
% Par défaut : font_size = 11
function h_obj = my_title (texte, font_size)
if (nargin() == 1)
font_size = 11 ;
endif
h_obj = title (texte) ;
set (h_obj, 'fontname', 'times new roman') ;
set (h_obj, 'fontsize', font_size) ;
endfunction

