"不要闪烁 
"set novisualbell

"置粘贴模式，这样粘贴过来的程序代码就不会错位了。 
"set paste

"如果是新建文件，则将光标定位到末尾
"autocmd BufNewFile * normal G 

"对c语言的批量注释*****************************************************
nmap <C-C> <Esc> :Setcomment<CR>
imap <C-C> <Esc> :Setcomment<CR>
vmap <C-C> <Esc> :SetcommentV<CR>
command! -nargs=0 Setcomment call s:SET_COMMENT()
command! -nargs=0 SetcommentV call s:SET_COMMENTV()

"非视图模式下所调用的函数
function! s:SET_COMMENT()
   let lindex=line(".")
   let str=getline(lindex)
	"查看当前是否为注释行
   let CommentMsg=s:IsComment(str)
   call s:SET_COMMENTV_LINE(lindex,CommentMsg[1],CommentMsg[0])
endfunction

"视图模式下所调用的函数
function! s:SET_COMMENTV()
   let lbeginindex=line("'<") "得到视图中的第一行的行数
   let lendindex=line("'>") "得到视图中的最后一行的行数
   let str=getline(lbeginindex) "查看当前是否为注释行
   let CommentMsg=s:IsComment(str)
"为各行设置
   let i=lbeginindex
   while i<=lendindex
      call s:SET_COMMENTV_LINE(i,CommentMsg[1],CommentMsg[0])
      let i=i+1
   endwhile
endfunction

"index:在第几行 pos:在第几列 comment_flag: 0:添加注释符 1:删除注释符
function! s:SET_COMMENTV_LINE(index,pos,comment_flag)
   let poscur = [0,0,0,0]
	let poscur[1]=a:index
	let poscur[2]=a:pos+1
	call setpos(".",poscur) "设置光标的位置
	if a:comment_flag==0
"插入//
   	exec "normal! i//"
	else
"删除//
   	exec "normal! xx"
	endif
endfunction

"查看当前是否为注释行并返回相关信息
"str:一行代码
function! s:IsComment(str)
   let ret=[0,0] "第一项为是否为注释行（0,1）,第二项为要处理的列，
   let i=0
   let strlen=len(a:str)
   while i<strlen
   "空格和tab允许为"//"的前缀
   	if !(a:str[i]==' ' || a:str[i] == '  ')
	   	let ret[1]=i
      	if a:str[i]=='/' && a:str[i+1]=='/'
	      	let ret[0]=1
      	else
         	let ret[0]=0
      	endif
      	return ret
   	endif
   	let i=i+1
   endwhile
   return [0,0]  "空串处理
endfunction
"**********************************************************************

"对于脚本语言的补全******************************************************************
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"**********************************************************************************

"语法报错***************************************************************************
"let g:syntastic_auto_jump=1
"let g:syntastic_check_on_open = 1
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_loc_list_height = 6
"let g:syntastic_check_on_wq=0
"let g:syntastic_python_checkers=['pyflakes']
"let g:syntastic_enable_highlighting = 0
"let g:syntastic_cpp_include_dirs = ['/usr/include/']
"let g:syntastic_cpp_remove_include_errors = 1
"let g:syntastic_cpp_check_header = 1
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"let g:syntastic_enable_balloons = 1
"**************************************************************************************

"f3语法开关，关闭语法可以加快大文件的展示
nnoremap <F3> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

nnoremap <leader>g :YcmCompleter GoToDefinition<CR>
