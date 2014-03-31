runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
Helptags

set number
syntax enable

"开启文件类型侦测
syntax on

" 设置主题
"set t_Co=256


if version > 580 
	hi clear
	if exists("syntax_on")
		 syntax reset
	endif
endif

set background=dark
"colorscheme solarized

"let g:colors_name="nslib_color256" 

" Tab键的宽度
set tabstop=4

" 自动缩进
if has("autocmd")
	filetype plugin indent on "根据文件进行缩进
	augroup vimrcEx
		au!
		autocmd FileType text setlocal textwidth=78
		autocmd BufReadPost *
					\ if line("'\"") > 1 && line("'\"") <= line("$") |
					\ exe "normal! g`\"" |
					\ endif
	augroup END
else
	"智能缩进，相应的有cindent，官方说autoindent可以支持各种文件的缩进，但是效果会比只支持C/C++的cindent效果会差一点，但笔者并没有看出来
	set autoindent " always
	set autoindenting on 
 endif " has("autocmd")

set cindent
" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 历史记录数
set history=1000

"搜索逐字符高亮
set hlsearch   "高亮显示结果
set incsearch  "在输入要搜索的文字时，vim会实时匹配

set guifont=Inconsolata:h12
set backspace=indent,eol,start whichwrap+=<,>,[,] "允许退格键的使用

" 关闭兼容模式
set nocompatible   

" 自动缩进
filetype plugin indent on

set fileencodings=utf8,gb18030
set termencoding=utf8
set fileformats=unix
set encoding=utf8

"高亮当前行 Highlight current
set cursorline

set scrolloff=3

let mapleader=","

if(has("win32") || has("win95") || has("win64") || has("win16")) "判定当前操作系统类型
	let g:iswindows=1
else
	let g:iswindows=0
endif

if(g:iswindows==1) "允许鼠标的使用
	"防止linux终端下无法拷贝
	if has('mouse')
		set mouse=a
	endif
	au GUIEnter * simalt ~x	
endif

"h cpp 切换
"""""""""""""""""""""""*.c *.h 切换""""""""""""""""""""
nnoremap <silent> <F12> :A<CR>

"列出目录数
"""""""""""""""""""""NERDTree """""""""""""""""""""""""
"nnoremap <silent> <F9> :NERDTree<CR>
"autocmd VimEnter * NERDTree

"生成函数、变量列表
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
set tags=tags
set autochdir " 自动切换当前目录为当前文件所在的目录"


""""""""""""" WinManager """"""""""""""""""""""""""""
let g:winManagerWindowLayout='FileExplorer|TagList'
let g:AutoOpenWinManager = 1
nmap wm :WMToggle<cr>
map <silent> <F9> :WMToggle<cr>  


""""""""""""""""taglist""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Exit_OnlyWindow=1 " 如果 taglist 窗口是最后一个窗口，则退出 vim
let Tlist_File_Fold_Auto_Close=1 "让当前不被编辑的文件的方法列表自动折叠起来 
let Tlist_Show_Menu=1 "显示taglist菜单
let Tlist_Show_One_File=1 

""""""""""""" 代码注释"""""""""""""""""""""""""""""""
nmap <F6> ,cc<cr>
nmap <F7> ,cu<cr>

let g:mwDefaultHighlightingPalette = 'extended' 

""""""""""作者信息"""""""""""" 
let g:vimrc_author='duxijun'
let g:vimrc_email='duxijun0703@gmail.com'
let g:vimrc_homepage='http://www.eddy.cn'
nmap <F3> :AuthorInfoDetect<cr> 

""""""""""syntastic""""""""""""
"let g:syntastic_check_on_open = 1
"let g:syntastic_cpp_check_header = 1
"let g:syntastic_cpp_no_include_search = 1
"let g:syntastic_cpp_no_default_include_dirs = 1
"let g:syntastic_cpp_auto_refresh_includes = 1
"let b:syntastic_cpp_cflags = '-I/usr/include/libsoup-2.4'
"let g:syntastic_cpp_include_dirs = [ 'includes', 'headers' ]
"let g:syntastic_cpp_compiler_options = '-std=c++0x'
"let g:syntastic_cpp_config_file = '.config'
"let g:syntastic_cpp_remove_include_errors = 1
"let g:syntastic_cpp_errorformat = '%f:%l:%c: %trror: %m'
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_include_dirs = ['/usr/include/']
"let g:syntastic_cpp_remove_include_errors = 1
"let g:syntastic_cpp_check_header = 1
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"set error or warning signs
"let g:syntastic_error_symbol = 'x'
"let g:syntastic_warning_symbol = '#'
"whether to show balloons
"let g:syntastic_enable_balloons = 1

""""""""""MimibuferExploer"""""""""""""""""""""
nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

"""""""""""""supertab"""""""""""""""""""""""
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabRetainCompletionType=2

""""""""""""""neocomplcache"""""""""""""""""""
"let g:neocomplcache_enable_at_startup = 1
"let g:NeoComplCache_DisableAutoComplete = 1

"""""""""""""""pythone pyflakes-vim"""""""""""""""""""
filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins
let g:pyflakes_use_quickfix = 0

