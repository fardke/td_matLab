% Permet de cadrer en vertical par rapport aux valeurs min et max avec une marge
function set_ylim (y, marge)
if (nargin() == 1)
marge = 0.05 ;
endif
ymin = min(y) ;
ymax = max(y) ;
dy = (ymax-ymin)*marge ;
ymin = ymin-dy ;
ymax = ymax+dy ;
ylim([ymin ymax]) ;
endfunction

