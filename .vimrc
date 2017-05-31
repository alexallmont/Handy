fu! Select_tab_style()
	if search('^\t', 'n', 150)
		set noexpandtab
	el
		" Spaces, not tabs
		set expandtab
	en
endf

if has("gui_running")
	syntax on
	set hlsearch
	colorscheme peachpuff
	set bs=2
	set ai
	set ruler
else
	syntax on
	set hlsearch
	set bs=2
	set ai
	set ruler
	set shiftwidth=2
	set tabstop=2
	set smarttab
	set softtabstop=2

	au BufRead,BufNewFile * call Select_tab_style()
	" Don't expand tabs on Makefiles of shell scripts
	au BufRead,BufNewFile Makefile*,*.sh,.*rc,.*profile set noexpandtab

	" Do automatic indenting
	set autoindent
	set smartindent

	" set nobackup
	" set nowritebackup

	" Show whitespaces
	set list
	set listchars=tab:>\
	set listchars+=trail:.

	" Add bad whitespace colouring
	highlight BadWhitespace ctermbg=red guibg=red
	"au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
	au BufRead,BufNewFile *.rb,*.rs,*.py,*.pyw,*.c,*.h,*.cpp,*.hpp,Makefile*,*.sh match BadWhitespace /\s\+$/

	" Ignore case when searching
	set ignorecase
	set smartcase
endif
