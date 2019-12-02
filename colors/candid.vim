" Init {{{
scriptencoding utf-8

set background=dark
hi clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'candid'

" Highlighting function (inspiration from https://github.com/chriskempson/base16-vim)
fun! <sid>hi(group, fg, bg, attr, sp)
  if !empty(a:fg)
    exec "hi " . a:group . " guifg=" . a:fg.gui . " ctermfg=" .  a:fg.cterm256
  endif
  if !empty(a:bg)
    exec "hi " . a:group . " guibg=" . a:bg.gui . " ctermbg=" .  a:bg.cterm256
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if !empty(a:sp)
    exec "hi " . a:group . " guisp=" . a:sp.gui
endif
endfun
"}}}

" colors definition {{{

let s:pale_red = {'gui': '#ff7570', 'cterm256': '168'}
let s:sea_serpent = {'gui': '#85d6ff', 'cterm256': '180'}
let s:mustard = {'gui': '#ffd454', 'cterm256': '222'}
let s:violetish = {'gui': '#c19eff', 'cterm256': '180'}
let s:venom_green = {'gui': '#9ee349', 'cterm256': '79'}
let s:almost_white = {'gui': '#fafafa', 'cterm256': '254'}
let s:greyish = {'gui': '#818e8e', 'cterm256': '240'}
let s:pale_grey = { 'gui': '#969696', 'cterm256': '224' }
let s:pale_black = { 'gui': '#3f4554', 'cterm256': '234' }
let s:raisin_black = {'gui': '#2f343f', 'cterm256': '232'}
let s:none = {'gui': 'NONE', 'cterm256': 'NONE'}
let s:visual_black = { 'gui': 'NONE', 'cterm256': 'NONE'}
"}}}

"--------------------
" Syntax Definitions
"--------------------
" <sid>hi(GROUP, FOREGROUND, BACKGROUND, ATTRIBUTE, SPECIAL)
call <sid>hi('Normal', s:almost_white, s:raisin_black, 'none', {})

" UI {{{
call <sid>hi('Cursor', s:none, s:none, 'inverse', {})
hi link lCursor Cursor
hi link CursorIM Cursor
call <sid>hi('CursorLine', s:none, s:pale_black, 'none', {})
call <sid>hi('EndOfBuffer', s:greyish, s:none, 'none', {})
call <sid>hi('Conceal', s:sea_serpent, s:none, 'none', {})
call <sid>hi('CursorColumn', s:none, s:pale_black, 'none', {})
call <sid>hi('ColorColumn', s:none, s:greyish, 'none', {})
call <sid>hi('FoldColumn', s:greyish, s:raisin_black, 'none', {})
call <sid>hi('SignColumn', s:none, s:raisin_black, 'none', {})
call <sid>hi('VertSplit', s:greyish, s:greyish, 'none', {})
call <sid>hi('LineNr', s:greyish, s:raisin_black, 'none', {})
call <sid>hi('CursorLineNr', s:almost_white, s:raisin_black, 'none', {})

call <sid>hi('DiffAdd', s:venom_green, s:none, 'inverse', {})
call <sid>hi('DiffChange', s:mustard, s:none, 'inverse', {})
call <sid>hi('DiffDelete', s:pale_red, s:none, 'inverse', {})
call <sid>hi('DiffText', s:sea_serpent, s:none, 'inverse', {})
" This links help syntax highlight in diff files
hi link diffRemoved DiffDelete
hi link diffChanged DiffChange
hi link diffAdded DiffAdd

call <sid>hi('ErrorMsg', s:pale_red, s:raisin_black, 'bold', {})
call <sid>hi('ModeMsg', s:mustard, s:none, 'bold', {})
call <sid>hi('MoreMsg', s:sea_serpent, s:none, 'bold', {})
call <sid>hi('WarningMsg', s:mustard, s:none, 'italic', {})
call <sid>hi('Noise', s:greyish, s:none, 'none', {})
call <sid>hi('NonText', s:mustard, s:none, 'none', {})
call <sid>hi('Folded', s:greyish, s:none, 'none', {})
call <sid>hi('IncSearch', s:mustard, s:raisin_black, 'reverse', {})
call <sid>hi('Search', s:mustard, s:raisin_black, 'reverse', {})

