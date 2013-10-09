" ------------------------------
" .vimrc crmaxx <crmaxx@gmail.com>
" ------------------------------
" Init
" {{{
  runtime bundle/vim-pathogen/autoload/pathogen.vim

  call pathogen#infect()
  call pathogen#helptags()

  set nocompatible
  syntax on
  set encoding=utf-8
" }}}

" Settings
" {{{
"   Basic {{{
      filetype plugin indent on

      set backspace=indent,eol,start " make backspace a more flexible
      let loaded_matchparen=1 " match paranthesis
      set nobackup " no create backup
      set nowritebackup
      "set backupdir=~/.vim/tmp/backup " where to put backup files
      set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
      "set directory=~/.vim/tmp/swap " directory to place swap files in
      "set undodir=~/.vim/tmp/undo " directory to place undo files in
      "set undofile " create undo file
      set mouse=a " use mouse for everything
      set equalalways " split windows equally
      set splitright splitbelow " new splits right from current and other below
      set autoread " supress warnings
      set wildmenu " wildmenu when autocomplting option
      set wildmode=full " complete the full match, this is default behaviour
      set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png " there files will be ignored when completing in wild menu
      set clipboard+=unnamed,unnamedplus,autoselect " share clipboard
      set history=1000
      set tags=.tags;/ " save tags generated for files in current working directory
      set ttyfast " i got a fast terminal!
      set ttimeoutlen=50  " Make Esc work faster
      set autowrite     " Automatically :write before running commands
    " }}}

    " UI {{{
      set background=dark
      if has('gui_running')
        let base16colorspace=256
        colorscheme base16-tomorrow
      else
        let g:solarized_termcolors=256  " Access colors present in 256 colorspace
        colorscheme solarized
      endif

      set tabstop=2 " when there's tab, it should be indented by 4 spaces
      set shiftwidth=2 " Number of spaces to use for each step of (auto)indent
      set shiftround " round the indent to shiftwidth (when at 3 spaces, and I hit > go to 4, not 5)
      set autoindent
      set infercase " case inferred by default, used for autocompletition in insert mode and so on..
      set t_Co=256

      set ignorecase " ignore case when searching
      set hlsearch   " highlight search matches
      set incsearch " search as you type
      set gdefault  " global matching is default
      set smartcase " use smartcase, when search query starts with Uppercase, turn off case insensitive search

      "set list " show trailing characters
      "set listchars=tab:▸\ ,trail:¬,extends:❯,precedes:❮,nbsp:~ " it show ¬ character when as you type, fill free to comment out set list

      set number " set line numbering
      set numberwidth=5
      set novisualbell " do not blink
      set lazyredraw " get faster, redraw only when it's needed
      set nostartofline
      set linespace=0
      set showcmd " show the command being typed
      set ruler " always show current position
      set scrolloff=5 " Keep 5 lines (top/bottom) for scop
      set sidescrolloff=10 " Keep 10 lines at the size
      set showmode " show the current mode (Insert, Visual..)

      set expandtab " no real tabs!
      set wrap " wrap lines, we dont want long lines
      set showbreak=↪ " character show when wrapping line

      set foldenable " folding text into clusters (+) according to  {{{ }}} or comments for example.
      set foldmethod=manual " default options, we create fold manually.
      set showmatch " when use insert bracket, briefly jump to matching one (i like it, but i might be annoying)

      set infercase " case inferred by default
      set shiftround " round the indent to shiftwidth (when at 3 spaces, and I hit > go to 4, not 5)
      set shiftwidth=2 " auto-indent amount when using >> <<
      set softtabstop=2 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
      set tabstop=2 " real tabs should be 4, and they will show with set list on

      set completeopt=longest,menu,preview
      " }}}

    " Advanced macros
    " {{{

      " Cursor highlight
      ":hi CursorLine   cterm=NONE ctermbg=8
      ":hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white
      :nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
      set cursorline

      "improve autocomplete menu color
      highlight Pmenu ctermbg=238
      " }}}
      "

      " Removes trailing spaces
      function! TrimWhiteSpace()
        if !&binary && &filetype != 'diff'
          normal mz
          normal Hmy
          %s/^\s\+$//e
          normal 'yz<CR>
          normal `z
        endif
      endfunction

      " Filter and trim whitespaces
      autocmd FileWritePre * :call TrimWhiteSpace()
      autocmd FileAppendPre * :call TrimWhiteSpace()
      autocmd FilterWritePre * :call TrimWhiteSpace()
      autocmd BufWritePre * :call TrimWhiteSpace()

      " Use relative numbering in insert mode
      "autocmd InsertEnter * :set relativenumber
      "autocmd InsertLeave * :set number

    "}}}

    " Binding
    " {{{
    " Map leader
      let mapleader = ',' " used for lot of stuff, feel free to change it.

      " Open all folds
      nnoremap <space> :%foldopen<CR>

      " convenient window switching
      map <C-h> <C-w>j
      map <C-j> <C-w>k
      map <C-k> <C-w>i
      map <C-l> <C-w>l

      " Emacs-like keybindings
      cnoremap <C-a> <Home>
      cnoremap <C-e> <End>
      inoremap <C-a> <Esc>^i
      inoremap <C-e> <Esc>A

      " Save like a pro (CTRL+s)
      nnoremap <C-s> :w<CR>

      " Quit like a pro
      nnoremap <C-M-q> :Kwbd<CR>
      nnoremap <leader>q :q<CR>

      " this key combination gets rid of the search highlights.
      nmap <leader><space> :noh<CR>

      " open vertical split and switch to it
      nnoremap <leader>v <C-w>v<C-w>l

      " open horizontal  split and switch to it
      nnoremap <leader>h :split<CR>

      " tabs - moving around, (CTRL+n to new tab)
      map <C-t> :tabnew<CR>
      map <C-M-n> :tabedit %<CR>
      map <M-Right> :tabnext<cr>
      map <M-Left> :tabprevious<cr>

      " buffers - moving around
      map <A-x-Left> :bprevious<CR>
      map <A-x-Right> :bNext<CR>

      " Write and quit current buffer
      nnoremap <C-M-w> :wq<CR>

      " run ctags silently
      map <Leader>t :silent! !ctags -R . &<CR>
      " Regenerate tags
      map <Leader>rt :!ctags --extra=+f --languages=-javascript --exclude=.git --exclude=log -R * `rvm gemdir`/gems/* `rvm gemdir`/bundler/gems/*<CR><C-M>

      " copy from clipboard with ease (<leader>p => paste what you copied by CTRL+c in clipboard)
      nnoremap <Leader>p "+p
      nnoremap <Leader>y "+yy

      " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
      nnoremap <Leader>a :Ag

      " reformat whole file
      nnoremap <Leader>= ggVG=

      " use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
      " (it will prompt for sudo password when writing)
      cmap w!! %!sudo tee > /dev/null %

      " upper/lower word
      nmap <Leader>u mQviwU`Q
      nmap <Leader>l mQviwu`Q

      " upper/lower first char of word
      nmap <Leader>wu mQgewvU`Q
      nmap <Leader>wl mQgewvu`Q

      " cd to the directory containing the file in the buffer
      nmap <Silent> <Leader>cd :lcd %:h<CR>

      " Create the directory containing the file in the buffer
      nmap <Silent> <Leader>md :!mkdir -p %:p:h<CR
      " Swap two words
      nmap <Silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

      " Map the arrow keys to be based on display lines, not physical lines
      map <Down> gj
      map <Up> gk

      " Toggle hlsearch with <leader>hs
      nmap <Leader>sh :set hlsearch! hlsearch?<CR>

   " }}}

    " Filetypes
    " {{{

      " HTML, XML {{{
      augroup FTHtml
        au!
        autocmd FileType html,xhtml,wml,cf      setlocal ai et sta sw=2 sts=2 " set indent size and stuff
        autocmd FileType xml,xsd,xslt           setlocal ai et sta sw=2 sts=2 ts=2
        autocmd FileType html setlocal iskeyword+=~

      augroup END

      " CSS, SCSS {{{
      augroup FTCss
        au!
        au BufRead,BufNewFile *.scss.erb set ft=scss  " when erb-ing sccs, use scss code highlighting
        autocmd FileType css,scss  silent! setlocal omnifunc=csscomplete#CompleteCSS " autocomplete function
        autocmd FileType css,scss  setlocal iskeyword+=-
        autocmd FileType css,scss   setlocal ai et sta sw=2 sts=2
      augroup END
      " }}}

      " }}}
      " Ruby {{{
      augroup FTRuby
        au!
        autocmd FileType eruby,yaml,ruby        setlocal ai et sta sw=2 sts=2
        autocmd BufNewFile,BufRead *.html.erb   set filetype=eruby.html  " load html snippets along with erb
        autocmd FileType ruby,eruby             let g:rubycomplete_rails = 1
        autocmd FileType ruby,eruby             let g:rubycomplete_classes_in_global=1
        autocmd FileType ruby,eruby             let g:rubycomplete_buffer_loading = 1
      augroup END
      " }}}

      " Coffescript
      " {{{
      au BufNewFile,BufReadPost *.coffee setl sw=2 expandtab
      "}}}

      augroup C
        au!
        ""autocmd FileType c,cpp,h,hpp     colorscheme molokai
      augroup END

      " Git {{{
      augroup FTGit
        au!
        autocmd FileType git,gitcommit setlocal foldmethod=syntax foldlevel=1
        autocmd FileType gitcommit setlocal spell
      augroup END
      " }}}


    " }}}

    " Plugins
    " {{{

      " CTags
      " {{{
      " Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
      let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"
      " }}}

      " Html5 plugin
      " {{{
      let g:html5_event_handler_attributes_complete = 0
      let g:html5_rdfa_attributes_complete = 0
      let g:html5_microdata_attributes_complete = 0
      let g:html5_aria_attributes_complete = 0
      " }}}

      " vim-javascript
      " {{{
      let g:html_indent_inctags = "html,body,head,tbody"
      let g:html_indent_script1 = "inc"
      let g:html_indent_style1 = "inc"
      " }}}
      " vim-gutter
      " {{{
      let g:gitgutter_highlight_lines = 1
      let g:gitgutter_realtime = 1
      let g:gitgutter_eager = 1
      " }}}
      " Statusline (vim-airline)
      " {{{
      set laststatus=2
      let g:airline_powerline_fonts = 1

      let g:airline_left_sep = '⮀'
      let g:airline_left_alt_sep = '⮁'
      let g:airline_right_sep = '⮂'
      let g:airline_right_alt_sep = '⮃'
      let g:airline_branch_prefix = '⭠ '
      let g:airline_readonly_symbol = '⭤'
      let g:airline_linecolumn_prefix = '⭡'

      let g:airline#extensions#tabline#enabled = 1
      let g:airline#extensions#tabline#left_sep = '⮀'
      let g:airline#extensions#tabline#left_alt_sep = '⮁'
      " }}}

      " CtrlP
      " {{{
      set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
      nnoremap <F3> :CtrlP<CR>
      nnoremap <F4> :CtrlPBuffer<CR>
      nnoremap <F2> :CtrlPDir<CR>
      " use ag as search engine
      let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

      " ag is fast enough that CtrlP doesn't need to cache
      let g:ctrlp_use_caching = 0

      let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$'
            \ }

      map <leader>f :CtrlP<cr>
      map <leader>b :CtrlPMRU<cr>
      map <leader>cv :CtrlP app/views<cr>
      map <leader>cc :CtrlP app/controllers<cr>
      map <leader>cm :CtrlP app/models<cr>
      " }}}

      " Gist
      " {{{
      let g:gist_clip_command = 'pbcopy'
      let g:gist_detect_filetype = 1
      let g:gist_open_browser_after_post = 1
      let g:gist_browser_command = 'open %URL% &' " NOTE: use your browser!
      let g:gist_show_privates = 1
      " }}}

      " supertab {{{
      let g:SuperTabDefaultCompletionType = 'context'
      let g:SuperTabContextDefaultCompletionType = '<c-n>'
      " }}}

      " syntastic {{{
      nnoremap <C-E> :SyntasticCheck<CR>
      let g:syntastic_auto_loc_list=1
      let g:syntastic_enable_signs=1
      let g:synastic_quiet_warnings=1

      " }}}

      " Rubycomplete {{{
      let g:rubycomplete_rails=1
      let g:rubycomplete_classes_in_global=1
      let g:rubycomplete_buffer_loading=1
      let g:rubycomplete_include_object=1
      let g:rubycomplete_include_objectspace=1
      " }}}

      " Gundo {{{
      nnoremap <leader>gu :GundoToggle<CR>
      " }}}

      " Fugitive {{{
      nnoremap <leader>gs :Gstatus<cr>
      nnoremap <leader>gc :Gcommit
      nnoremap <leader>gd :Gdiff<cr>
      " }}}

      " NERDTree {{{
      nnoremap <F1> :NERDTreeToggle<CR>
      let g:NERDTreeMinimalUI=1
      let g:NERDTreeDirArrows=1
      let g:NERTreeHighlightCursorLine=1
      let g:NERDTreeChDirMode=2
      "}}}
      "
      " NerdTree Tabs {{{
      nnoremap <c-F1> :NERDTreeTabsToggle<CR>
      " }}}

      " Rails
      " {{{
      nnoremap <C-p> :completefunc()<CR>
      nnoremap <F6> :Rails
      nnoremap <F7> :Rgenerate
      nnoremap <F8> :Rake
      nnoremap <F9> :Rinitializer
      nnoremap <F10> :Rmodel
      nnoremap <F11> :Rview
      nnoremap <F12> :Rcontroller

      nnoremap <leader>ra :Rails
      nnoremap <leader>rg :Rgenerate
      nnoremap <leader>rr :Rake
      nnoremap <leader>ri :Rinitializer
      " routes leads to empty initializer path
      nnoremap <leader>ro :Rinitializer<CR>
      nnoremap <leader>rv :Rview
      nnoremap <leader>rc :Rcontroller
      nnoremap <leader>rm :Rmodel

      " set rails status line
      let g:rails_statusline = 1
      " }}}

    " }}}

    " GUI setting
    " {{{
    if has('gui_running')
      set guifont=PragmataPro:h14
      set guioptions-=m  "remove menu bar
      set guioptions-=T  "remove toolbar
      set guioptions-=r  "remove right-hand scroll bar
      set guioptions-=l
      set guioptions-=h
      set guioptions-=b
      set guioptions-=R
      set guioptions-=L
      set showtabline=2   " show tabs in gvim, not vim
      set guitablabel=%t  " show simple filname as tabname

      " Bindings
      " {{{
      nnoremap <c-o> :browse tabnew :pwd<CR>
      nnoremap <C-M-s> :browse saveas :pwd<CR>
      nnoremap <C-M-f> :set guifont=*<CR>

      " Map Alt-# to switch tabs
      map  <M-0> 0gt
      imap <M-0> <Esc>0gt
      map  <M-1> 1gt
      imap <M-1> <Esc>1gt
      map  <M-2> 2gt
      imap <M-2> <Esc>2gt
      map  <M-3> 3gt
      imap <M-3> <Esc>3gt
      map  <M-4> 4gt
      imap <M-4> <Esc>4gt
      map  <M-5> 5gt
      imap <M-5> <Esc>5gt
      map  <M-6> 6gt
      imap <M-6> <Esc>6gt
      map  <M-7> 7gt
      imap <M-7> <Esc>7gt
      map  <M-8> 8gt
      imap <M-8> <Esc>8gt
      map  <M-9> 9gt
      imap <M-9> <Esc>9gt
    " }}}


      "
      " }}}
    endif
    " }}}
" }}}

" Misc
" {{{
  "here is a more exotic version of my original Kwbd script
  "delete the buffer; keep windows; create a scratch buffer if no buffers left
  function s:Kwbd(kwbdStage)
    if(a:kwbdStage == 1)
      if(!buflisted(winbufnr(0)))
        bd!
        return
      endif
      let s:kwbdBufNum = bufnr("%")
      let s:kwbdWinNum = winnr()
      windo call s:Kwbd(2)
      execute s:kwbdWinNum . 'wincmd w'
      let s:buflistedLeft = 0
      let s:bufFinalJump = 0
      let l:nBufs = bufnr("$")
      let l:i = 1
      while(l:i <= l:nBufs)
        if(l:i != s:kwbdBufNum)
          if(buflisted(l:i))
            let s:buflistedLeft = s:buflistedLeft + 1
          else
            if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
              let s:bufFinalJump = l:i
            endif
          endif
        endif
        let l:i = l:i + 1
      endwhile
      if(!s:buflistedLeft)
        if(s:bufFinalJump)
          windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
        else
          enew
          let l:newBuf = bufnr("%")
          windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
        endif
        execute s:kwbdWinNum . 'wincmd w'
      endif
      if(buflisted(s:kwbdBufNum) || s:kwbdBufNum == bufnr("%"))
        execute "bd! " . s:kwbdBufNum
      endif
      if(!s:buflistedLeft)
        set buflisted
        set bufhidden=delete
        set buftype=
        setlocal noswapfile
      endif
    else
      if(bufnr("%") == s:kwbdBufNum)
        let prevbufvar = bufnr("#")
        if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:kwbdBufNum)
          b #
        else
          bn
        endif
      endif
    endif
  endfunction

  command! Kwbd call s:Kwbd(1)
  nnoremap <silent> <Plug>Kwbd :<C-u>Kwbd<CR>

" }}}
