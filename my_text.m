% Permet de modifier la fonte et la taille d'un commentaire
% =========================================================
% Par défaut : font_size = 11
function h_obj = my_text (x, y, texte, font_size)
if (nargin() == 3)
font_size = 11 ;
endif
h_obj = text (x, y, texte) ;
set (h_obj, 'fontname', 'times new roman') ;
set (h_obj, 'fontsize', font_size) ;
endfunction