call <sid>hi('Pmenu', s:almost_white, s:pale_black, 'none', {})
call <sid>hi('PmenuSel', s:raisin_black, s:venom_green, 'none', {})

call <sid>hi('Question', s:almost_white, s:raisin_black, 'bold', {})
call <sid>hi('MatchParen', s:sea_serpent, s:none, 'bold', {})
call <sid>hi('Directory', s:mustard, s:raisin_black, 'bold', {})
call <sid>hi('QuickFixLine', s:raisin_black, s:mustard, 'none', {})

call <sid>hi('SpecialKey', s:violetish, s:none, 'none', {})
call <sid>hi('SpellBad', s:pale_red, s:none, 'undercurl', s:pale_red)
call <sid>hi('SpellCap', s:greyish, s:none, 'undercurl', s:pale_red)
call <sid>hi('SpellLocal', s:mustard, s:none, 'undercurl', {})
call <sid>hi('SpellRare', s:venom_green, s:none, 'undercurl', {})

call <sid>hi('StatusLine', s:almost_white, s:raisin_black, 'none', {})
call <sid>hi('StatusLineNC', s:raisin_black, s:violetish, 'none', {})
hi link StatusLineTerm StatusLine
hi link StatusLineTermNC StatusLineNC

call <sid>hi('TabLine', s:almost_white, s:raisin_black, 'none', {})
hi link TabLineFill TabLine
call <sid>hi('TabLineSel', s:mustard, s:raisin_black, 'none', {})

call <sid>hi('Title', s:almost_white, s:none, 'none', {})
call <sid>hi('Visual', s:raisin_black, s:sea_serpent, 'none', {})
hi link VisualNOS Visual
call <sid>hi('TabLine', s:almost_white, s:raisin_black, 'none', {})
call <sid>hi('WildMenu', s:raisin_black, s:almost_white, 'bold', {})
"}}}

"----------------------------------------------------
" Syntax groups and naming convenions
" http://vimdoc.sourceforge.net/htmldoc/syntax.html
"----------------------------------------------------
" {{{
call <sid>hi('Comment', s:pale_grey, s:none, 'italic', {})

call <sid>hi('Constant', s:violetish, s:none, 'none', {})
call <sid>hi('String', s:mustard, s:none, 'none', {})
call <sid>hi('Character', s:sea_serpent, s:none, 'none', {})
hi link Character Character
hi link Number Character
hi link Boolean Constant
hi link Float Number

call <sid>hi('Identifier', s:violetish, s:none, 'none', {})
call <sid>hi('Function', s:venom_green, s:none, 'none', {})

call <sid>hi('Statement', s:pale_red, s:none, 'none', {})
hi link Conditional Statement

call <sid>hi('PreProc', s:pale_red, s:none, 'none', {})

call <sid>hi('Type', s:sea_serpent, s:none, 'none', {})
call <sid>hi('StorageClass', s:pale_red, s:none, 'none', {})
call <sid>hi('Structure', s:pale_red, s:none, 'none', {})

call <sid>hi('Special', s:violetish, s:none, 'none', {})
call <sid>hi('Underlined', s:none, s:none, 'underline', {})
call <sid>hi('Ignore', s:none, s:none, 'none', {})
call <sid>hi('Error', s:pale_red, s:raisin_black, 'undercurl', {})
call <sid>hi('Todo', s:venom_green, s:none, 'italic', {})
"}}}

"--------------------------
" Language specific syntax
"--------------------------

