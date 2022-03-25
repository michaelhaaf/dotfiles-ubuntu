set nocompatible

" default settings for main wiki; here for clarification
let vimwiki_main = {}
let vimwiki_main.path = '~/vimwiki/'
let vimwiki_main.path_html = '~/vimwiki_html/'
let vimwiki_main.syntax = 'default'
let vimwiki_main.ext = '.wiki'
let vimwiki_main.name = 'MainWiki'
let vimwiki_main.autotoc = 1

" all new wikis
let vimwiki_school = {}
let vimwiki_school.path = '~/vimwiki/school/'
let vimwiki_school.path_html = '~/vimwiki_html/school/'
let vimwiki_school.name = 'School'
let vimwiki_school.autotoc = 1


let vimwiki_work = {}
let vimwiki_work.path = '~/vimwiki/work/'
let vimwiki_work.path_html = '~/vimwiki_html/work/'
let vimwiki_work.name = 'Work'
let vimwiki_work.autotoc = 1


let vimwiki_fightback = {}
let vimwiki_fightback.path = '~/vimwiki/fightback/'
let vimwiki_fightback.path_html = '~/vimwiki_html/fightback/'
let vimwiki_fightback.name = 'Fightback'
let vimwiki_fightback.autotoc = 1


let vimwiki_misc = {}
let vimwiki_misc.path = '~/vimwiki/misc/'
let vimwiki_misc.path_html = '~/vimwiki_html/misc/'
let vimwiki_misc.name = 'Misc'
let vimwiki_misc.autotoc = 1

let g:vimwiki_list = [vimwiki_main, vimwiki_school, vimwiki_work, vimwiki_fightback, vimwiki_misc]

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end
