local M = {}
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local fn = vim.fn
local utils = require('solarized.utils')
local colors

cmd('hi clear')

utils.default_settings()

if fn.exists("syntax_on") then
	cmd('syntax reset')
end

g.colors_name = 'solarized-mono'

function M.load_syntax(colors)
	local syntax = {}

	syntax['Normal'] = {fg=colors.base0,bg=utils.termtrans(colors.base03)}
	syntax['FoldColumn'] = {fg=colors.base0,bg=utils.termtrans(colors.base02)}
	syntax['Folded'] = {fg=colors.base01,bg=utils.termtrans(colors.base03),guisp=colors.base03}
	syntax['Terminal'] = syntax['Normal']
	syntax['ToolbarButton'] = {fg=colors.base1,bg=utils.termtrans(colors.base02),style='bold'}
	syntax['ToolbarLine'] = {fg=colors.none,bg=utils.termtrans(colors.base02)}
	syntax['CursorLine'] = {fg=colors.none,bg=utils.termtrans(colors.base02)}
	syntax['LineNr'] = {fg=colors.base00,bg=utils.termtrans(colors.base02)}
	syntax['FloatBorder'] = {fg=colors.base1, bg=colors.none}
	syntax['NormalFloat'] = syntax['LineNr']

	if g.solarized_diffmode == 'low' then
		syntax['DiffAdd'] = {fg=colors.green, bg=colors.none, guisp=colors.green}
		syntax['DiffChange'] = {fg=colors.yellow, bg=colors.none, guisp=colors.yellow}
		syntax['DiffDelete'] = {fg=colors.red, bg=colors.none, style='bold'}
		syntax['DiffText'] = {fg=colors.blue, bg=colors.none, guisp=colors.blue}
	elseif g.solarized_diffmode == 'high' then
		syntax['DiffAdd'] = {fg=colors.green, bg=colors.none, style='reverse'}
		syntax['DiffChange'] = {fg=colors.yellow, bg=colors.none, style='reverse'}
		syntax['DiffDelete'] = {fg=colors.red, bg=colors.none, style='reverse'}
		syntax['DiffText'] = {fg=colors.blue, bg=colors.none, style='reverse'}
	else
		syntax['DiffAdd'] = {fg=colors.green,bg=colors.base02,guisp=colors.green}
		syntax['DiffChange'] = {fg=colors.yellow,bg=colors.base02,guisp=colors.yellow}
		syntax['DiffDelete'] = {fg=colors.red,bg=colors.base02,style='bold'}
		syntax['DiffText'] = {fg=colors.blue,bg=colors.base02,guisp=colors.blue}
	end

	if g.solarized_statusline == 'low' then
		syntax['StatusLine'] = {fg=colors.base01, bg=colors.base2, style='reverse'}
		syntax['StatusLineNC'] = {fg=colors.base01, bg=colors.base02, style='reverse'}
		syntax['TabLine'] = {fg=colors.base01, bg=colors.base02, style='reverse'}
		syntax['TabLineFill'] = {fg=colors.base01, bg=colors.base02, style='reverse'}
		syntax['TabLineSel'] = {fg=colors.base0, bg=colors.base3, style='reverse'}
		syntax['VertSplit'] = {fg=colors.base01, bg=colors.none}
	elseif g.solarized_statusline == 'flat' then
		syntax['StatusLine'] = {fg=colors.base02, bg=colors.base2, style='reverse'}
		syntax['StatusLineNC'] = {fg=colors.base02, bg=colors.base1, style='reverse'}
		syntax['TabLineSel'] = {fg=colors.base2, bg=colors.base02}
		syntax['TabLine'] = {fg=colors.base01, bg=colors.base02}
		syntax['TabLineFill'] = {fg=colors.base01, bg=colors.base02}
		syntax['VertSplit'] = {fg=colors.base02, bg=colors.none}
	else
		syntax['StatusLine'] = {fg=colors.base0,bg=colors.base02,style='reverse'}
		syntax['StatusLineNC'] = {fg=colors.base01,bg=colors.base02,style='reverse'}
		syntax['TabLine'] = {fg=colors.base1,bg=colors.base02}
		syntax['TabLineFill'] = {fg=colors.base0,bg=colors.base02}
		syntax['TabLineSel'] = {fg=colors.base2,bg=colors.base01}
		syntax['VertSplit'] = {fg=colors.base01}
	end

	if g.solarized_visibility == 'high' then
		syntax['CursorLineNr'] = {fg=colors.base0,bg=colors.base02,style='bold'}
		syntax['LineNr'] = {fg=colors.base0,bg=colors.base02,}
		syntax['NonText'] = {fg=colors.base02,style='bold'}
		syntax['SpecialKey'] = {fg=colors.base0,style='reverse'}
		syntax['SpellBad'] = {fg=colors.violet,bg=colors.base3,guisp=colors.red,style='reverse,undercurl'}
		syntax['SpellCap'] = {fg=colors.violet,bg=colors.base3,guisp=colors.red,style='reverse,undercurl'}
		syntax['SpellLocal'] = {fg=colors.yellow,bg=colors.base3,guisp=colors.red,style='reverse,undercurl'}
		syntax['SpellRare'] = {fg=colors.cyan,bg=colors.base3,guisp=colors.red,style='reverse,undercurl'}
		syntax['Title'] = {fg=colors.base1,style='bold'}
	elseif g.solarized_visibility == 'low' then
		syntax['CursorLineNr'] = {fg=colors.base01,bg=colors.base02,style='bold'}
		syntax['LineNr'] = {fg=colors.base01,bg=colors.base02,}
		syntax['NonText'] = {fg=colors.base02}
		syntax['SpecialKey'] = {fg=colors.base02,style='reverse'}
		syntax['SpellBad'] = {fg=colors.violet,guisp=colors.violet,style='undercurl'}
		syntax['SpellCap'] = {fg=colors.violet,guisp=colors.violet,style='undercurl'}
		syntax['SpellLocal'] = {fg=colors.yellow,guisp=colors.yellow,style='undercurl'}
		syntax['SpellRare'] = {fg=colors.cyan,guisp=colors.cyan,style='undercurl'}
		syntax['Title'] = {fg=colors.base01,style='bold'}
	else
		syntax['CursorLineNr'] = {fg=colors.base0,bg=colors.base02,style='bold'}
		syntax['LineNr'] = {fg=colors.base00,bg=colors.base02,}
		syntax['NonText'] = {fg=colors.base02}
		syntax['SpecialKey'] = {fg=colors.base01,bg=colors.base02,style='bold'}
		syntax['SpellBad'] = {fg=colors.violet,guisp=colors.violet,style='undercurl'}
		syntax['SpellCap'] = {fg=colors.violet,guisp=colors.violet,style='undercurl'}
		syntax['SpellLocal'] = {fg=colors.yellow,guisp=colors.yellow,style='undercurl'}
		syntax['SpellRare'] = {fg=colors.cyan,guisp=colors.cyan,style='undercurl'}
		syntax['Title'] = {fg=colors.base0,style='bold'}
	end

	syntax['ColorColumn'] = {fg=colors.none,bg=utils.termtrans(colors.base02)}
	syntax['Conceal'] = {fg=colors.blue}
	syntax['CursorColumn'] = {fg=colors.none,bg=utils.termtrans(colors.base02)}
	syntax['Directory'] = {fg=colors.base01}
	syntax['EndOfBuffer'] = {fg=colors.none,ctermfg=colors.none,ctermbg=colors.none}
	syntax['ErrorMsg'] = {fg=colors.red,bg=colors.err_bg,style='reverse'}
	syntax['IncSearch'] = {fg=colors.orange,style='standout'}
	syntax['MatchParen'] = {fg=colors.none,bg=utils.termtrans(colors.base02),style='bold'}
	syntax['ModeMsg'] = {fg=colors.blue}
	syntax['MoreMsg'] = {fg=colors.blue}
	syntax['Pmenu'] = {fg=colors.base1,bg=colors.base02}
	syntax['PmenuSbar'] = {fg=colors.none,bg=colors.base01}
	syntax['PmenuSel'] = {fg=colors.base2,bg=colors.base00}
	syntax['PmenuThumb'] = {fg=colors.none,bg=colors.base0}
	syntax['Question'] = {fg=colors.base2,style='bold'}
	syntax['Search'] = {fg=colors.yellow,style='reverse'}
	syntax['YankPaste'] = {fg=colors.violet,style='reverse'}
	syntax['SignColumn'] = {fg=colors.base0,bg=utils.termtrans(colors.base02)}
	syntax['Visual'] = {fg=colors.base01,bg=colors.base03,style='reverse'}
	syntax['VisualNOS'] = {fg=colors.none,bg=colors.base02,style='reverse'}
	syntax['WarningMsg'] = {fg=colors.orange,style='bold'}
	syntax['WildMenu'] = {fg=colors.base2,bg=colors.base02,style='reverse'}
	syntax['Comment'] = {fg=colors.base02,style=utils.italics()}
	syntax['Constant'] = {fg=colors.base00}
	syntax['CursorIM'] = {fg=colors.none,bg=colors.base1}
	syntax['Error'] = {fg=colors.red,bg=colors.err_bg,style='bold,reverse'}
	syntax['Identifier'] = {fg=colors.base0}
	syntax['Ignore'] = {fg=colors.none,ctermfg=colors.none,ctermbg=colors.none}
	syntax['PreProc'] = {fg=colors.base0}
	syntax['Special'] = {fg=colors.base0,style='bold'}
	syntax['Statement'] = {fg=colors.base0,style='bold'}
	syntax['Todo'] = {fg=colors.magenta,style='bold'}
	syntax['Type'] = {fg=colors.base1,style=utils.italics()}
	syntax['Text'] = {fg=colors.base01}
	syntax['Strikethrough'] = {fg=colors.base01,strikethrough=true}
	syntax['Underlined'] = {fg=colors.violet}
	syntax['NormalMode'] = {fg=colors.base0,bg=colors.base3,style='reverse'}
	syntax['InsertMode'] = {fg=colors.cyan,bg=colors.base3,style='reverse'}
	syntax['ReplaceMode'] = {fg=colors.orange,bg=colors.base3,style='reverse'}
	syntax['VisualMode'] = {fg=colors.magenta,bg=colors.base3,style='reverse'}
	syntax['CommandMode'] = {fg=colors.magenta,bg=colors.base3,style='reverse'}
	syntax['vimCommentString'] = {fg=colors.violet}
	syntax['vimCommand'] = {fg=colors.base02}
	syntax['vimCmdSep'] = {fg=colors.blue,style='bold'}
	syntax['helpExample'] = {fg=colors.base1}
	syntax['helpOption'] = {fg=colors.cyan}
	syntax['helpNote'] = {fg=colors.magenta}
	syntax['helpVim'] = {fg=colors.magenta}
	syntax['helpHyperTextJump'] = {fg=colors.blue}
	syntax['helpHyperTextEntry'] = {fg=colors.green}
	syntax['vimIsCommand'] = {fg=colors.base00}
	syntax['vimSynMtchOpt'] = {fg=colors.yellow}
	syntax['vimSynType'] = {fg=colors.cyan}
	syntax['vimHiLink'] = {fg=colors.blue}
	syntax['vimHiGroup'] = {fg=colors.blue}
	syntax['vimGroup'] = {fg=colors.blue,style='bold'}
	syntax['gitcommitComment'] = {fg=colors.base01,style=utils.italics()}
	syntax['gitcommitUnmerged'] = {fg=colors.green,style='bold'}
	syntax['gitcommitOnBranch'] = {fg=colors.base01,style='bold'}
	syntax['gitcommitBranch'] = {fg=colors.magenta,style='bold'}
	syntax['gitcommitdiscardedtype'] = {fg=colors.red}
	syntax['gitcommitselectedtype'] = {fg=colors.green}
	syntax['gitcommitHeader'] = {fg=colors.base01}
	syntax['gitcommitUntrackedFile'] = {fg=colors.cyan,style='bold'}
	syntax['gitcommitDiscardedFile'] = {fg=colors.red,style='bold'}
	syntax['gitcommitSelectedFile'] = {fg=colors.green,style='bold'}
	syntax['gitcommitUnmergedFile'] = {fg=colors.yellow,style='bold'}
	syntax['gitcommitFile'] = {fg=colors.base0,style='bold'}
	syntax['htmlTag'] = {fg=colors.base01}
	syntax['htmlEndTag'] = {fg=colors.base01}
	syntax['htmlTagN'] = {fg=colors.base1,style='bold'}
	syntax['htmlTagName'] = {fg=colors.blue,style='bold'}
	syntax['htmlSpecialTagName'] = {fg=colors.blue,style=utils.italics()}
	syntax['htmlArg'] = {fg=colors.base00}
	syntax['javaScript'] = {fg=colors.base0}
	syntax['perlHereDoc'] = {fg=colors.base1}
	syntax['perlVarPlain'] = {fg=colors.base0}
	syntax['perlStatementFileDesc'] = {fg=colors.cyan}
	syntax['texstatement'] = {fg=colors.cyan}
	syntax['texmathzonex'] = {fg=colors.base00}
	syntax['texmathmatcher'] = {fg=colors.yellow}
	syntax['texreflabel'] = {fg=colors.base01}
	syntax['rubyDefine'] = {fg=colors.base1,style='bold'}
	syntax['rubyBoolean'] = {fg=colors.base1}
	syntax['cPreCondit'] = {fg=colors.base0}
	syntax['VarId'] = {fg=colors.blue}
	syntax['ConId'] = {fg=colors.yellow}
	syntax['hsImport'] = {fg=colors.base2}
	syntax['hsString'] = {fg=colors.base00}
	syntax['hsStructure'] = {fg=colors.base1}
	syntax['hs_hlFunctionName'] = {fg=colors.base1,style=utils.italics()}
	syntax['hsStatement'] = {fg=colors.base00}
	syntax['hsImportLabel'] = {fg=colors.base2}
	syntax['hs_OpFunctionName'] = {fg=colors.base01}
	syntax['hs_DeclareFunction'] = {fg=colors.base0}
	syntax['hsVarSym'] = {fg=colors.base0}
	syntax['hsType'] = {fg=colors.base01}
	syntax['hsTypedef'] = {fg=colors.base01}
	syntax['hsModuleName'] = {fg=colors.base1}
	syntax['pandocTitleBlock'] = {fg=colors.blue}
	syntax['pandocTitleBlockTitle'] = {fg=colors.blue,style='bold'}
	syntax['pandocTitleComment'] = {fg=colors.blue,style='bold'}
	syntax['pandocComment'] = {fg=colors.base01,style=utils.italics()}
	syntax['pandocVerbatimBlock'] = {fg=colors.yellow}
	syntax['pandocBlockQuote'] = {fg=colors.blue}
	syntax['pandocBlockQuoteLeader1'] = {fg=colors.blue}
	syntax['pandocBlockQuoteLeader2'] = {fg=colors.cyan}
	syntax['pandocBlockQuoteLeader3'] = {fg=colors.yellow}
	syntax['pandocBlockQuoteLeader4'] = {fg=colors.red}
	syntax['pandocBlockQuoteLeader5'] = {fg=colors.base0}
	syntax['pandocBlockQuoteLeader6'] = {fg=colors.base01}
	syntax['pandocListMarker'] = {fg=colors.magenta}
	syntax['pandocListReference'] = {fg=colors.magenta}
	syntax['pandocDefinitionBlock'] = {fg=colors.violet}
	syntax['pandocDefinitionTerm'] = {fg=colors.violet,style='standout'}
	syntax['pandocDefinitionIndctr'] = {fg=colors.violet,style='bold'}
	syntax['pandocEmphasisDefinition'] = {fg=colors.violet,style=utils.italics()}
	syntax['pandocEmphasisNestedDefinition'] = {fg=colors.violet,style='bold'}
	syntax['pandocStrongEmphasisDefinition'] = {fg=colors.violet,style='bold'}
	syntax['pandocStrongEmphasisNestedDefinition'] = {fg=colors.violet,style='bold'}
	syntax['pandocStrongEmphasisEmphasisDefinition'] = {fg=colors.violet,style='bold'}
	syntax['pandocStrikeoutDefinition'] = {fg=colors.violet,style='reverse'}
	syntax['pandocVerbatimInlineDefinition'] = {fg=colors.violet}
	syntax['pandocSuperscriptDefinition'] = {fg=colors.violet}
	syntax['pandocSubscriptDefinition'] = {fg=colors.violet}
	syntax['pandocTable'] = {fg=colors.blue}
	syntax['pandocTableStructure'] = {fg=colors.blue}
	syntax['pandocTableZebraLight'] = {fg=colors.blue,bg=colors.base03}
	syntax['pandocTableZebraDark'] = {fg=colors.blue,bg=colors.base02}
	syntax['pandocEmphasisTable'] = {fg=colors.blue,style=utils.italics()}
	syntax['pandocEmphasisNestedTable'] = {fg=colors.blue,style='bold'}
	syntax['pandocStrongEmphasisTable'] = {fg=colors.blue,style='bold'}
	syntax['pandocStrongEmphasisNestedTable'] = {fg=colors.blue,style='bold'}
	syntax['pandocStrongEmphasisEmphasisTable'] = {fg=colors.blue,style='bold'}
	syntax['pandocStrikeoutTable'] = {fg=colors.blue,style='reverse'}
	syntax['pandocVerbatimInlineTable'] = {fg=colors.blue}
	syntax['pandocSuperscriptTable'] = {fg=colors.blue}
	syntax['pandocSubscriptTable'] = {fg=colors.blue}
	syntax['pandocHeading'] = {fg=colors.orange,style='bold'}
	syntax['pandocHeadingMarker'] = {fg=colors.orange,style='bold'}
	syntax['pandocEmphasisHeading'] = {fg=colors.orange,style='bold'}
	syntax['pandocEmphasisNestedHeading'] = {fg=colors.orange,style='bold'}
	syntax['pandocStrongEmphasisHeading'] = {fg=colors.orange,style='bold'}
	syntax['pandocStrongEmphasisNestedHeading'] = {fg=colors.orange,style='bold'}
	syntax['pandocStrongEmphasisEmphasisHeading'] = {fg=colors.orange,style='bold'}
	syntax['pandocStrikeoutHeading'] = {fg=colors.orange,style='reverse'}
	syntax['pandocVerbatimInlineHeading'] = {fg=colors.orange,style='bold'}
	syntax['pandocSuperscriptHeading'] = {fg=colors.orange,style='bold'}
	syntax['pandocSubscriptHeading'] = {fg=colors.orange,style='bold'}
	syntax['pandocLinkDelim'] = {fg=colors.base01}
	syntax['pandocLinkLabel'] = {fg=colors.blue}
	syntax['pandocLinkText'] = {fg=colors.blue}
	syntax['pandocLinkURL'] = {fg=colors.base00}
	syntax['pandocLinkTitle'] = {fg=colors.base00}
	syntax['pandocLinkTitleDelim'] = {fg=colors.base01,guisp=colors.base00}
	syntax['pandocLinkDefinition'] = {fg=colors.cyan,guisp=colors.base00}
	syntax['pandocLinkDefinitionID'] = {fg=colors.blue,style='bold'}
	syntax['pandocImageCaption'] = {fg=colors.violet,style='bold'}
	syntax['pandocFootnoteLink'] = {fg=colors.green}
	syntax['pandocFootnoteDefLink'] = {fg=colors.green,style='bold'}
	syntax['pandocFootnoteInline'] = {fg=colors.green,style='bold'}
	syntax['pandocFootnote'] = {fg=colors.green}
	syntax['pandocCitationDelim'] = {fg=colors.magenta}
	syntax['pandocCitation'] = {fg=colors.magenta}
	syntax['pandocCitationID'] = {fg=colors.magenta}
	syntax['pandocCitationRef'] = {fg=colors.magenta}
	syntax['pandocStyleDelim'] = {fg=colors.base01}
	syntax['pandocEmphasis'] = {fg=colors.base0,style=utils.italics()}
	syntax['pandocEmphasisNested'] = {fg=colors.base0,style='bold'}
	syntax['pandocStrongEmphasis'] = {fg=colors.base0,style='bold'}
	syntax['pandocStrongEmphasisNested'] = {fg=colors.base0,style='bold'}
	syntax['pandocStrongEmphasisEmphasis'] = {fg=colors.base0,style='bold'}
	syntax['pandocStrikeout'] = {fg=colors.base01,style='reverse'}
	syntax['pandocVerbatimInline'] = {fg=colors.yellow}
	syntax['pandocSuperscript'] = {fg=colors.violet}
	syntax['pandocSubscript'] = {fg=colors.violet}
	syntax['pandocRule'] = {fg=colors.blue,style='bold'}
	syntax['pandocRuleLine'] = {fg=colors.blue,style='bold'}
	syntax['pandocEscapePair'] = {fg=colors.red,style='bold'}
	syntax['pandocCitationRef'] = {fg=colors.magenta}
	syntax['pandocNonBreakingSpace'] = {fg=colors.red,style='reverse'}
	syntax['pandocMetadataDelim'] = {fg=colors.base01}
	syntax['pandocMetadata'] = {fg=colors.blue}
	syntax['pandocMetadataKey'] = {fg=colors.blue}
	syntax['pandocMetadata'] = {fg=colors.blue,style='bold'}

	syntax['Boolean'] = syntax['Constant']
	syntax['Character'] = syntax['Constant']
	syntax['Conditional'] = syntax['Statement']
	syntax['Debug'] = syntax['Special']
	syntax['Define'] = syntax['PreProc']
	syntax['Delimiter'] = syntax['Identifier']
	syntax['Exception'] = syntax['Statement']
	syntax['Float'] = syntax['Constant']
	if g.solarized_visibility == 'high' then
		syntax['Function'] = {fg=colors.base1}
	else
		syntax['Function'] = syntax['Identifier']
	end
	syntax['Include'] = syntax['PreProc']
	syntax['Keyword'] = syntax['Statement']
	syntax['Label'] = syntax['Statement']
	syntax['Macro'] = syntax['PreProc']
	syntax['Number'] = syntax['Constant']
	syntax['Operator'] = syntax['Statement']
	syntax['PreCondit'] = syntax['PreProc']
	syntax['QuickFixLine'] = syntax['Search']
	syntax['Repeat'] = syntax['Statement']
	syntax['SpecialChar'] = syntax['Special']
	syntax['SpecialComment'] = syntax['Special']
	syntax['StatusLineTerm'] = syntax['StatusLine']
	syntax['StatusLineTermNC'] = syntax['StatusLineNC']
	syntax['StorageClass'] = syntax['Type']
	syntax['String'] = syntax['Text']
	syntax['Structure'] = syntax['Type']
	syntax['Tag'] = syntax['Special']
	syntax['Typedef'] = syntax['Type']
	syntax['lCursor'] = syntax['Cursor']
	syntax['vimVar'] = syntax['Identifier']
	syntax['vimFunc'] = syntax['Function']
	syntax['vimUserFunc'] = syntax['Function']
	syntax['helpSpecial'] = syntax['Special']
	syntax['vimSet'] = syntax['Normal']
	syntax['vimSetEqual'] = syntax['Normal']
	syntax['diffAdded'] = syntax['Statement']
	syntax['diffRemoved'] = syntax['NonText']
	syntax['diffLine'] = syntax['Identifier']
	syntax['gitcommitUntracked'] = syntax['gitcommitComment']
	syntax['gitcommitDiscarded'] = syntax['gitcommitComment']
	syntax['gitcommitSelected'] = syntax['gitcommitComment']
	syntax['gitcommitNoBranch'] = syntax['gitcommitBranch']
	syntax['gitcommitDiscardedArrow'] = syntax['gitcommitDiscardedFile']
	syntax['gitcommitSelectedArrow'] = syntax['gitcommitSelectedFile']
	syntax['gitcommitUnmergedArrow'] = syntax['gitcommitUnmergedFile']
	syntax['jsFuncCall'] = syntax['Function']
	syntax['rubySymbol'] = syntax['String']
	syntax['hsImportParams'] = syntax['Delimiter']
	syntax['hsDelimTypeExport'] = syntax['Delimiter']
	syntax['hsModuleStartLabel'] = syntax['hsStructure']
	syntax['hsModuleWhereLabel'] = syntax['hsModuleStartLabel']
	syntax['pandocVerbatimBlockDeep'] = syntax['pandocVerbatimBlock']
	syntax['pandocCodeBlock'] = syntax['pandocVerbatimBlock']
	syntax['pandocCodeBlockDelim'] = syntax['pandocVerbatimBlock']
	syntax['pandocTableStructureTop'] = syntax['pandocTableStructre']
	syntax['pandocTableStructureEnd'] = syntax['pandocTableStructre']
	syntax['pandocEscapedCharacter'] = syntax['pandocEscapePair']
	syntax['pandocLineBreak'] = syntax['pandocEscapePair']
	syntax['pandocMetadataTitle'] = syntax['pandocMetadata']

	-- TreeSitter
	-- syntax['TSAnnotation'] = syntax['']
	syntax['TSBoolean'] = syntax['Constant']
	syntax['TSCharacter'] = syntax['Constant']
	syntax['TSComment'] = syntax['Comment']
	syntax['TSConditional'] = syntax['Conditional']
	syntax['TSConstant'] = syntax['Constant']
	syntax['TSConstBuiltin'] = syntax['Constant']
	syntax['TSConstMacro'] = syntax['Define']
	syntax['TSError'] = {fg=colors.red}
	syntax['TSException'] = syntax['Exception']
	syntax['TSField'] = syntax['Identifier']
	syntax['TSFloat'] = syntax['Float']
	syntax['TSFunction'] = syntax['Function']
	syntax['TSFuncBuiltin'] = syntax['Function']
	syntax['TSFuncMacro'] = syntax['Define']
	syntax['TSInclude'] = syntax['Include']
	syntax['TSKeyword'] = syntax['Keyword']
	syntax['TSLabel'] = syntax['Label']
	syntax['TSMethod'] = syntax['Function']
	syntax['TSNamespace'] = syntax['Identifier']
	syntax['TSNumber'] = syntax['Constant']
	syntax['TSOperator'] = syntax['Operator']
	syntax['TSParameterReference'] = syntax['Identifier']
	syntax['TSProperty'] = syntax['TSField']
	syntax['TSPunctDelimiter'] = syntax['Delimiter']
	syntax['TSPunctBracket'] = syntax['Constant']
	syntax['TSPunctSpecial'] = syntax['Special']
	syntax['TSRepeat'] = syntax['Repeat']
	syntax['TSString'] = syntax['Constant']
	syntax['TSStringRegex'] = syntax['Constant']
	syntax['TSStringEscape'] = syntax['Constant']
	syntax['TSStrong'] = {fg=colors.base1,bg=colors.base03,style='bold'}
	syntax['TSConstructor'] = syntax['Function']
	syntax['TSKeywordFunction'] = syntax['Identifier']
	syntax['TSLiteral'] = syntax['Normal']
	syntax['TSParameter'] = syntax['Identifier']
	syntax['TSVariable'] = {fg=colors.base0}
	syntax['TSVariableBuiltin'] = syntax['Identifier']
	syntax['TSTag'] = syntax['Special']
	syntax['TSTagDelimiter'] = syntax['Delimiter']
	syntax['TSTitle'] = syntax['Title']
	syntax['TSType'] = syntax['Type']
	syntax['TSTypeBuiltin'] = syntax['Type']
	-- syntax['TSEmphasis'] = syntax['']

	-- BEGIN Neovim >= 0.8
	-- Misc {{{
	syntax['@comment'] = syntax['Comment']
	syntax['@error'] = {fg=colors.red}
	syntax['@none'] = syntax['NONE']
	syntax['@preproc'] = syntax['PreProc']
	syntax['@define'] = syntax['Define']
	syntax['@operator'] = syntax['Operator']
	-- }}}

	-- Punctuation {{{
	syntax['@punctuation.delimiter'] = syntax['Delimiter']
	syntax['@punctuation.bracket'] = syntax['Constant']
	syntax['@punctuation.special'] = syntax['Special']
	-- }}}

	-- Literals {{{
	syntax['@string'] = syntax['String']
	syntax['@string.regex'] = syntax['String']
	syntax['@string.escape'] = syntax['Special']
	syntax['@string.special'] = syntax['Special']

	syntax['@character'] = syntax['Character']
	syntax['@character.special'] = syntax['Special']

	syntax['@boolean'] = syntax['Boolean']
	syntax['@number'] = syntax['Number']
	syntax['@float'] = syntax['Float']
	-- }}}

	-- Functions {{{
	syntax['@function'] = syntax['Function']
	syntax['@function.call'] = syntax['Function']
	syntax['@function.builtin'] = syntax['Function']
	syntax['@function.macro'] = syntax['Macro']

	syntax['@method'] = syntax['Function']
	syntax['@method.call'] = syntax['Function']

	syntax['@constructor'] = syntax['Special']
	--syntax['@parameter'] = {fg=colors.base0}
	syntax['@parameter'] = {fg=colors.base1,style=utils.italics()}
	-- }}}

	-- Keywords {{{
	syntax['@keyword'] = syntax['Keyword']
	syntax['@keyword.function'] = syntax['Keyword']
	syntax['@keyword.operator'] = syntax['Keyword']
	syntax['@keyword.return'] = syntax['Keyword']

	syntax['@conditional'] = syntax['Conditional']
	syntax['@repeat'] = syntax['Repeat']
	syntax['@debug'] = syntax['Debug']
	syntax['@label'] = syntax['Label']
	syntax['@include'] = syntax['Include']
	syntax['@exception'] = syntax['Exception']
	-- }}}

	-- Types {{{
	syntax['@type'] = syntax['Type']
	syntax['@type.builtin'] = syntax['Type']
	syntax['@type.qualifier'] = syntax['Type']
	syntax['@type.definition'] = syntax['Typedef']

	syntax['@storageclass'] = syntax['StorageClass']
	syntax['@attribute'] = syntax['Identifier']
	syntax['@field'] = syntax['Identifier']
	syntax['@property'] = {fg=colors.base0}
	-- }}}

	-- Identifiers {{{
	syntax['@variable'] = {fg=colors.base0}
	syntax['@variable.builtin'] = syntax['Special']

	syntax['@constant'] = syntax['Constant']
	syntax['@constant.builtin'] = syntax['Type']
	syntax['@constant.macro'] = syntax['Define']

	syntax['@namespace'] = syntax['Identifier']
	syntax['@symbol'] = syntax['Identifier']
	-- }}}

	-- Text {{{
	syntax['@text'] = syntax['Normal']
	syntax['@text.strong'] = {fg=colors.base1,bg=colors.base03,style='bold'}
	syntax['@text.emphasis'] = {fg=colors.base1,bg=colors.base03,style='bold'}
	syntax['@text.underline'] = syntax['Underlined']
	syntax['@text.strike'] = syntax['Strikethrough']
	syntax['@text.title'] = syntax['Title']
	syntax['@text.literal'] = syntax['String']
	syntax['@text.uri'] = syntax['Underlined']
	syntax['@text.math'] = syntax['Special']
	syntax['@text.environment'] = syntax['Macro']
	syntax['@text.environment.name'] = syntax['Type']
	syntax['@text.reference'] = syntax['Constant']

	syntax['@text.todo'] = syntax['Todo']
	syntax['@text.note'] = syntax['WarningMsg']
	syntax['@text.warning'] = syntax['WarningMsg']
	syntax['@text.danger'] = {fg=colors.red,style='bold'}
	-- }}}

	-- Tags {{{
	syntax['@tag'] = syntax['Tag']
	syntax['@tag.attribute'] = syntax['Identifier']
	syntax['@tag.delimiter'] = syntax['Delimiter']
	-- }}}
	-- END Neovim >= 0.8

	-- BEGIN Neovim >= 0.9
	-- Neovim LSP semantic highlights.
	syntax['@lsp.mod.deprecated'] = syntax['@constant']
	syntax['@lsp.mod.readonly'] = syntax['@constant']
	syntax['@lsp.mod.typeHint'] = syntax['@type']
	syntax['@lsp.type.boolean'] = syntax['@boolean']
	syntax['@lsp.type.builtinConstant'] = syntax['@constant.builtin']
	syntax['@lsp.type.builtinType'] = syntax['@type.builtin']
	syntax['@lsp.type.class'] = syntax['@type']
	syntax['@lsp.type.enum'] = syntax['@type']
	syntax['@lsp.type.enumMember'] = syntax['@property']
	syntax['@lsp.type.escapeSequence'] = syntax['@string.escape']
	syntax['@lsp.type.formatSpecifier'] = syntax['@punctuation.special']
	syntax['@lsp.type.interface'] = syntax['@type']
	syntax['@lsp.type.keyword'] = syntax['@keyword']
	syntax['@lsp.type.magicFunction'] = syntax['@function.builtin']
	syntax['@lsp.type.namespace'] = syntax['@namespace']
	syntax['@lsp.type.number'] = syntax['@number']
	syntax['@lsp.type.operator'] = syntax['@operator']
	syntax['@lsp.type.parameter'] = syntax['@parameter']
	syntax['@lsp.type.property'] = syntax['@property']
	syntax['@lsp.type.selfKeyword'] = syntax['@variable.builtin']
	syntax['@lsp.type.selfParameter'] = syntax['@variable.builtin']
	syntax['@lsp.type.struct'] = syntax['@type']
	syntax['@lsp.type.typeAlias'] = syntax['@type.definition']
	syntax['@lsp.type.variable'] = syntax['@variable']
	syntax['@lsp.typemod.class.defaultLibrary'] = syntax['@type.builtin']
	syntax['@lsp.typemod.enum.defaultLibrary'] = syntax['@type']
	syntax['@lsp.typemod.enumMember.defaultLibrary'] = syntax['@constant.builtin']
	syntax['@lsp.typemod.function.defaultLibrary'] = syntax['@function.builtin']
	syntax['@lsp.typemod.keyword.async'] = syntax['@keyword']
	syntax['@lsp.typemod.method.defaultLibrary'] = syntax['@function.builtin']
	syntax['@lsp.typemod.operator.injected'] = syntax['@operator']
	syntax['@lsp.typemod.string.injected'] = syntax['@string']
	syntax['@lsp.typemod.variable.defaultLibrary'] = syntax['@variable.builtin']
	syntax['@lsp.typemod.variable.global'] = syntax['@constant']
	syntax['@lsp.typemod.variable.injected'] = syntax['@variable']
	syntax['@lsp.typemod.variable.readonly'] = syntax['@constant']
	syntax['@lsp.typemod.variable.static'] = syntax['@constant']
	-- Language specific LSP semantic overrides.
	--syntax['@lsp.type.macro.rust'] = syntax['@function']
	-- END Neovim >= 0.9

	syntax['DiagnosticError'] = {fg=colors.red,guisp=colors.red,bg=utils.termtrans(colors.base02),style='none'}
	syntax['DiagnosticWarn'] = {fg=colors.yellow,guisp=colors.yellow,bg=utils.termtrans(colors.base02),style='none'}
	syntax['DiagnosticInfo'] = {fg=colors.cyan,guisp=colors.cyan,bg=utils.termtrans(colors.base02),style='none'}
	syntax['DiagnosticHint'] = {fg=colors.green,guisp=colors.green,bg=utils.termtrans(colors.base02),style='none'}
	syntax['DiagnosticUnderlineError'] = {fg=colors.none,guisp=colors.red,style='underline'}
	syntax['DiagnosticUnderlineWarn'] = {fg=colors.none,guisp=colors.yellow,style='underline'}
	syntax['DiagnosticUnderlineInfo'] = {fg=colors.none,guisp=colors.cyan,style='underline'}
	syntax['DiagnosticUnderlineHint'] = {fg=colors.none,guisp=colors.green,style='underline'}

	syntax['LspReferenceRead'] = {fg=colors.none,style='underline'}
	syntax['LspReferenceText'] = syntax['LspReferenceRead']
	syntax['LspReferenceWrite'] = {fg=colors.none,style='underline,bold'}

	-- Lspsaga
	syntax['LspSagaFinderSelection'] = syntax['Search']
	syntax['TargetWord'] = syntax['Title']

	syntax['GitSignsAdd'] = syntax['DiffAdd']
	syntax['GitSignsChange'] = syntax['DiffChange']
	syntax['GitSignsDelete'] = syntax['DiffDelete']

	syntax['VGitSignAdd'] = syntax['DiffAdd']
	syntax['VgitSignChange'] = syntax['DiffChange']
	syntax['VGitSignRemove'] = syntax['DiffDelete']

	-- nvim-cmp syntax support
	syntax['CmpDocumentation' ] = {fg=colors.base2, bg=colors.base02 }
	syntax['CmpDocumentationBorder' ] = {fg=colors.base2, bg=colors.base02 }

	syntax['CmpItemAbbr' ] = {fg=colors.base1, bg=colors.none }
	syntax['CmpItemAbbrDeprecated' ] = {fg=colors.base0, bg=colors.none }
	syntax['CmpItemAbbrMatch' ] = {fg=colors.base2, bg=colors.none }
	syntax['CmpItemAbbrMatchFuzzy' ] = {fg=colors.base2, bg=colors.none }

	syntax['CmpItemKindDefault' ] = {fg=colors.base1, bg=colors.none }
	syntax['CmpItemMenu' ] = {fg=colors.base1, bg=colors.none }
	syntax['CmpItemKindKeyword' ] = {fg=colors.yellow, bg=colors.none }
	syntax['CmpItemKindVariable' ] = {fg=colors.green, bg=colors.none }
	syntax['CmpItemKindConstant' ] = {fg=colors.base1, bg=colors.none }
	syntax['CmpItemKindReference' ] = {fg=colors.base1, bg=colors.none }
	syntax['CmpItemKindValue' ] = {fg=colors.base1, bg=colors.none }
	syntax['CmpItemKindFunction' ] = {fg=colors.blue, bg=colors.none }
	syntax['CmpItemKindMethod' ] = {fg=colors.blue, bg=colors.none }
	syntax['CmpItemKindConstructor' ] = {fg=colors.blue, bg=colors.none }
	syntax['CmpItemKindClass' ] = {fg=colors.red, bg=colors.none }
	syntax['CmpItemKindInterface' ] = {fg=colors.base1, bg=colors.none }
	syntax['CmpItemKindStruct' ] = {fg=colors.base1, bg=colors.none }
	syntax['CmpItemKindEvent' ] = {fg=colors.base1, bg=colors.none }
	syntax['CmpItemKindEnum' ] = {fg=colors.base1, bg=colors.none }
	syntax['CmpItemKindUnit' ] = {fg=colors.base1, bg=colors.none }
	syntax['CmpItemKindModule' ] = {fg=colors.base1, bg=colors.none }
	syntax['CmpItemKindProperty' ] = {fg=colors.base1, bg=colors.none }
	syntax['CmpItemKindField' ] = {fg=colors.base1, bg=colors.none }
	syntax['CmpItemKindTypeParameter' ] = {fg=colors.base1, bg=colors.none }
	syntax['CmpItemKindEnumMember' ] = {fg=colors.base1, bg=colors.none }
	syntax['CmpItemKindOperator' ] = {fg=colors.base1, bg=colors.none }
	syntax['CmpItemKindSnippet' ] = {fg=colors.base0, bg=colors.none }

	syntax['NavicIconsFile'] = syntax['CmpItemKindFile']
	syntax['NavicIconsModule'] = syntax['CmpItemKindModule']
	syntax['NavicIconsNamespace'] = syntax['CmpItemKindModule']
	syntax['NavicIconsPackage'] = syntax['CmpItemKindModule']
	syntax['NavicIconsClass'] = syntax['CmpItemKindClass']
	syntax['NavicIconsMethod'] = syntax['CmpItemKindMethod']
	syntax['NavicIconsProperty'] = syntax['CmpItemKindProperty']
	syntax['NavicIconsField'] = syntax['CmpItemKindField']
	syntax['NavicIconsConstructor'] = syntax['CmpItemKindConstructor']
	syntax['NavicIconsEnum'] = syntax['CmpItemKindEnum']
	syntax['NavicIconsInterface'] = syntax['CmpItemKindInterface']
	syntax['NavicIconsFunction'] = syntax['CmpItemKindFunction']
	syntax['NavicIconsVariable'] = syntax ['CmpItemKindVariable']
	syntax['NavicIconsConstant'] = syntax['CmpItemKindConstant']
	syntax['NavicIconsString'] = syntax['String']
	syntax['NavicIconsNumber'] = syntax['Number']
	syntax['NavicIconsBoolean'] = syntax['Boolean']
	syntax['NavicIconsArray'] = syntax['CmpItemKindClass']
	syntax['NavicIconsObject'] = syntax['CmpItemKindClass']
	syntax['NavicIconsKey'] = syntax['CmpItemKindKeyword']
	syntax['NavicIconsKeyword'] = syntax['CmpItemKindKeyword']
	syntax['NavicIconsNull'] =  {fg=colors.blue, bg=colors.none }
	syntax['NavicIconsEnumMember'] = syntax['CmpItemKindEnumMember']
	syntax['NavicIconsStruct'] = syntax['CmpItemKindStruct']
	syntax['NavicIconsEvent'] = syntax['CmpItemKindEvent']
	syntax['NavicIconsOperator'] = syntax['CmpItemKindOperator']
	syntax['NavicIconsTypeParameter'] = syntax['CmpItemKindTypeParameter']
	syntax['NavicText'] = syntax['LineNr']
	syntax['NavicSeparator'] = syntax['Comment']

	syntax['SignatureMarkText'] = {fg=colors.magenta,bg=utils.termtrans(colors.base02)}
	syntax['SignatureMarkerText'] = {fg=colors.magenta,bg=utils.termtrans(colors.base02)}

	--syntax['AutoHighlightWord'] = {fg=colors.none,bg=utils.termtrans(colors.base02),style='bold'}

	syntax['YankyPut'] = syntax['YankPaste']
	syntax['YankyYanked'] = syntax['YankPaste']

	syntax['GitvSubj'] = {fg=colors.base0}

	for group, highlights in pairs(syntax) do
		utils.highlighter(group, highlights)
	end
end

function M.terminal_colors(colors)
	g.terminal_color_0 = colors.base02[1] -- '#073642'
	g.terminal_color_1 = colors.red[1] -- '#dc322f'
	g.terminal_color_2 = colors.green[1] -- '#859900'
	g.terminal_color_3 = colors.yellow[1] -- '#b58900'
	g.terminal_color_4 = colors.blue[1] -- '#268bd2'
	g.terminal_color_5 = colors.magenta[1] -- '#d33682'
	g.terminal_color_6 = colors.cyan[1] -- '#2aa198'
	g.terminal_color_7 = colors.base2[1] -- '#eee8d5'
	g.terminal_color_8 = colors.base03[1] -- '#002b36'
	g.terminal_color_9 = colors.orange[1] -- '#cb4b16'
	g.terminal_color_10 = colors.base01[1] -- '#586e75'
	g.terminal_color_11 = colors.base00[1] -- '#657b83'
	g.terminal_color_12 = colors.base0[1] -- '#839496'
	g.terminal_color_13 = colors.violet[1] -- '#6c71c4'
	g.terminal_color_14 = colors.base1[1] -- '#93a1a1'
	g.terminal_color_15 = colors.base3[1] -- '#fdf6e3'
end

return M