" HTML {{{
call <sid>hi('htmlTag', s:greyish, s:none, 'none', {})
hi link htmlEndTag htmlTag
call <sid>hi('htmlTagName', s:violetish, s:none, 'none', {})
call <sid>hi('htmlArg', s:sea_serpent, s:none, 'none', {})
call <sid>hi('htmlTitle', s:almost_white, s:none, 'none', {})
call <sid>hi('htmlLink', s:venom_green, s:none, 'none', {})
call <sid>hi('htmlSpecialChar', s:mustard, s:none, 'none', {})
call <sid>hi('htmlSpecialTagName', s:pale_red, s:none, 'none', {})

"}}}

" XML {{{
call <sid>hi('xmlRegion', s:almost_white, s:none, 'none', {})
hi link xmlTag xmlRegion
call <sid>hi('xmlTagName', s:venom_green, s:none, 'none', {})
call <sid>hi('xmlEndTag', s:greyish, s:none, 'none', {})
" }}}

" Css {{{
call <sid>hi('cssAttrComma', s:greyish, s:none, 'none', {})
call <sid>hi('cssAttributeSelector', s:venom_green, s:none, 'none', {})
call <sid>hi('cssBraces', s:greyish, s:none, 'none', {})
call <sid>hi('cssClassName', s:violetish, s:none, 'none', {})
call <sid>hi('cssDefinition', s:violetish, s:none, 'none', {})
call <sid>hi('cssFontAttr', s:mustard, s:none, 'none', {})
call <sid>hi('cssFontDescriptor', s:venom_green, s:none, 'none', {})
call <sid>hi('cssFunctionName', s:sea_serpent, s:none, 'none', {})
call <sid>hi('cssIdentifier', s:sea_serpent, s:none, 'none', {})
call <sid>hi('cssImportant', s:pale_red, s:none, 'none', {})
call <sid>hi('cssInclude', s:almost_white, s:none, 'none', {})
call <sid>hi('cssIncludeKeyword', s:pale_red, s:none, 'none', {})
call <sid>hi('cssMediaType', s:sea_serpent, s:none, 'none', {})
call <sid>hi('cssProp', s:almost_white, s:none, 'none', {})
call <sid>hi('cssPseudoClassId', s:mustard, s:none, 'none', {})
call <sid>hi('cssTagName', s:pale_red, s:none, 'none', {})
call <sid>hi('cssSelectorOp', s:greyish, s:none, 'none', {})
call <sid>hi('cssSelectorOp2', s:greyish, s:none, 'none', {})
"}}}

" Git {{{
call <sid>hi('gitcommitComment', s:pale_grey, s:none, 'none', {})
call <sid>hi('gitcommitUnmerged', s:mustard, s:none, 'none', {})
call <sid>hi('gitcommitBranch', s:violetish, s:none, 'none', {})
call <sid>hi('gitcommitSelectedType', s:venom_green, s:none, 'none', {})
call <sid>hi('gitcommitDiscardedType', s:pale_red, s:none, 'none', {})
call <sid>hi('gitcommitUntrackedFile', s:sea_serpent, s:none, 'none', {})
call <sid>hi('gitcommitDiscardedFile', s:pale_red, s:none, 'none', {})
call <sid>hi('gitcommitSelectedFile', s:venom_green, s:none, 'none', {})
call <sid>hi('gitcommitUnmergedFile', s:mustard, s:none, 'none', {})
call <sid>hi('gitcommitSummary', s:almost_white, s:none, 'none', {})
call <sid>hi('gitcommitOverflow', s:pale_red, s:none, 'none', {})
hi link gitcommitNoBranch gitcommitBranch
hi link gitcommitUntracked gitcommitComment
hi link gitcommitDiscarded gitcommitComment
hi link gitcommitSelected gitcommitComment
hi link gitcommitDiscardedArrow gitcommitDiscardedFile
hi link gitcommitSelectedArrow gitcommitSelectedFile
hi link gitcommitUnmergedArrow gitcommitUnmergedFile

"}}}

" vim-signify {{{
call <sid>hi('SignifySignAdd', s:venom_green, s:none, 'none', {})
call <sid>hi('SignifySignChange', s:mustard, s:none, 'none', {})
call <sid>hi('SignifySignDelete', s:pale_red, s:none, 'none', {})

