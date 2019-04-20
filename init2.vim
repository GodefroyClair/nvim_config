language en_US 

call plug#begin('~/.local/share/nvim/plugged')

" LanguageClient LSP plugin
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Minimal LSP configuration for JavaScript
let g:LanguageClient_serverCommands = {}
if executable('javascript-typescript-stdio')
  echo 'j-t-s'
  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
  " let g:LanguageClient_serverCommands = {
  "   \ 'javascript': ['flow-language-server', '--stdio'],
  "   \ }
  " Use LanguageServer for omnifunc completion
  autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
  echo 'end'
else
  echo "javascript-typescript-stdio not installed!\n"
  :cq
endif
let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_loggingFile = '~/.config/nvim/log/languageClient.log'
