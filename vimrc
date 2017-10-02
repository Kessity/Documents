set nocompatible  "取消版本一致性  
set backspace=indent,eol,start  "insert下退格健删除位于行首的空格，断行，进入insert前的位置
set nu          "设置行数
set history=40
set splitright   "当打开缓冲区时，窗口位于右边

" 修改leader键
let mapleader = ','
let g:mapleader = ','

"搜索显示
set incsearch
set hlsearch
"set nowrapscan "搜索时，到达端点时就停止

set showcmd   "显示nomar下的命令

syntax enable "开启彩色
syntax on    "语法高亮度显示sync fromstart
set magic  "生成魔术

"set cursorline  "高亮当前行
hi Normal  ctermfg=252 ctermbg=none
set nobackup   "不生成备份文件
set noswapfile  "不生成交换文件
set autowrite  "自动存盘

"括号配对情况, 跳转并高亮一下匹配的括号
set showmatch
"How many tenths of a second to blink when matching brackets
set matchtime=2

"自定义快捷键设置
nnoremap ; :
" inoremap ` <Esc>:x<CR>
nnoremap ` :x<CR>
nnoremap q :q!<CR>

"粘贴复制的使用********************************************************************
vnoremap <leader>y "+y
nnoremap <leader>p "+p
"**********************************************************************************

" 显示中文帮助************************************************
if version >= 603
  set helplang=cn
  set encoding=utf-8
endif
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set langmenu=zh_CN.UTF-8
"**************************************************************************

"自动补全××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××
inoremap ( ()<ESC>i
inoremap { {}<ESC>i
inoremap [ []<ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
"****************************************************************************

"新建.c,.h,.sh,.java文件，自动插入文件头**************************************
autocmd BufNewFile *.sh,*.html,*.php,*.tex,*.cpp,*.java,*.[ch],*.md exec ":call SetTitle()"
func SetTitle()
"如果文件类型为.sh文件
   if &filetype=='sh'
	   call setline(1,"\#########################################################################")
	   call append(line("."), "\# File Name: ".expand("%"))
	   call append(line(".")+1, "\# Author   : Kessity")
	   call append(line(".")+2, "\# mail     : 1677921708@qq.com")
	   call append(line(".")+3, "\# Time: ".strftime("%c"))
	   call append(line(".")+4, "\#########################################################################")
	   call append(line(".")+5, "\#!/bin/bash")
	   call append(line(".")+6, "")
	elseif &filetype=='html'
		call setline(1,"<!DOCTYPE html>")
		call append(line("."), "<html lang=\"en\">")
		call append(line(".")+1, "<head>")
		call append(line(".")+2, "   <meta http-equiv=\"Content-Type\" content=\"text\/html; charset=UTF-8\">")
		call append(line(".")+3, "   <title></title>")
		call append(line(".")+4, "</head>")
		call append(line(".")+5, "")
		call append(line(".")+6, "<body>")
		call append(line(".")+7, "")
		call append(line(".")+8, "   ")
		call append(line(".")+9, "")
		call append(line(".")+10, "</body>")
		call append(line(".")+11, "</html>")
		normal 9jl
	elseif &filetype=='php'
		call setline(1,"<?php")
		call append(line("."), "")
		call append(line(".")+1, "")
		call append(line(".")+2, "")
		call append(line(".")+3, "?>")
		normal 2j
 	elseif &filetype=='tex'
		call setline(1,"\\documentclass[11pt]{article}")
		call append(line("."), "\\usepackage{CJKutf8}")
		call append(line(".")+1, "\\usepackage{cite}")
		call append(line(".")+2, "\\usepackage{geometry}")
		call append(line(".")+3, "\\geometry{left=2cm,right=2cm,top=2cm,bottom=2.2cm}")
		call append(line(".")+4, "")
		call append(line(".")+5, "\\begin{document}")
		call append(line(".")+6, "\\begin{CJK}{UTF8}{gkai}")
		call append(line(".")+7, "")
		call append(line(".")+8, "\\end{CJK}")
		call append(line(".")+9, "\\end{document}")
		normal 8j
	else
	   call setline(1, "/***")
      call append(line("."), "  * @file   ".expand("%"))
      call append(line(".")+1, "  *")
      call append(line(".")+2, "  *")
      call append(line(".")+3, "  * @author Kessity   <1677921708@qq.com>")
		call append(line(".")+4, "  * @date   ".strftime("%Y-%m-%d %H:%M:%S %p"))
      call append(line(".")+5, "  *")
      call append(line(".")+6, "  */")
      call append(line(".")+7, "")
	endif
	if &filetype=='h'
		call append(line(".")+8, "#ifndef ".toupper(strpart(expand("%"), 0, strlen(expand("%"))-2))."_H")
		call append(line(".")+9, "#define ".toupper(strpart(expand("%"), 0, strlen(expand("%"))-2))."_H")
		call append(line(".")+10, "")
		call append(line(".")+11, "#include ")
		call append(line(".")+12, "")
		call append(line(".")+13, "#endif")
		set filetype=cpp
		normal 12j8l
	elseif &filetype=='cpp'
		call append(line(".")+8, "#include <cstdio>")
      call append(line(".")+9, "#include <cstdlib>")
      call append(line(".")+10, "#include <iostream>")
      call append(line(".")+11, "using namespace std;")
      call append(line(".")+12, "")
		call append(line(".")+13, "int main(int argc, char *argv[])")
		call append(line(".")+14,"{")
		call append(line(".")+15,"	")
		call append(line(".")+16,"	return 0;")
		call append(line(".")+17,"}")
		normal 16j
	elseif &filetype=='c'
      call append(line(".")+8, "#include <stdio.h>")
      call append(line(".")+9, "#include <stdlib.h>")
      call append(line(".")+10, "#include <string.h>")
      call append(line(".")+11, "")
		call append(line(".")+12, "int main(int argc, char *argv[])")
		call append(line(".")+13,"{")
		call append(line(".")+14,"	")
		call append(line(".")+15,"   return 0;")
		call append(line(".")+16,"}")
		normal 15j
	endif
	if &filetype=='java'
		call append(line(".")+8, "")
		normal 10j
	endif
endfunc

"打开自动定位到最后编辑的位置, 需要确认.viminfo 当前用户可写
if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
   au BufReadPost * if &filetype=='h' | set filetype=cpp | endif
endif
"********************************************************************************

"自动对齐和缩进×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××
filetype indent on "针对不同的文件类型采用不同的缩进格式
set autoindent   "vim使用自动对起,也就是把当前行的对起格式应用到下一行
set smartindent	"依据上面的对起格式,智能的选择对起方式
au BufNewFile,BufRead * exec ":call SetTab()"
func SetTab()
	if &filetype=="python"
		set tabstop=4
		set softtabstop=4
		set shiftwidth=4
	elseif &filetype=="javascript" || &filetype=="css" || &filetype=="html"
		set tabstop=2
		set softtabstop=2
		set shiftwidth=2
	else
		set tabstop=3     "tab键的数为4
		set softtabstop=3
		set shiftwidth=3  "当行之间交错时使用4个空格
	endif
endfunc
"*************************************************************************************

"插件安装×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××
filetype plugin on " 允许插件
filetype on                  " 检测文件类型required
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Bundle 'gmarik/vundle'
Bundle 'SirVer/ultisnips'
Bundle 'marijnh/tern_for_vim'
"代码折叠
Plugin 'tmhedberg/SimpylFold'
"python缩进
Plugin 'vim-scripts/indentpython.vim'
Plugin 'honza/vim-snippets'
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'
Plugin 'vim-scripts/taglist.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-latex/vim-latex'
Bundle 'shawncplus/phpcomplete.vim'
"Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-commentary'
Plugin 'bling/vim-airline'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
call vundle#end()
filetype plugin indent on     "启动自动补全 required
"×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××

"代码折叠SimpylFold配置********************************************************
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1
"**********************************************************************************

"对于脚本语言的补全******************************************************************
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"**********************************************************************************

"vim-commentary配置×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××
autocmd FileType python,shell set commentstring=#\ %s                 " 设置Python注释字符
autocmd FileType mako set cms=##\ %s
"**********************************************************************************

"html5配置×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0
"××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××

"emmet配置****************************************************************************************
let g:user_emmet_install_global = 0
autocmd FileType html,css,php EmmetInstall "Enable just for html/css/php
let g:user_emmet_leader_key='<C-Z>'
"****************************************************************************************

"phpcomplete配置********************************************************************
let g:phpcomplete_relax_static_constraint = 0
"***********************************************************************************

"tagbar设置*必须安装ctags软件************************************************************
let g:tagbar_autofocus = 1
let g:tagbar_width=30
map b :TagbarToggle<CR>
"************************************************************************************

"Settings for tagslist*****************************************************************
let Tlist_Use_Right_Window = 1 "让taglist窗口出现在Vim的右边
let Tlist_File_Fold_Auto_Close = 1 "当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。
let Tlist_Show_One_File = 1 "只显示一个文件中的tag，默认为显示多个
"let Tlist_Sort_Type ='name' "Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序
let Tlist_GainFocus_On_ToggleOpen = 1 "Taglist窗口打开时，立刻切换为有焦点状态
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_WinWidth = 32 "设置窗体宽度为32，可以根据自己喜好设置
set tags=tags
"热键设置，我设置成Leader+t来呼出和关闭Taglist
map t :TlistToggle<CR>
"更新tags文件
map <leader>t :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
"*************************************************************************************

"YouCompleteMe*************************************************************************
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp> pumvisible()? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"跳转到定义处和声明处
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_show_diagnostics_ui = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_filepath_completion_use_working_dir = 1
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['']
"确保了完成操作之后，自动补全窗口不会消失
let g:ycm_autoclose_preview_window_after_completion=1
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
let g:ycm_key_invoke_completion = '<C-a>'
"开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files=1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
"禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
"开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"改变g++编译器支持C++11标准
let g:syntastic_cpp_compiler = 'g++'
"设置g++选项支持c++11
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'

"设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}

"关闭lua 的ycm 和 lua 插件冲突
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'gitcommit': 1,
      \ 'lua': 1
      \}
"***********************************************************************************************

"SirVer/ultisnips配置**********************************************************************
"解决与YCM插件的冲突 ycm快捷键  和 ul快捷键
let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']

"代码块补全快捷键cj
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
let g:UltiSnipsListSnippets="<C-e>"

"定义存放代码片段的文件夹，使用自定义和默认的，将会的到全局，有冲突的会提示
let g:UltiSnipsSnippetDirectories=["./myUltiSnips"]

function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
     if pumvisible()
        return "\<C-n>"
     else
        call UltiSnips#JumpForwards()
          if g:ulti_jump_forwards_res == 0
             return "\<TAB>"
          endif
      endif
   endif
   return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

"Expand snippet or return
let g:ulti_expand_res = 1
function! Ulti_ExpandOrEnter()
   call UltiSnips#ExpandSnippet()
   if g:ulti_expand_res
	   return ''
   else
      return "\<return>"
endfunction
"Set <space> as primary trigger
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>
"*************************************************************************************************

"airline配置*******************************************************************************
let g:airline_theme="dark"
"这个是安装字体后 必须设置此项"
let g:airline_powerline_fonts = 1
"设置切换Buffer快捷键"
"nnoremap <C-tab> :bn<CR>
"nnoremap <C-s-tab> :bp<CR>
"关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
"设置consolas字体"前面已经设置过
set guifont=Consolas\ for\ Powerline\ FixedD:h11
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
set laststatus=2
set noshowmode
set t_Co=256
"**************************************************************************************

"NERDtree配置××××××××××××***********************************************************
map <C-b> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2 "选中root即设置为当前目录
let NERDTreeQuitOnOpen=1 "打开文件时关闭树
let NERDTreeShowBookmarks=1 "显示书签
let NERDTreeMinimalUI=1 "不显示帮助面板
let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=28
let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup = 1
"***********************************************************************************

"sdcv设置×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××
function! Mydict()
   let expl=system('sdcv -n ' .
      \ expand("<cword>"))
   windo if
      \ expand("%")=="diCt-tmp" |
      \ q!|endif
   28vsp diCt-tmp
   setlocal buftype=nofile bufhidden=hide noswapfile
   1s/^/\=expl/
   1
endfunction
nmap F :call Mydict()<CR>

nmap <C-k> : !sdcv <C-R>=expand("<cword>")<CR><CR>
"×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××

"vim-latex配置************************************************************************
" 使grep总是生成文件名
set grepprg=grep\ -nH\ $*
" vim默认把空的tex文件设为plaintex而不是tex，导致latex-suite不被加载
let g:tex_flavor='latex'
set iskeyword+=:
autocmd BufEnter *.tex set sw=2
"*************************************************************************************

"关于F系列的快捷键设置***********************************************************
"f2换行开关
nnoremap <F2> :set wrap! wrap?<cr>

"出现多余的空白字符让Vim标示出来，使其很容易发现并删除
nnoremap <F3> :call WhiteSpaceE()<CR>
func WhiteSpaceE()
	highlight Whitespace ctermbg=red guibg=red
	match Whitespace /\s\+$/
endfunc

"快捷键<F4>忽略警告编译<F5>进行编译<F6>进行调试
noremap <F4> :call CompileRunGccw()<CR>
function CompileRunGccw()
	exec "w"
	if &filetype=='c'
		exec "!gcc -w % -o %<"
	   exec "! ./%<"
	elseif &filetype=='cpp'
		exec "!g++ -std=c++11 -w % -o %<"
		exec "! ./%<"
	elseif &filetype=='php'
      let cwd = strpart(getcwd(), 13) . "/" . expand("%")
		exec "!google-chrome 127.0.0.1".cwd
	elseif &filetype=='html'
		exec "!google-chrome %"
	elseif &filetype=='python'
		exec "!python3 %"
	endif
endfunction

noremap <F5> :call CompileRunGccW()<CR>
function CompileRunGccW()
	exec "w"
	if &filetype=='c'
		set makeprg=gcc\ -Wall\ %\ -o\ %<
		make
		cw
	   exec "! ./%<"
	elseif &filetype=='cpp'
		set makeprg=g++\ -std=c++11\ -Wall\ %\ -o\ %<
		make
		cw
		exec "! ./%<"
	elseif &filetype=='java'
		exec "!javac %"
		exec "!java %<"
	elseif &filetype=='sh'
	    :!./%
	endif
endfunction

noremap <F6> :call Rungdb()<CR>
function! Rungdb()
    exec "w"
	 if &filetype=='c'
    	 exec "!gcc % -g -o %<"
    	 exec "!gdb ./%<"
	 elseif &filetype=='cpp'
		 exec "!g++ % -g -o %<"
	 	exec "!gdb ./%<"
	endif
endfunction
"***************************************************************************************"