"}}}

" Javascript {{{
" https://github.com/pangloss/vim-javascript
call <sid>hi('jsImport', s:pale_red, s:none, 'none', {})
hi link jsExport jsImport
hi link jsFrom jsImport
hi link jsExportDefault jsExport
hi link jsArrowFunction jsImport
call <sid>hi('jsThis', s:pale_red, s:none, 'none', {})
" https://github.com/othree/yajs.vim
hi link javascriptImport jsImport
hi link javascriptExport jsExport
call <sid>hi('javascriptMethod', s:venom_green, s:none, 'none', {})
hi link javascriptArrowFunc jsArrowFunction
"}}}

" JSX {{{
" https://github.com/MaxMEllon/vim-jsx-pretty
call <sid>hi('jsxTagName', s:violetish, s:none, 'none', {})
call <sid>hi('jsxPunct', s:greyish, s:none, 'none', {})
call <sid>hi('jsClosePunct', s:greyish, s:none, 'none', {})
call <sid>hi('jsxComponentName', s:pale_red, s:none, 'none', {})
call <sid>hi('jsxAttrib', s:sea_serpent, s:none, 'none', {})
hi link jsxCloseString jsClosePunct

"}}}

" Golang {{{
call <sid>hi('goConst', s:sea_serpent, s:none, 'none', {})
" call <sid>hi('goDirective', s:sea_serpent, s:none, 'none', {})
" call <sid>hi('goConstants', s:almost_white, s:none, 'none', {})
" call <sid>hi('goDeclaration', s:pale_red, s:none, 'none', {})
" call <sid>hi('goDeclType', s:pale_red, s:none, 'none', {})
" call <sid>hi('goBuiltins', s:venom_green, s:none, 'none', {})
call <sid>hi('goFunctionCall', s:sea_serpent, s:none, 'none', {})
hi link goFunction Function
hi link goFunctionCall Type
hi link goConst Constant
" call <sid>hi('goVarAssign', s:almost_white, s:none, 'none', {})
" hi link goVarDefs goVarAssign
"}}}


" Java {{{
" call <sid>hi('javaInclude', s:pale_red, s:none, 'none', {})
"-------------------------------------------------
hi def link javaComment         Comment
"-------------------------------------------------
hi def link javaConstant        Constant
hi def link javaString          String
hi def link javaCharacter       Character
hi def link javaNumber          Number
hi def link javaBoolean         Boolean
hi def link javaFloat           Float
"-------------------------------------------------
" hi def link javaIdentifier      Identifier
hi def link javaFunction        Function
"-------------------------------------------------
hi def link javaStatement       Statement
hi def link javaConditional     Conditional
hi def link javaRepeat          Repeat
hi def link javaLabel           Label
hi def link javaOperator        Operator
hi def link javaKeyword         Keyword
hi def link javaException       Exception
"-------------------------------------------------
hi def link javaPreProc         PreProc
hi def link javaInclude         Include
hi def link javaDefine          Define
hi def link javaMacro           Macro
hi def link javaPreCondit       PreCondit
""-------------------------------------------------
hi def link javaType            Type
hi def link javaStorageClass    StorageClass
hi def link javaStructure       Structure
hi def link javaTypedef         Typedef
""-------------------------------------------------
hi def link javaSpecial         Special
hi def link javaSpecialChar     SpecialChar
hi def link javaTag             Tag
hi def link javaDelimiter       Delimiter
hi def link javaSpecialComment  SpecialComment
hi def link javaDebug           Debug
""-------------------------------------------------
hi def link javaUnderlined      Underlined
"-------------------------------------------------
hi def link javaIgnore          Ignore
"-------------------------------------------------
hi def link javaError           Error
"-------------------------------------------------
hi def link javaTodo            Todo
"-------------------------------------------------
"}}}