""""""""""""""""""cscope"""""""""""""""""""""""""""""
if filereadable("cscope.out") 
	cs add cscope.out
endif	
"map <F11> :call Do_CsTag()<CR>
if has("cscope")
	set cscopetag   " 使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳来跳去
	set csto=1
	if filereadable("cscope.out")
		 cs add cscope.out
	elseif $CSCOPE_DB !=""	 
		 cs add $CSCOPE_DB
	endif
	set cscopeverbose	
	nmap <leader>ss :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <leader>sg :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <leader>sc :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <leader>st :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <leader>se :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <leader>si :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <leader>sd :cs find d <C-R>=expand("<cword>")<CR><CR>
endif





function Do_CsTag()
	let dir = getcwd()
	if filereadable("tags")
		let tagsdeleted=delete("./"."tags")	
		
		if(tagsdeleted!=0)
			echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
			return
		endif
	endif	
	if has("cscope")
		silent! execute "cs kill -1"
	endif
	if filereadable("cscope.files")
		let csfilesdeleted=delete("./"."cscope.files")	
		if(csfilesdeleted!=0)
			echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
			return
		endif
	endif
	if filereadable("cscope.out")
		let csoutdeleted=delete("./"."cscope.out")
		if(csoutdeleted!=0)
			echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
			return
		endif
	endif

	if(executable('ctags'))
		silent! execute "!ctags -R --c-types=+p --fields=+S *"
		silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
	endif
	if(executable('cscope') && has("cscope") )
		 if(g:iswindows!=1)
			 silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
		 else
			 silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
		 endif 
		 silent! execute "!cscope -b"
		 execute "normal :"
		if filereadable("cscope.out")
			execute "cs add cscope.out"
		endif
	endif
endfunction

""""""""""""""""""""make"""""""""""""""""""""""""""""""

map <F11> :call Do_OneFileMake()<CR>
function Do_OneFileMake()
	if expand("%:p:h")!=getcwd()
		echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press <F7> to redirect to the dir of this file." | echohl None
		return
	endif
	let sourcefileename=expand("%:t")
	if (sourcefileename=="" || (&filetype!="cpp" && &filetype!="c"))
		echohl WarningMsg | echo "Fail to make! Please select the right file!" | echohl None
		return
	endif	
	let deletedspacefilename=substitute(sourcefileename,' ','','g')
	if strlen(deletedspacefilename)!=strlen(sourcefileename)
		echohl WarningMsg | echo "Fail to make! Please delete the spaces in the filename!" | echohl None
		return
	endif
	if &filetype=="c"
		if g:iswindows==1
			set makeprg=gcc\ -o\ %<.exe\ %
		else
			set makeprg=gcc\ -o\ %<\ %
		endif
	elseif &filetype=="cpp"
		if g:iswindows==1
			set makeprg=g++\ -o\ %<.exe\ %
		else
			set makeprg=g++\ -o\ %<\ %
		endif
		elseif &filetype=="cs"
		set makeprg=csc\ \/nologo\ \/out:%<.exe\ %	
	endif
	if(g:iswindows==1)
		let outfilename=substitute(sourcefileename,'\(\.[^.]*\)' ,'.exe','g')
		let toexename=outfilename
	else
		let outfilename=substitute(sourcefileename,'\(\.[^.]*\)' ,'','g')
		let toexename=outfilename
	endif	
	if filereadable(outfilename)
		if(g:iswindows==1)
			let outdeletedsuccess=delete(getcwd()."\\".outfilename)
		else
			let outdeletedsuccess=delete("./".outfilename)
		endif
		if(outdeletedsuccess!=0)
			set makeprg=make
			echohl WarningMsg | echo "Fail to make! I cannot delete the ".outfilename | echohl None
			return
		endif
	endif
	execute "silent make"
	set makeprg=make
	execute "normal :"
	if filereadable(outfilename)
		if(g:iswindows==1)
			execute "!".toexename
		else
			execute "!./".toexename
	   endif
	endif
	execute "copen"	
endfunction
"<进行make的设置
map <F10> :call Do_make()<CR>
map <c-F10> :silent make clean<CR>
function Do_make()
	set makeprg=make
	execute "silent make"
	execute "copen"
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""hi Normal               ctermfg=Grey            ctermbg=Black         
"hi ColorColumn          ctermfg=White           ctermbg=Grey                                    
"hi ErrorMsg             term=standout             
"hi ErrorMsg             ctermfg=LightBlue       ctermbg=DarkBlue      
"hi WarningMsg           term=standout             
"hi WarningMsg           ctermfg=LightBlue       ctermbg=DarkBlue      
"hi ModeMsg              term=bold               cterm=bold            
"hi ModeMsg              ctermfg=LightBlue       ctermbg=Black         
"hi MoreMsg              term=bold               ctermfg=LightGreen    
"hi MoreMsg              ctermfg=LightBlue       ctermbg=Black         
"hi Question             term=standout           gui=bold  
"hi Question             ctermfg=LightBlue       ctermbg=Black         
"hi Error                term=bold               cterm=bold            
"hi Error                ctermfg=LightBlue       ctermbg=Black                                                       
"hi LineNr               ctermfg=LightBlue       ctermbg=Black         
"hi CursorColumn         ctermfg=White           ctermbg=Grey          
"hi CursorLine           ctermfg=LightBlue       ctermbg=Black         
"hi ColorColumn          ctermfg=White           ctermbg=Grey                                                    
"hi IncSearch            ctermfg=Black           ctermbg=DarkGrey      
"hi Search               ctermfg=Black           ctermbg=DarkGrey      
"hi StatusLine           term=bold               cterm=bold            
"hi StatusLine           ctermfg=Black           ctermbg=Grey          
"hi StatusLineNC         term=bold               cterm=bold            
"hi StatusLineNC         ctermfg=Black           ctermbg=Grey                                              
"hi VertSplit            ctermfg=Grey            ctermbg=Grey          
"hi Visual               term=bold               cterm=bold            
"hi Visual               ctermfg=Black           ctermbg=Grey                                                        
"highlight Pmenu         ctermfg=Black           ctermbg=Grey        
"highlight PmenuSel      ctermfg=LightBlue       ctermbg=DarkBlue                
"hi Comment              ctermfg=DarkCyan        ctermbg=Black  
"hi PreProc              ctermfg=Blue            ctermbg=Black  
"hi Type                 ctermfg=LightYellow     ctermbg=Black           cterm=bold  
"hi Constant             ctermfg=Blue            ctermbg=Black           cterm=bold  
"hi Statement            ctermfg=LightYellow     ctermbg=Black           cterm=bold  
"hi Special              ctermfg=Red             ctermbg=Black           cterm=bold  
""hi SpecialKey           ctermfg=Red             ctermbg=Black           cterm=bold  
""hi Number               ctermfg=Blue            ctermbg=Black  
""hi cCppString           ctermfg=Red             ctermbg=Black  
""hi String               ctermfg=Red             ctermbg=Black  
""hi Identifier           ctermfg=Red             ctermbg=Black           cterm=bold  
""hi Todo                 ctermfg=Black           ctermbg=Gray            cterm=bold  
""hi NonText              ctermfg=LightBlue       ctermbg=Black  
"hi Directory            ctermfg=Blue            ctermbg=Black  
"hi Folded               ctermfg=DarkBlue        ctermbg=Black           cterm=bold  
"hi FoldColumn           ctermfg=LightBlue       ctermbg=Black  
"hi Underlined           ctermfg=LightBlue       ctermbg=Black           cterm=underline  
"hi Title                ctermfg=LightBlue       ctermbg=Black  
"hi Ignore               ctermfg=LightBlue       ctermbg=Black      
"hi Directory            ctermfg=LightBlue       ctermbg=Black  
"hi browseSynopsis       ctermfg=LightBlue       ctermbg=Black  
"hi browseCurDir         ctermfg=LightBlue       ctermbg=Black  
"hi favoriteDirectory    ctermfg=LightBlue       ctermbg=Black  
"hi browseDirectory      ctermfg=LightBlue       ctermbg=Black  
"hi browseSuffixInfo     ctermfg=LightBlue       ctermbg=Black  
"hi browseSortBy         ctermfg=LightBlue       ctermbg=Black  
"hi browseFilter         ctermfg=LightBlue       ctermbg=Black  
"hi browseFiletime       ctermfg=LightBlue       ctermbg=Black  
"hi browseSuffixes       ctermfg=LightBlue       ctermbg=Black      
"hi TagListComment       ctermfg=LightBlue       ctermbg=Black  
"hi TagListFileName      ctermfg=LightBlue       ctermbg=Black  
"hi TagListTitle         ctermfg=LightBlue       ctermbg=Black  
"hi TagListTagScope      ctermfg=LightBlue       ctermbg=Black  
"hi TagListTagName       ctermfg=LightBlue       ctermbg=Black  
"hi Tag                  ctermfg=LightBlue       ctermbg=Black  

"hi cMathOperator guifg=#3EFFE2
"hi cPointerOperator guifg=#3EFFE2
"hi cLogicalOperator guifg=#3EFFE2
"hi cBinaryOperator guifg=#3EFFE2
"hi cBinaryOperatorError guifg=#3EFFE2
"hi cLogicalOperator guifg=#3EFFE2
"hi cLogicalOperatorError guifg=#3EFFE2
"syn match cFunction "/<[a-zA-Z_][a-zA-Z_0-9]*/>[^()]*)("me=e-2
"syn match cFunction "/<[a-zA-Z_][a-zA-Z_0-9]*/>/s*("me=e-1
"hi cFunction gui=NONE guifg=#B5A1FF
"syn match cMathOperator display "[-+/*/%=]"
"syn match cPointerOperator display "->/|/."
"syn match cLogicalOperator display "[!<>]=/="
"syn match cLogicalOperator display "=="
