:syn on
:set number
:set mouse=a
"wrap around
:set whichwrap=h,l,<,>,[,]
:set backup
:set backupext=.bck
:set nu
:set ai
:set sm
:set laststatus=2
:set foldmethod=manual
":map // v%zf
:map \\ /^\s\+/ <enter>
:set showcmd
:set showmode
:set cindent
:set ruler
:set vb
:set hlsearch
:filetype plugin on
"rallenta
":set cursorline

"// serve per fare la ricerca di cosa è stato selezionato in visual mode
:vn // y/<C-R>"<CR>

"per latex
"inutile, tanto per il latex uso kile
":map \\ :!xterm -bg ivory -fn 7x14 -e latex % & <enter><enter>
":map \\ :! latex master.tex <enter><enter>
":map \d :!xdvi master.dvi & <enter><enter>

":colorscheme morning
:set t_Co=256

"per mantenere memoria della posizione del cursore tra differenti 
"sessioni 
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"in questo modo :W funziona come :w  (nota :Wq non funziona)
:cmap W<CR> w<CR>
":cmap Wq<CR> wq<CR>
":cmap WQ<CR> wq<CR>
":cmap Q<CR> q<CR>

"gui only: defifisco un mio menu con delle funzioni che mi sono utili
:amenu vimrc.edit  :e ~/.vimrc<CR>  
:amenu vimrc.source  :so ~/.vimrc<CR>  


"mancano degli header
:iab header_C  #include "TFile.h"    <NL>
               \#include "TString.h"  <NL>
               \#include "TF1.h"      <NL>
               \#include "TNtupleD.h" <NL>
               \#include "TObject.h"  <NL>
               \#include "TH1D.h"     <NL>
               \#include <iostream>   <NL>
               \#include <fstream>    <NL>
               \#include <strstream>  <NL>
               \#include <string>     <NL>
               \#include <vector>     <NL>
               \using namespace std;   <NL>


":iab canv_root  TCanvas *c1 = new TCanvas 

"per abilitare l'uso del menu popup col pulsante destro del mouse
"per cambiare il menu bisogna editare il file $VIMRUNTIME/menu.vim
:set mousemodel=popup


"fisso il filetype del file corrente come di tipo vim
au BufRead,BufNewFile %	set filetype=vim

"
"definisco dei comandi ,c e ,u per commentare o levare i commenti messi in
"base al tipo di file che si sta editando
"
"
au FileType psql let b:comment_leader = '-- '
au FileType vim let b:comment_leader = '" '
au FileType c,cpp,cc,cxx,h,C,java let b:comment_leader = '// '
"nota: i files .cfg vengono visti come files ascii
au FileType sh,make,perl,.cfg let b:comment_leader = '# '
au FileType tex let b:comment_leader = '% '
noremap <silent> ,c :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
noremap <silent> ,u :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>

"gui only
if has('gui_running')
  "set guioptions-=T  " no toolbar
  colorscheme eclipse 
  :amenu 1.10 PopUp.Comment ,c
  :amenu 1.10 PopUp.Uncomment ,u
endif



"an PopUp.Undo u
" an 1.10 PopUp.&Undo			u
" an 1.15 PopUp.-SEP1-			<Nop>
" vnoremenu 1.20 PopUp.Cu&t		"+x
" vnoremenu 1.30 PopUp.&Copy		"+y
" 
"per usare la funnzione :call ShowTabAndSpace()
function! ShowTabAndSpace()
	set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
	set list
 	syntax match Tab /\t/
 	hi Tab gui=standout guifg=orange ctermbg=blue 
 	syntax match Space /\ /
 	hi Space gui=standout guifg=red ctermbg=red 
endfunction

":set wm=
":set linebreak
":set display+=lastline
"  :set wrap
"  :set linebreak
"  :set nolist  " list disables linebreak
"  :set textwidth=0
"  :set wrapmargin=0
"  :set formatoptions=l
"  :set lbr 