" Markdown {{{
call <sid>hi('markdownCode', s:mustard, s:none, 'none', {})
hi link markdownCodeBlock markdownCode
hi link markdownCodeDelimiter markdownCode
call <sid>hi('markdownHeadingDelimiter', s:violetish, s:none, 'none', {})
call <sid>hi('markdownRule', s:greyish, s:none, 'none', {})
call <sid>hi('markdownHeadingRule', s:greyish, s:none, 'none', {})
call <sid>hi('markdownH1', s:violetish, s:none, 'bold', {})
hi link markdownH2 markdownH1
hi link markdownH3 markdownH1
hi link markdownH4 markdownH1
hi link markdownH5 markdownH1
hi link markdownH6 markdownH1
call <sid>hi('markdownIdDelimiter', s:violetish, s:none, 'none', {})
call <sid>hi('markdownId', s:violetish, s:none, 'none', {})
call <sid>hi('markdownBlockquote', s:sea_serpent, s:none, 'none', {})
call <sid>hi('markdowItalic', s:none, s:none, 'italic', {})
call <sid>hi('markdownBold', s:none, s:none, 'bold', {})
call <sid>hi('markdownListMarker', s:pale_red, s:none, 'none', {})
call <sid>hi('markdownOrderListMarker', s:pale_red, s:none, 'none', {})
call <sid>hi('markdownIdDeclaration', s:sea_serpent, s:none, 'none', {})
call <sid>hi('markdownLinkText', s:venom_green, s:none, 'none', {})
call <sid>hi('markdownLinkDelimiter', s:greyish, s:none, 'none', {})
call <sid>hi('markdownUrl', s:mustard, s:none, 'none', {})

"}}}


" Python {{{
hi link pythonDottedName Type
hi link pythonBuiltinType Type
hi link pythonBuiltin Type

"}}}


" Ruby {{{
call <sid>hi('rubyBlockParameter', s:violetish, s:none, 'none', {})
call <sid>hi('rubyClass', s:pale_red, s:none, 'none', {})
call <sid>hi('rubyStringEscape', s:pale_red, s:none, 'none', {})
call <sid>hi('rubyConstant', s:sea_serpent, s:none, 'none', {})
call <sid>hi('rubyControl', s:pale_red, s:none, 'none', {})
hi link rubyBlockParameterList rubyBlockParameter
call <sid>hi('rubyFunction', s:violetish, s:none, 'none', {})
call <sid>hi('rubyGlobalVariable', s:violetish, s:none, 'none', {})
call <sid>hi('rubyInclude', s:pale_red, s:none, 'none', {})
call <sid>hi('rubyInstanceVariable', s:violetish, s:none, 'none', {})
call <sid>hi('rubyInterpolation', s:mustard, s:none, 'none', {})
call <sid>hi('rubyInterpolationDelimiter', s:venom_green, s:none, 'none', {})
call <sid>hi('rubyStringDelimiter', s:mustard, s:none, 'none', {})
call <sid>hi('rubySymbol', s:venom_green, s:none, 'none', {})
call <sid>hi('rubyDefine', s:pale_red, s:none, 'none', {})
call <sid>hi('rubyOperator', s:venom_green, s:none, 'none', {})
"}}}

" NERDTree {{{
call <sid>hi('NERDTreeDir', s:sea_serpent, s:none, 'none', {})
call <sid>hi('NERDTreeDirSlash', s:mustard, s:none, 'none', {})
call <sid>hi('NERDTreeFile', s:almost_white, s:none, 'none', {})
call <sid>hi('NERDTreeExecFile', s:venom_green, s:none, 'none', {})
call <sid>hi('NERDTreeOpenable', s:mustard, s:none, 'none', {})
call <sid>hi('NERDTreeClosable', s:pale_red, s:none, 'none', {})
call <sid>hi('NERDTreeCWD', s:violetish, s:none, 'bold', {})
call <sid>hi('NERDTreeUp', s:pale_grey, s:none, 'none', {})
" }}}
