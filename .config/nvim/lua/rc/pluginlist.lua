local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  require'rc/packer'
  use {'wbthomason/packer.nvim', opt = true}


  -- ------------------------------------------------------------
  -- Library

  --------------------------------
  -- Vim script Library
  use {'tpope/vim-repeat'}
  -- use {'mattn/webapi-vim'}

  --------------------------------
  -- Lua Library
  use {'nvim-lua/popup.nvim'}
  use {'nvim-lua/plenary.nvim'}
  use {'tami5/sql.nvim'}

  --------------------------------
  -- Denops Library
  use {'vim-denops/denops.vim'}

  --------------------------------
  -- Font
  if not os.getenv("DISABLE_DEVICONS") or os.getenv("DISABLE_DEVICONS") == 'false' then
    -- use {'ryanoasis/vim-devicons'}
    use {'kyazdani42/nvim-web-devicons'}
  end


  --------------------------------------------------------------
  -- Appearance

  --------------------------------
  -- ColorScheme
  local colorscheme = 'gruvbox-material'
  use {'sainnhe/gruvbox-material',
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/gruvbox-material.vim') end
  }
  -- use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

  --------------------------------
  -- Statusline
  use {'glepnir/galaxyline.nvim', branch = 'main',
    after = colorscheme,
    config = function() require'rc/pluginconfig/galaxyline' end
  }

  ----------------------------------
  ---- Syntax
  -- use {'sheerun/vim-polyglot',
  --   event = "VimEnter",
  --   setup = function() vim.cmd('source ~/.config/nvim/rc/pluginsetup/vim-polyglot.vim') end,
  --   config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-polyglot.vim') end
  -- }

  --------------------------------
  -- Highlight
  -- coc-highlight
  use {'chrisbra/Colorizer',
    cmd = {'ColorHighlight'},
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/Colorizer.vim') end
  } -- -> same as vim-plugin-AnsiEsc. But it cannot do colorize

  --------------------------------
  -- Filetype detection
  -- use {'vitalk/vim-shebang'} -- -> vim-polyglot

  --------------------------------
  -- Layout
  use {'myusuf3/numbers.vim',
    cmd = { 'NumbersToggle', 'NumbersOnOff' },
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/numbers.vim') end
  }
  use {'kdav5758/TrueZen.nvim',
    cmd = { 'TZAtaraxis', 'TZMinimalist', 'TZBottom', 'TZTop', 'TZLeft' },
  }

  --------------------------------
  -- Menu
  use {'skywind3000/vim-quickui',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-quickui.vim') end
  }
  use {'kizza/actionmenu.nvim',
    event = "VimEnter",
  }

  --------------------------------
  -- StartMenu
  -- use {'mhinz/vim-startify',
  --   config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-startify.vim') end
  -- }
  use {'glepnir/dashboard-nvim',
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/dashboard-nvim.vim') end
  }

  --------------------------------
  -- Scrollbar
  -- performance problem
  -- use {'Xuyuanp/scrollbar.nvim'}
  use {'dstein64/nvim-scrollview',
    after = colorscheme,
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/nvim-scrollview.vim') end
  }

  --------------------------------
  -- Cursor
  use {'edluffy/specs.nvim',
    event = "VimEnter",
    config = function() require'rc/pluginconfig/specs' end
  }

  --------------------------------
  -- Sign
  -- buggy
  -- use {'dsummersl/nvim-sluice'}

  --------------------------------
  -- Minimap
  if vim.fn.executable('cargo') == 1 then
    use {'wfxr/minimap.vim',
      event = "VimEnter",
      run = 'cargo install --locked code-minimap'
    }
  end


  -- ------------------------------------------------------------
  -- Editing

  -- ------------------------------
  --  Key Bind (Map)
  use {'tpope/vim-rsi',
    event = "VimEnter",
  }
  use {'kana/vim-smartchr',
    event = "VimEnter",
  }
  use {'kana/vim-arpeggio',
    event = "VimEnter"
  }
  use {'tpope/vim-sexp-mappings-for-regular-people',
    event = "VimEnter"
  }

  --------------------------------
  -- Move
  use {'phaazon/hop.nvim',
    event = "VimEnter",
    config = function() require'rc/pluginconfig/hop' end
  }
  ----------------
  -- Horizontal Move
  use {'rhysd/clever-f.vim',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/clever-f.vim') end
  }
  use {'unblevable/quick-scope',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/quick-scope.vim') end
  }

  ----------------
  -- Virtical Move
  use {'haya14busa/vim-edgemotion',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-edgemotion.vim') end
  }
  use {'machakann/vim-columnmove',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-columnmove.vim') end
  }

  ----------------
  -- Word Move
  use {'justinmk/vim-ipmotion',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-ipmotion.vim') end
  }
  use {'bkad/CamelCaseMotion',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/CamelCaseMotion.vim') end
  }
  use {'yutkat/wb-only-current-line.vim',
    event = "VimEnter",
  }

  --------------------------------
  -- Jump
  use {'osyo-manga/vim-milfeulle',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-milfeulle.vim') end
  }
  use {'Bakudankun/BackAndForward.vim',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/BackAndForward.vim') end
  }
  use {'arp242/jumpy.vim',
    event = "VimEnter",
  }
  -- not useful but cool
  -- use {'nacro90/numb.nvim',
  --  config = function() require'rc/pluginconfig/numb' end
  -- }

  --------------------------------
  -- Scroll
  -- use {'psliwka/vim-smoothie'} -- slow

  --------------------------------
  -- Select
  use {'terryma/vim-expand-region',
    event = "VimEnter",
    setup = function() vim.cmd('source ~/.config/nvim/rc/pluginsetup/vim-expand-region.vim') end
  }
  use {'terryma/vim-multiple-cursors',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-multiple-cursors.vim') end
  }
  -- use {'mg979/vim-visual-multi'} -- -> mapping infection
  use {'matze/vim-move',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-move.vim') end
  }

  --------------------------------
  -- Edit/Insert
  use {'junegunn/vim-easy-align',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-easy-align.vim') end
  }
  use {'dhruvasagar/vim-table-mode',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-table-mode.vim') end
  }
  use {'thinca/vim-partedit',
    event = "VimEnter",
  }
  use {'yutkat/delete-word-to-chars.vim',
    event = "VimEnter",
  }

  --------------------------------
  -- Text Object
  use {'kana/vim-textobj-user',
    event = "VimEnter",
  }
  use {'kana/vim-textobj-line',
    after = {'vim-textobj-user'}
  }
  use {'kana/vim-textobj-entire',
    after = {'vim-textobj-user'}
  }
  use {'kana/vim-textobj-function',
    after = {'vim-textobj-user'}
  }
  use {'reedes/vim-textobj-sentence',
    after = {'vim-textobj-user'}
  }
  use {'machakann/vim-textobj-functioncall',
    after = {'vim-textobj-user'},
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-textobj-functioncall.vim') end
  }
  -- Not much maintenance lately
  --use {'wellle/targets.vim'} -- -> kana/vim-textobj-user

  -- do not use
  --use {'sgur/vim-textobj-parameter'} -- -> vim-swap
  -- 'thinca/vim-textobj-between' -- -> sandwich
  -- 'mattn/vim-textobj-url'
  -- slow on startup
  --use {'kana/vim-textobj-indent'}
  --use {'haya14busa/vim-textobj-function-syntax'}
  --use {'kana/vim-textobj-datetime'}
  --use {'lucapette/vim-textobj-underscore'}

  --------------------------------
  -- Operator
  use {'kana/vim-operator-user',
    event = "VimEnter"
  }
  use {'kana/vim-operator-replace',
    after = {'vim-operator-user'},
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-operator-replace.vim') end
  }
  use {'machakann/vim-sandwich',
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-sandwich.vim') end
  }
  use {'machakann/vim-swap',
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-swap.vim') end
  }
  use {'mopp/vim-operator-convert-case',
    after = {'vim-operator-user'},
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-operator-convert-case.vim') end
  }
  -- use {'osyo-manga/vim-operator-stay-cursor'}

  -----------------
  -- Join
  use {'AndrewRadev/splitjoin.vim',opt = true,
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/splitjoin.vim') end
  }
  -- compare to splitjoin
  -- use {
  --   'AckslD/nvim-revJ.lua',
  --   requires = {'sgur/vim-textobj-parameter'},
  -- }

  -----------------
  -- Adding and subtracting
  use {'deris/vim-rengbang',
    event = "VimEnter"
  }
  use {'syngan/vim-clurin',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-clurin.vim') end
  }
  use {'monaqa/dial.nvim',
    event = "VimEnter",
    config = function() require'rc/pluginconfig/dial' end
  }
  -- use {'zegervdv/nrpattern.nvim',
  --   config = function() require'rc/pluginconfig/nrpattern' end
  -- }

  --------------------------------
  -- Yank
  -- https://github.com/neovim/neovim/issues/1822
  use {'bfredl/nvim-miniyank',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/nvim-miniyank.vim') end
  }
  use {'yutkat/osc52.nvim',
    event = "VimEnter"
  }
  use {'chikatoike/concealedyank.vim',
    event = "VimEnter"
  }
  use {'yutkat/save-clipboard-on-exit.vim',
    event = "VimEnter"
  }

  --------------------------------
  -- Paste
  use {'junegunn/vim-peekaboo',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-peekaboo.vim') end
  }
  use {'yutkat/auto-paste-mode.vim',
    event = "VimEnter"
  }
  use {'tversteeg/registers.nvim',
    event = "VimEnter"
  }


  --------------------------------------------------------------
  -- Search

  --------------------------------
  -- Find
  use {'kevinhwang91/nvim-hlslens',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/nvim-hlslens.vim') end
  }
  use {'haya14busa/vim-asterisk',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-asterisk.vim') end
  }
  use {'t9md/vim-quickhl',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-quickhl.vim') end
  }

  --------------------------------
  -- Replace
  use {'lambdalisue/reword.vim',
    event = "VimEnter"
  }
  use {'haya14busa/vim-metarepeat',
    event = "VimEnter"
  }

  --------------------------------
  -- Grep tool
  use {'mhinz/vim-grepper',
    cmd = {'Grepper'}
  }
  -- use {'dyng/ctrlsf.vim'}


  --------------------------------------------------------------
  -- File switcher

  --------------------------------
  -- Open
  use {'wsdjeg/vim-fetch',
    event = "VimEnter"
  }

  --------------------------------
  -- Buffer
  -- included barbar.nvim
  -- use {'schickling/vim-bufonly',
  --   event = "VimEnter"
  -- }
  -- included barbar.nvim
  -- use {'moll/vim-bbye',
  --   event = "VimEnter",
  --   config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-bbye.vim') end
  -- }

  --------------------------------
  -- Buffer switcher
  if not vim.g.vscode then
    use {'romgrk/barbar.nvim',
      after = colorscheme,
      config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/barbar.vim') end
    }
  end

  --------------------------------
  -- Tab
  -- use {'kana/vim-tabpagecd'}
  --use {'taohex/lightline-buffer'} -- -> 今後に期待

  --------------------------------
  -- Filer
  -- -> coc-explorer
  -- use {'yegappan/mru'} -- ファイル編集履歴リスト

  --------------------------------
  -- Window
  -- use {'dstein64/vim-win',
  --   config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-win.vim') end
  -- }
  use {'tkmpypy/chowcho.nvim',
    event = "VimEnter",
    config = function() require'rc/pluginconfig/chowcho' end
  }
  use {'andymass/vim-tradewinds',
    event = "VimEnter"
  }
  -- integrate tmux pane
  -- use {'numToStr/Navigator.nvim',
  --   config = function() require'rc/pluginconfig/Navigator' end
  -- }
  -- interesting but not use
  -- use {'blueyed/vim-diminactive',
  --   config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-diminactive.vim') end
  -- }
  -- interesting but not use
  -- use {'zhaocai/GoldenView.Vim',
  --   config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/GoldenView.vim') end
  -- }


  ------------------------------------------------------------
  -- Standard Feature Enhancement

  --------------------------------
  -- Undo
  use {'simnalamburt/vim-mundo',
    event = "VimEnter"
  }
  --use {'mbbill/undotree'} -- -> not maintained recently
  -- cool but too slow
  -- if not vim.g.vscode then
  --   use {'machakann/vim-highlightedundo',
  --     config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-highlightedundo.vim') end
  --   }
  -- end

  --------------------------------
  -- Diff
  use {'AndrewRadev/linediff.vim',
    event = "VimEnter"
  }
  use {'chrisbra/vim-diff-enhanced',
    event = "VimEnter"
  }

  --------------------------------
  -- Mark
  use {'kshenoy/vim-signature',opt = true,
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-signature.vim') end
  }
  use {'MattesGroeger/vim-bookmarks',opt = true,
    event = "VimEnter",
    setup = function() vim.cmd('source ~/.config/nvim/rc/pluginsetup/vim-bookmarks.vim') end,
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-bookmarks.vim') end
  }

  --------------------------------
  -- Fold
  use {'lambdalisue/readablefold.vim',
    event = "VimEnter"
  }

  --------------------------------
  -- Manual
  use {'thinca/vim-ref',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-ref.vim') end
  }
  use {'reireias/vim-cheatsheet',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-cheatsheet.vim') end
  }
  use {'liuchengxu/vim-which-key',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-which-key.vim') end
  }

  --------------------------------
  -- Help
  use {'notomo/helpeek.vim',
    cmd = {'Helpeek'},
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/helpeek.vim') end
  }

  --------------------------------
  -- Tag
  use {'jsfaint/gen_tags.vim',
    -- event = "VimEnter",
    cond = function() return vim.fn.executable('global') == 1 end,
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/gen_tags.vim') end
  }
  use {'pechorin/any-jump.vim',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/any-jump.vim') end
  }

  --------------------------------
  -- Quickfix
  use {'tyru/qfhist.vim',
    event = "VimEnter"
  }
  -- https://github.com/ronakg/quickr-preview.vim/issues/19
  --use {'ronakg/quickr-preview.vim'}
  use {'drmingdrmer/vim-toggle-quickfix',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-toggle-quickfix.vim') end
  }
  use {'yssl/QFEnter',
    event = "VimEnter"
  }
  -- conflict with vim-test's quickfix
  --use {'itchyny/vim-qfedit' --should compare with use 'stefandtw/quickfix-reflector.vim'}
  use {'kevinhwang91/nvim-bqf',
    event = "VimEnter"
  }
  use {'gabrielpoca/replacer.nvim',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/replacer.vim') end
  }
  -- conflict quickr-preview.vim
  -- detected while processing BufDelete Autocommands for --<buffer=2>--:
  -- use {'romainl/vim-qf'}

  --------------------------------
  -- Session
  -- vim-startify
  --use {'tpope/vim-obsession'}
  -- I don't want to restore automatically
  --use {'thaerkh/vim-workspace'}

  --------------------------------
  -- Macro
  use {'zdcthomas/medit',
    event = "VimEnter"
  }

  --------------------------------
  -- SpellCheck
  -- coc-spell-checker
  -- coc-spell-checker is better because I don't know how to spell it correctly
  -- use {'reedes/vim-wordy'}
  -- use {'reedes/vim-lexical'}
  -- use {'dpelle/vim-LanguageTool'}
  if vim.fn.executable('java') == 1 then
    use {'rhysd/vim-grammarous',
    cmd = {'GrammarousCheck'}
  }
  end

  --------------------------------
  -- SpellCorrect (iabbr)
  -- use {'tpope/vim-abolish'}
  -- use {'jdelkins/vim-correction'} -- too slow. it takes 300ms
  -- use {'reedes/vim-litecorrect'}
  -- use {'panozzaj/vim-autocorrect'}
  -- use {'vim-scripts/wordlist.vim' can'}t load lazy

  --------------------------------
  -- Command
  use {'lambdalisue/suda.vim',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/suda.vim') end
  }
  use {'tyru/capture.vim',
    event = "VimEnter"
  }
  use {'thinca/vim-ambicmd',
    event = "VimEnter"
  }
  use {'tyru/vim-altercmd',
    event = "VimEnter"
  }
  -- -> filer
  -- use {'tpope/vim-eunuch'}

  --------------------------------
  -- Commandline
  use {'yutkat/CmdlineComplete',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/CmdlineComplete.vim') end
  }
  use {'gelguy/wilder.nvim',
    event = "VimEnter",
    run = ':UpdateRemotePlugins',
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/wilder.vim') end
  }

  --------------------------------
  -- History
  use {'yutkat/history-ignore.vim',
    event = "VimEnter"
  }

  --------------------------------
  -- Visual Mode
  use {'kana/vim-niceblock',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-niceblock.vim') end
  }

  --------------------------------
  -- Terminal
  use {'voldikss/vim-floaterm',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-floaterm.vim') end
  }
  use {'lambdalisue/edita.vim',
    event = "VimEnter"
  }
  --use {'kassio/neoterm'} -- include repl
  --use {'akinsho/nvim-toggleterm.lua'}
  --use {'numToStr/FTerm.nvim'}

  --------------------------------
  -- Backup/Swap
  use {'aiya000/aho-bakaup.vim',
    event = "VimEnter",
    setup = function() vim.cmd('source ~/.config/nvim/rc/pluginsetup/aho-bakaup.vim') end
  }
  --use {'chrisbra/vim-autosave'}

  --------------------------------
  -- Quit
  use {'yutkat/confirm-quit.nvim',
    event = "VimEnter"
  }

  --------------------------------------------------------------
  -- New features

  --------------------------------
  -- Translate
  -- coc-translator
  use {'voldikss/vim-translator',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-translator.vim') end
  }

  --------------------------------
  -- Screenshot
  use {'segeljakt/vim-silicon',
    cmd = {'Silicon'}
  }

  --------------------------------
  -- Memo
  use {'glidenote/memolist.vim',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/memolist.vim') end
  }

  --------------------------------
  -- Scratch
  use {'mtth/scratch.vim',
    cmd = {'Scratch'},
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/scratch.vim') end
  }

  --------------------------------
  -- Hex
  use {'Shougo/vinarise.vim',
    cmd = {'Vinarise'}
  }

  --------------------------------
  -- Browser integration
  use {'tyru/open-browser.vim',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/open-browser.vim') end
  }
  use {'tyru/open-browser-github.vim',
    after = {'open-browser.vim'}
  }

  --------------------------------
  -- Mode extension
  use {'kana/vim-submode',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-submode.vim') end
  }

  --------------------------------
  -- Template
  -- repository not found
  -- use {'johannesthyssen/vim-signit',
  --   cmd = {'Signit'}
  -- }
  use {'mattn/vim-sonictemplate',
    event = "VimEnter"
  }
  -- because generate the file contents automatically
  -- use {'vigoux/templar.nvim',
  --   event = "VimEnter"
  -- }

  --------------------------------
  -- Analytics
  if not os.getenv('DISABLE_WAKATIME') or os.getenv('DISABLE_WAKATIME') == 'true' then
    if vim.fn.filereadable(vim.fn.expand('~/.wakatime.cfg')) == 1 then
      use {'wakatime/vim-wakatime',
        event = "VimEnter",
      }
    end
  end

  --------------------------------
  -- LiveShare
  -- use {'jbyuki/instant.nvim'}

  --------------------------------
  -- Patch
  --https://github.com/neovim/neovim/issues/12587
  -- Cursor position shifted when indentation is lost
  --if has('nvim')
  --  use {'antoinemadec/FixCursorHold.nvim'}
  --endif

  --------------------------------
  -- etc
  use {'thinca/vim-scouter',
    cmd = {'Scouter'}
  }
  use {'yutkat/dps-coding-now.nvim',
    cond = function() return os.getenv("CODING_NOW_GITHUB_TOKEN") ~= nil end,
    after = {'denops.vim'}
  }


  --------------------------------------------------------------
  -- FuzzyFinders

  --------------------------------
  -- fzf
  use {'junegunn/fzf',
    event = "VimEnter",
    run = './install --all --no-update-rc'
  }
  use {'junegunn/fzf.vim',
    after = {'fzf'},
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/fzf.vim') end
  }

  --------------------------------
  -- telescope.nvim
  use {'nvim-telescope/telescope.nvim',
    event = "VimEnter",
    after = {'popup.nvim', 'plenary.nvim', colorscheme},
    config = function() require'rc/pluginconfig/telescope' end
  }
  use {'nvim-telescope/telescope-github.nvim',
    after = {'telescope.nvim'},
    config = function() require('telescope').load_extension('gh') end
  }
  use {'nvim-telescope/telescope-project.nvim',
    after = {'telescope.nvim'},
    config = function() require('telescope').load_extension('project') end
  }
  use {'nvim-telescope/telescope-vimspector.nvim',
    after = {'telescope.nvim'},
    config = function() require('telescope').load_extension('vimspector') end
  }
  use {'nvim-telescope/telescope-symbols.nvim',
    after = {'telescope.nvim'}
  }
  use {'nvim-telescope/telescope-ghq.nvim',
    after = {'telescope.nvim'},
    config = function() require('telescope').load_extension('ghq') end
  }
  use {'nvim-telescope/telescope-fzf-writer.nvim',
    after = {'telescope.nvim'},
    config = function() require('telescope').load_extension('fzf_writer') end
  }
  use {'nvim-telescope/telescope-frecency.nvim',
    after = {'telescope.nvim'},
    config = function() require('telescope').load_extension('frecency') end
  }
  use {'nvim-telescope/telescope-packer.nvim',
    after = {'telescope.nvim'},
  }
  use {'GustavoKatel/telescope-asynctasks.nvim',
    after = {'telescope.nvim'},
  }
  use {'fannheyward/telescope-coc.nvim',
    after = {'telescope.nvim'},
    config = function() require('telescope').load_extension('coc') end
  }
  -- use {"sunjon/telescope-arecibo.nvim",
  --   after = {'telescope.nvim'},
  --   rocks = {"openssl", "lua-http-parser"},
  --   config = function() require('telescope').load_extension('arecibo') end
  -- }
    -- use {'tami5/sql.nvim'}
  --use {'nvim-telescope/telescope-snippets.nvim'}
  --  use {'norcalli/snippets.nvim'}
  --use {'delphinus/telescope-z.nvim'}
  --use {'delphinus/telescope-memo.nvim'}
  if vim.fn.executable('ueberzug') == 1 then
    use {'nvim-telescope/telescope-media-files.nvim',
      after = {'telescope.nvim'},
      config = function() require('telescope').load_extension('media_files') end
    }
  end

  --------------------------------
  -- other
  -- use {'liuchengxu/vim-clap', { 'do': function('clap#helper#build_all'}) }


  --------------------------------------------------------------
  -- Coding

  --------------------------------
  -- Writing assistant
  use {'tpope/vim-sleuth',
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-sleuth.vim') end,
    cmd = { 'Sleuth' },
  }
  use {'lfilho/cosco.vim',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/cosco.vim') end
  }
  use {'akinsho/dependency-assist.nvim',
    event = "VimEnter",
    config = function() require'rc/pluginconfig/dependency-assist' end
  }

  --------------------------------
  -- Comment out
  use {'b3nj5m1n/kommentary',
    event = "VimEnter",
    config = function() require'rc/pluginconfig/kommentary' end
  }
  -- use {'cometsong/CommentFrame.vim',
  --   event = "VimEnter",
  --   setup = function() vim.cmd('source ~/.config/nvim/rc/pluginsetup/CommentFrame.vim') end
  -- }

  --------------------------------
  -- Brackets
  use {'andymass/vim-matchup',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-matchup.vim') end
  }
  use {'windwp/nvim-autopairs',
    event = "VimEnter",
    config = function() require'rc/pluginconfig/nvim-autopairs' end
  }
  use {'windwp/nvim-ts-autotag',
    after = {'nvim-treesitter'},
    config = function() require'rc/pluginconfig/nvim-ts-autotag' end
  }

  --------------------------------
  -- Reading assistant
  -- use {'Yggdroot/indentLine',
  --   config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/indentLine.vim') end
  -- }
  use {'glepnir/indent-guides.nvim',
    event = "VimEnter",
    config = function() require'rc/pluginconfig/indent-guides' end
  }
  use {'kristijanhusak/line-notes.nvim',
    event = "VimEnter",
    config = function() require'rc/pluginconfig/line-notes' end
  }
  -- romgrk/nvim-treesitter-context

  --------------------------------
  -- Code jump
  --   use {'ElPiloto/sidekick.nvim'}
  use {'liuchengxu/vista.vim',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vista.vim') end
  }
  -- require nvim-lsp
  -- use {'simrat39/symbols-outline.nvim',
  --   event = "VimEnter",
  --   config = function() require'rc/pluginconfig/symbols-outline' end
  -- }
  use {'kana/vim-altr',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-altr.vim') end
  }
  use {'tpope/vim-apathy',
    event = "VimEnter"
  }

  --------------------------------
  -- Task runner
  use {'janko-m/vim-test',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-test.vim') end
  }
  use {'skywind3000/asyncrun.vim',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/asyncrun.vim') end
  }
  use {'skywind3000/asynctasks.vim',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/asynctasks.vim') end
  }
  use {'powerman/vim-plugin-AnsiEsc',
    event = "VimEnter"
  }

  --------------------------------
  -- Lint

  --------------------------------
  -- Format
  use {'editorconfig/editorconfig-vim',
    event = "VimEnter"
  }
  use {'lukas-reineke/format.nvim',
    event = "VimEnter",
    config = function() require'rc/pluginconfig/format' end
  }
  use {'ntpeters/vim-better-whitespace',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-better-whitespace.vim') end
  }
  -- use {'google/vim-codefmt',
  --   requires = {'google/vim-maktaba'},
  --   config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-codefmt.vim') end
  -- }
  -- use {'mhartington/formatter.nvim'}
  -- use {'sbdchd/neoformat'}
  --use {'Chiel92/vim-autoformat'} -- -> neoformat supports more languages

  --------------------------------
  -- Auto Completion
  if vim.fn.executable('node') == 1 then
    use {'neoclide/coc.nvim', branch = 'release',
      config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/coc.vim') end
    }
    use {'antoinemadec/coc-fzf', branch = 'release',
      event = "VimEnter",
      config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/coc-fzf.vim') end
    }
    use {'rafcamlet/coc-nvim-lua',
      event = "VimEnter"
    }

    vim.g.coc_global_extensions = {
      'coc-marketplace',
      'coc-tag',
      'coc-dictionary',
      'coc-word',
      'coc-yank',
      'coc-floaterm',
      'coc-floatinput',
      'coc-highlight', -- -> alternative nvim-treesitter/nvim-treesitter-refactor
      'coc-just-complete',
      'coc-dot-complete',
      'coc-dash-complete',
      'coc-emoji',
      'coc-omni',
      'coc-syntax',
      'coc-emmet',
      'coc-lists',
      'coc-snippets',
      'coc-postfix',
      'coc-markdownlint',
      'coc-json',
      'coc-yaml',
      'coc-toml',
      'coc-sh',
      'coc-vimlsp',
      'coc-pyright',
      'coc-rust-analyzer',
      'coc-clangd',
      'coc-html',
      'coc-css',
      'coc-db',
      'coc-diagnostic',
      'coc-git',
      'coc-gitignore',
      'coc-explorer',
      'coc-spell-checker',
      'coc-project',
      'coc-terminal',
      'coc-tasks',
      'coc-todolist',
      'coc-translator',
      'coc-calc',
    }
    -- 'coc-template', -- -> archived
    -- 'coc-python',
    -- 'coc-lines', -- -> too many candidates for completion
    -- 'coc-pairs', -- -> change lexima because it's too simple
    -- 'coc-smartf', -- -> clever-f, easymotion I want to search with only one line, but it can't
    -- 'coc-actions' -- -> use coc-codeaction

    if vim.fn.executable('nextword') == 1 then
      vim.cmd("call add(g:coc_global_extensions, 'coc-nextword')")
    end

    if vim.fn.executable('lua-language-server') == 1 then
      vim.cmd("call add(g:coc_global_extensions, 'coc-lua')")
    end
    if vim.fn.executable('typescript-language-server') == 1 then
      vim.cmd("call add(g:coc_global_extensions, 'coc-tsserver')")
      vim.cmd("call add(g:coc_global_extensions, 'coc-deno')")
    end
    if vim.fn.exists('$SSH_CLIENT') == 0 and vim.fn.exists('$SSH_TTY') == 0
        and vim.fn.exists('$SSH_CONNECTION') == 0 then
      vim.cmd("call add(g:coc_global_extensions, 'coc-tabnine')")
      vim.cmd("call add(g:coc_global_extensions, 'coc-gist')")
    end
    if vim.fn.executable('systemctl') == 1 then
      if os.execute() == 1 then
        if os.execute('systemctl --user is-active -q kite-autostart') == 0 then
          vim.cmd("call add(g:coc_global_extensions, 'coc-kite')")
        end
      end
    end
  end

  --------------------------------
  -- Language Server Protocol(LSP)
  -- coc.nvim
  use {'voldikss/vim-skylight',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-skyligh.vim') end
  }

  --------------------------------
  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter',
    event = "VimEnter",
    run = ':TSUpdate',
    config = function() require'rc/pluginconfig/nvim-treesitter' end
  }
  use {'vigoux/architext.nvim',
    after = {'nvim-treesitter'},
  }
  use {'nvim-treesitter/nvim-treesitter-refactor',
    after = {'nvim-treesitter'},
  }
  use {'nvim-treesitter/nvim-treesitter-textobjects',
   after = {'nvim-treesitter'},
  }
  use {'nvim-treesitter/nvim-tree-docs',
    after = {'nvim-treesitter'},
  }
  use {'romgrk/nvim-treesitter-context',
    -- after = {'nvim-treesitter'},
    cmd = {'TSContextEnable'}
  }
  use {'bryall/contextprint.nvim',
    after = {'nvim-treesitter'},
    config = function() require'rc/pluginconfig/contextprint' end
  }
  use {'p00f/nvim-ts-rainbow',
    after = {'nvim-treesitter'},
  }
  use {'code-biscuits/nvim-biscuits',
    after = {'nvim-treesitter'},
    config = function() require'rc/pluginconfig/nvim-biscuits' end
  }
  use {'theHamsta/nvim-treesitter-pairs',
    after = {'nvim-treesitter'},
  }
  -- useful for react?
  -- use {'JoosepAlviste/nvim-ts-context-commentstring'}

  --------------------------------
  -- Tabnine
  -- use {'zxqfl/tabnine-vim'}

  --------------------------------
  -- Snippet
  use {'honza/vim-snippets',
    event = "VimEnter"
  }

  --------------------------------
  -- Project
  use {'airblade/vim-rooter',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-rooter.vim') end
  }
  use {'embear/vim-localvimrc',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-localvimrc.vim') end
  }
  -- lua buf too simple
  -- use {'windwp/nvim-projectconfig'}

  --------------------------------
  -- Git
  use {'lambdalisue/gina.vim',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/gina.vim') end
  }
  use {'cohama/agit.vim',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/agit.vim') end
  }
  use {'rhysd/committia.vim'}
  use {'rhysd/git-messenger.vim',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/git-messenger.vim') end
  }
  use {'rhysd/conflict-marker.vim',
    event = "VimEnter"
  }
  use {'hotwatermorning/auto-git-diff'}
  use {'yutkat/convert-git-url.vim',
    event = "VimEnter"
  }
  -- use {'gotchane/vim-git-commit-prefix'}

  --------------------------------
  -- GitHub
  use {'pwntester/octo.nvim',
    cmd = {'Octo'}
  }

  --------------------------------
  -- Debug
  use {'puremourning/vimspector',
    run = './install_gadget.py --all',
    cmd = { 'VimspectorReset' },
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vimspector.vim') end
  }
  -- use {'mfussenegger/nvim-dap'}
  -- use {'theHamsta/nvim-dap-virtual-text'}
  -- use {'nvim-telescope/telescope-dap.nvim'}
  use {'sentriz/vim-print-debug',
    event = "VimEnter",
    config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-print-debug.vim') end
  }
  if vim.fn.executable('cargo') == 1 then
    use {'michaelb/sniprun',
      run = 'bash install.sh',
      cmd = {'SnipRun'}
    }
  end

  --------------------------------
  -- REPL
  use {'hkupty/iron.nvim',
    event = "VimEnter"
  }
  -- use {'metakirby5/codi.vim',
  --   event = "VimEnter"
  -- }
  --use {'sillybun/vim-repl'}
  --use {'hkupty/iron.nvim'}


  --------------------------------------------------------------
  -- Programing Languages

  --------------------------------
  -- Clang

  --------------------------------
  -- Java
  -- use {'google/ijaas'}, {
  --       \   'rtp': 'vim',
  --       \   'for': ['c', 'cpp', 'java'],
  --       \ }

  --------------------------------
  -- Groovy
  -- use {'thecodesmith/vim-groovy',
  --   ft = {'groovy'},
  -- }

  --------------------------------
  -- HTML

  --------------------------------
  -- CSS

  --------------------------------
  -- Javascript

  --------------------------------
  -- Vue

  --------------------------------
  -- Riot

  --------------------------------
  -- Python
  -- use {'python-mode/python-mode',
  --   branch = 'develop',
  --   ft = {'python'},
  --   config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/python-mode.vim') end
  -- }
  -- use {'mgedmin/python-imports.vim',
  --   ft = {'python'}
  -- }

  ----------------------------------
  -- Ruby
  --use {'tpope/vim-rails'}, {
  --    \   'for': ['ruby']
  --    \ }
  --use {'thoughtbot/vim-rspec'}, {
  --    \   'for': ['ruby']
  --    \ }

  --------------------------------
  -- PHP
  -- use {'violetyk/cake.vim',
  --   ft = {'php'}
  -- }

  --------------------------------
  -- Go
  -- coc.nvim

  --------------------------------
  -- Rust
  -- use {'rust-lang/rust.vim',
  --   ft = {'rust'},
  --   config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/rust.vim') end
  -- }
  -- use {'rhysd/rust-doc.vim',
  --   ft = {'rust'},
  --   config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/rust-doc.vim') end
  -- }

  --------------------------------
  -- Elixir
  -- use {'slashmili/alchemist.vim',
  --   ft = {'elixir'}
  -- }

  --------------------------------
  -- ansible

  --------------------------------
  -- Terraform

  --------------------------------
  -- Markdown
  use {'iamcco/markdown-preview.nvim',
    ft = {'markdown'},
    run = ':call mkdp#util#install()',
  }
  -- use markdown-preview.nvim
  -- if vim.fn.executable('glow') then
  --   use {'npxbr/glow.nvim',
  --     ft = {'markdown'},
  --     run = ':GlowInstall',
  --   }
  -- end
  use {'SidOfc/mkdx',
    ft = {'markdown'},
    setup = function() vim.cmd('source ~/.config/nvim/rc/pluginsetup/mkdx.vim') end
  }
  -- slow to build
  -- use {'euclio/vim-markdown-composer',
  --   run = 'cargo build --release'
  -- }

  --------------------------------
  -- DB
  --use {'dbext.vim'} -- helptagのエラーが出る。とりあえず使わないので無効。
  use {'tpope/vim-dadbod',
    event = "VimEnter"
  }
  use {'alcesleo/vim-uppercase-sql',
    event = "VimEnter"
  }

  --------------------------------
  -- CSV
  use {'mechatroner/rainbow_csv',
    ft = {'csv'}
  }

  --------------------------------
  -- Json
  use {'neoclide/jsonc.vim',
    ft = {'json', 'jsonc'}
  }

  --------------------------------
  -- PlantUML
  use {'scrooloose/vim-slumlord',
    ft =  {'plantuml'}
  }

  --------------------------------
  -- Shellscript
  -- -> format.nvim
  -- if vim.fn.executable('shfmt') == 1 then
  --   use {'z0mbix/vim-shfmt',
  --     ft = {'sh', 'zsh'},
  --     setup = function() vim.cmd('source ~/.config/nvim/rc/pluginsetup/vim-shfmt.vim') end
  --   }
  -- end

  --------------------------------
  -- Vimscript
  use {'mopp/layoutplugin.vim',
    cmd = {'LayoutPlugin'}
  }
  -- use {'vim-jp/vital.vim'}
  -- use LSP
  -- use {'Shougo/neco-vim'}
  -- use {'neoclide/coc-neco',
  --   ft = {'vim'}
  -- }
  use {'wadackel/nvim-syntax-info',
    cmd = {'SyntaxInfo'}
  }

  --------------------------------
  -- Neovim Lua
  use {'tjdevries/nlua.nvim',
    event = "VimEnter"
  }
  use {'tjdevries/manillua.nvim',
    event = "VimEnter"
  }
  use {'bfredl/nvim-luadev',
    event = "VimEnter"
  }

  --------------------------------
  -- Log
  use {'MTDL9/vim-log-highlighting',
    ft = {'log'}
  }


  --------------------------------------------------------------
  -- Load local plugins
  if vim.fn.filereadable(vim.fn.expand('~/.vimrc.pluginlist.local')) == 1 then
    vim.cmd('source ~/.vimrc.pluginlist.local')
  end


end)


  -- ==============================================================
--           Disable                                          {{{
-- ==============================================================

-- -> TrueZen.nvim
  -- use {'junegunn/goyo.vim',
  --   cmd = { 'Goyo' },
  -- }
-- -> wadackel/nvim-syntax-info
  -- use {'cocopon/inspecthi.vim',
  --   cmd = {'Inspecthi'}
  -- }
-- -> memolist
-- Shougo/junkfile.vim
-- -> Gina chaperon
  -- use {'idanarye/vim-merginal'}
-- b3nj5m1n/kommentary
  --use {'tyru/caw.vim',
  --  config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/caw.vim') end
  --}
  -- use {'terrortylor/nvim-comment'}
  -- use {'preservim/nerdcommenter',
  --   config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/nerdcommenter.vim') end
  -- }
  --use {'tomtom/tcomment_vim'}
-- asyncrun
  -- use {'igemnace/vim-makery'}
-- my autocmd
  -- use {'jeffkreeftmeijer/vim-numbertoggle'}
-- vim-win
  -- use {'simeji/winresizer',
  --   config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/winresizer.vim') end
  -- }
-- -> replacer.nvim
  -- use {'brooth/far.vim'}
-- vim-swap
  -- use {'AndrewRadev/sideways.vim',
  --   cmd = {'SidewaysLeft', 'SidewaysRight'},
  -- }
-- splitjoin
  -- use {'osyo-manga/vim-jplus',
  --   config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-jplus.vim') end
  -- }
-- use {'easymotion/vim-easymotion',
--   config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/vim-easymotion.vim') end
-- }
-- use {'cohama/lexima.vim',
--   config = function() vim.cmd('source ~/.config/nvim/rc/pluginconfig/lexima.vim') end
-- }
-- -> coc-fzf-preview
--if has('nvim')
--  function! FzfPreviewInstaller() abort
--    call system('npm install -g neovim')
--    FzfPreviewInstall
--  endfunction
--  use {'yuki-ycino/fzf-preview.vim', { 'do'}: { -> FzfPreviewInstaller() } }
--endif
-- use {'fatih/vim-go'}, {
--       \   'for': ['go']
--       \ }
-- if has('nvim')
-- use {'glepnir/indent-guides.nvim'}
-- else
-- endif
-- if has('nvim')
-- else
--   use {'wellle/context.vim'}
-- endif
-- if has('nvim')
--   -- treesitter
--   -- 'p00f/nvim-ts-rainbow'
-- else
--   use {'kien/rainbow_parentheses.vim'}
-- endif
-- else
--   use {'thinca/vim-qfreplace'}
-- endif
--else
--  -- use {'obcat/vim-sclow'}
--endif
--else
--  use {'itchyny/lightline.vim'}
--endif
-- ColorScheme
--use {'micke/vim-hybrid'}
--use {'ajmwagar/vim-deus'} -- support coc
--use {'kjssad/quantum.vim'} -- support coc
--use {'kristijanhusak/vim-hybrid-material'}
--use {'rhysd/vim-color-spring-night'}
--use {'arcticicestudio/nord-vim'}
--use {'gruvbox-community/gruvbox'}
--use {'sainnhe/edge'} -- support coc and lightline
--use {'sainnhe/vim-color-forest-night'} -- support coc and lightline
--use {'cocopon/iceberg.vim'}
--use {'jonathanfilip/vim-lucius'}
--use {'tomasr/molokai'}
--use {'nanotech/jellybeans.vim'}
-- if has('nvim') && has('python3')
--  use {'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins'} }
-- else
 -- use {'lambdalisue/fern.vim'}
-- endif
--  else
--    use {'mg979/vim-xtabline'}
--  endif
-- if !has('nvim')
--   use {'haya14busa/incsearch.vim'}
--   use {'haya14busa/incsearch-fuzzy.vim'}
--   use {'osyo-manga/vim-anzu'}
-- endif
-- if !has('nvim')
--   use {'svermeulen/vim-subversive'}
-- endif
-- if ! has('nvim')
--   use {'svermeulen/vim-yoink'}
-- endif
  --use {'tbo/notion', { 'do': ':UpdateRemotePlugins'} }
  --use {'zsugabubus/vim-jumpmotion'}
  -- Not much use
  --use {'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins'} }
  -- use {'chaoren/vim-wordmotion'} -- -> CamelCaseMotion
  -- conflict with vim-xtabline https://github.com/mg979/vim-xtabline/issues/13
  --use {'rhysd/accelerated-jk'}

--use {'aperezdc/vim-template'} -- -> sonictemplate
-- I cannot use tig
--use {'iberianpig/tig-explorer.vim'}
-- only work for add & commit
--if has('nvim')
--  use {'kdheepak/lazygit.nvim'}
--endif
--use {'bogado/file-line'} -- -> vim-fetch
--if has('nvim')
--  use {'f-person/git-blame.nvim'}
--endif
--use {'APZelos/blamer.nvim'} -- coc-git
--use {'jceb/vim-orgmode'} -- -> UNMAINTAINED
--use {'bignimbus/you-are-here.vim'} -- -> vim only
--use {'t9md/vim-choosewin'} -- vim-win
--use {'google/vim-searchindex'} -- -> vim-anzu
--use {'mattn/vim-gist'} -- -> coc-gist
-- -> gina. fugitive was stale.
-- -> vim-fugitive because of the improved command system.
--if str2float(matchstr(system('git --version'), '\%(\d\.\)\+\d')) >= 1.9 &&
--      \ (has('nvim') || ((v:version == 800 && has('patch27')) || v:version >= 801))
--  use {'lambdalisue/gina.vim'}
--endif
-- -> readablefold.vim
--use {'LeafCage/foldCC'}
-- -> coc.nvim
--  use {'prabirshrestha/asyncomplete.vim'}
--  use {'prabirshrestha/async.vim'}
--  use {'prabirshrestha/vim-lsp'}
--  use {'prabirshrestha/asyncomplete-lsp.vim'}
--  use {'mattn/vim-lsp-settings'}
--  use {'SirVer/ultisnips'}
--google/vim-codefmt -- -> Chiel92/vim-autoformat
--use {'tpope/vim-dispatch'} ---> asynctasks
-- machakann/vim-columnmove
--use {'tyru/columnskip.vim'}
-- -> vimspector
--if has('nvim')
--  use {'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins'} }
--endif
-- gen_tags.vim
---- https://github.com/ludovicchabant/vim-gutentags/issues/269
---- https://github.com/ludovicchabant/vim-gutentags/issues/178
--use {'ludovicchabant/vim-gutentags'}, {
--      \   'on': [ 'GutentagsToggleEnabled' ]
--      \ }
--use {'skywind3000/gutentags_plus'}
-- mcchrish/nnn.vim -- -> defx
-- coc-spell-checker
----use {'kamykn/spelunker.vim'} -- -> buffer switch is too slow
--use {'rhysd/vim-grammarous'}
--if executable('aspell')
--  use {'shinglyu/vim-codespell'}
--endif
--if !has('nvim')
--  use {'heavenshell/vim-textlint'}
--endif
--markonm/traces.vim -- -> neovim set inccommand=split
-- coc-translator
--use {'echuraev/translate-shell.vim'}
--use {'haya14busa/vim-open-googletranslate'}
--use {'mattn/vim-sonictemplate'} -- -> coc-template
-- -> mkdx
--use {'plasticboy/vim-markdown'}, {
--      \   'for': ['markdown']
--      \ }
-- rust doesn't suuport
--inkarkat/vim-CountJump
--use {'RobertCWebb/vim-jumpmethod'}
--use {'jeetsukumaran/vim-buffergator'} -- -> fzf-preview
--use {'jlanzarotta/bufexplorer' -- -> can'}t open split window vim-buffergator
-- -> fzf-preview.vim
--use {'pbogut/fzf-mru.vim'}
--use {'tweekmonster/fzf-filemru'}
--raghur/fruzzy -- -> fzf
--Yggdroot/LeaderF -- -> fzf
--lotabout/skim -- -- -> fzf
--thinca/vim-poslist -- -> osyo-manga/vim-milfeulle
--use {'mhinz/vim-signify'} -- -> coc-git
--use {'farmergreg/vim-lastplace'} -- do not use
-- tyru/caw.vim, /tomtom/tcomment_vim -- -> nerdcommenter
--use {'Shougo/neosnippet'} -- -> ultisnips
--use {'Shougo/neosnippet-snippets'}
--use {'tpope/vim-endwise'}, { -- -> cohama/lexima.vim
--      \   'for': ['ruby']
--      \ }
--use {'godlygeek/tabular'}, { -- -> dhruvasagar/vim-table-mode
--      \   'on': [ 'Tabularize' ],
--      \ }
--use {'tpope/vim-unimpaired'} -- -> slow on startup
--use {'osyo-manga/vim-automatic'} -- -> zhaocai/GoldenView.Vim because slow startup
--use {'osyo-manga/vim-trip'} -- -> syngan/vim-clurin
--use {'vim-scripts/camelcasemotion'} -- -> bkad/CamelCaseMotion because too old

-- not using
--use {'emonkak/vim-operator-comment'}
--use {'emonkak/vim-operator-sort'}
--use {'ToruIwashita/git-switcher.vim'} -- -> vim-obsession
--use {'rhysd/vim-operator-surround'} -- -> vim-sandwich
--use {'wincent/ferret'} -- -> vim-grepper
--use {'osyo-manga/vim-over'} -- -> default feature
--use {'osyo-manga/vim-hopping'} -- -> CocList
-- bootleq/vim-cycle, zef/vim-cycle, AndrewRadev/switch.vim -- -> syngan/vim-clurin
-- coc-spell-checker
--use {'inkarkat/vim-ingo-library'}
--use {'inkarkat/vim-spellcheck'}
-- inkarkat/vim-SearchHighlighting, highlight_word_under_cursor.vim,
-- HiCursorWords, bronson/vim-visual-star-search, thinca/vim-visualstar,
-- luochen1990/select-and-search, qstrahl/vim-matchmaker, itchyny/vim-cursorword,
-- timakro/vim-searchant -- -> vim-asterisk
-- use {'nelstrom/vim-visual-star-search'} -- -> conflict vim-asterisk
-- dpelle/vim-LanguageTool -- -> rhysd/vim-grammarous
-- thirtythreeforty/lessspace.vim -- vim-better-whitespace
-- tommcdo/vim-exchange -- vim-swap
-- tommcdo/vim-lion -- vim-easy-align
-- tpope/vim-sleuth -- vim-polyglot
-- romainl/vim-cool -- I don't use disables search highlighting
-- PeterRincker/vim-argumentative -- vim-swap
-- FooSoft/vim-argwrap -- I use each lang formatter
-- ryanoasis/vim-devicons -- I don't use icons
--use {'tpope/vim-fugitive'} -- -> coc-git
--use {'svermeulen/vim-easyclip'} -- -> vim-cutlass, vim-yoink, vim-subversive
--use {'LeafCage/yankround.vim'} -- -> svermeulen/vim-yoink
--use {'chrisbra/Colorizer'} -- -> coc-highlight
--use {'RRethy/vim-illuminate'} -- -> coc-highlight
--use {'vim-scripts/grep.vim'} -- -> mhinz/vim-grepper
-- use {'w0ng/vim-hybrid'} -- kristijanhusak/vim-hybrid-material
-- not support deoplete
-- let s:deoplete_enable = 0
--elseif has('nvim') && has('python3')
--  use {'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'} }
--  if exists('##CompleteChanged')
--    use {'ncm2/float-preview.nvim'}
--  endif
--  use {'Shougo/echodoc.vim'}
--  use {'Shougo/neco-syntax'}
--  let s:deoplete_enable = 1
--elseif (s:deoplete_enable == 1)
--  use {'autozimu/LanguageClient-neovim'}, {
--        \ 'branch': 'next',
--        \ 'do': 'bash install.sh',
--        \ }
--if (s:deoplete_enable == 1)
--  use {'tbodt/deoplete-tabnine', { 'do': './install.sh'} }
--else

-- dispath
-- use {'thinca/vim-quickrun'}
-- use {'dannyob/quickfixstatus'}
-- use {'KazuakiM/vim-qfstatusline'}
-- use {'osyo-manga/shabadou.vim'}

-- Use LSP
--use {'Shougo/neoinclude.vim'}, {
--      \   'for': ['c', 'cpp', 'objc']
--      \ }
--if (s:coc_enable == 1)
--  use {'jsfaint/coc-neoinclude'}, {
--      \   'for': ['c', 'cpp', 'objc']
--      \ }
--endif
-- use {'Shougo/neomru.vim'}
-- use {'justinmk/vim-dirvish'} -- -> defx
-- use {'kristijanhusak/vim-dirvish-git'}
-- use {'Xuyuanp/nerdtree-git-plugin'}
-- use {'scrooloose/nerdtree'}, { -- -> defx
--       \   'on': ['NERDTree', 'NERDTreeToggle'],
--       \ }
-- use {'majutsushi/tagbar'} -- -> vista.vim
-- use {'airblade/vim-gitgutter'} -- -> coc-git
-- if ((v:version == 800 && has('patch27')) || v:version >= 801) -- -> coc.nvim
--       \ || has('nvim')
--   use {'w0rp/ale'}
-- endif
-- use {'xolox/vim-session'} -- -> tpope/vim-obsession
-- --depend 'xolox/vim-misc'
-- use {'xolox/vim-misc'}
-- use {'tyru/operator-camelize.vim'} -- -> mopp/vim-operator-convert-case
-- use {'mattn/emmet-vim'}, { -- -> coc-emmet
--       \   'for': ['html']
--       \ }
-- use {'haya14busa/vim-operator-flashy'} -- -> coc-yank
---- depend 'kana/vim-operator-user'
-- use lsp (vim-language-server)
-- use {'vim-scripts/sudo.vim'} -- -> suda.vim
-- use {'vim-scripts/autopreview'} -- -> use lsp
-- use {'ap/vim-buftabline'} -- -> vim-xtabline
--if has('nvim') -- -> nvim-gdb
--  use {'critiqjo/lldb.nvim'}, {
--        \   'for': ['c', 'cpp'],
--        \   'do': ':UpdateRemotePlugins'
--        \ }
--endif
--use {'osyo-manga/vim-brightest'}, { -- -> RRethy/vim-illuminate
--      \   'on': [ 'BrightestEnable', 'BrightestToggle' ]
--      \ }
-- because dislike the autoclear
-- if ((v:version == 800 && has('patch1238')) || v:version >= 801)
--   use {'haya14busa/is.vim'}
-- endif
-- use {'neomake/neomake'} -- -> ale
-- too old
-- else
--   use {'Shougo/vimproc.vim'}, {
--         \   'do': 'make',
--         \ }
--   use {'osyo-manga/vim-watchdogs'}
--   use {'cohama/vim-hier'}
--   use {'KazuakiM/vim-qfsigns'}
--   --depend 'Shougo/vimproc.vim'
--   --depend 'thinca/vim-quickrun'
--   --depend 'osyo-manga/shabadou.vim'
--   --depend 'KazuakiM/vim-qfsigns'
--   --depend 'dannyob/quickfixstatus'
--   --depend 'KazuakiM/vim-qfstatusline'
--   --depend 'cohama/vim-hier'
---- neocompleteの対応を確認する
-- function! s:meet_neocomplete_requirements() abort
--   return has('lua') && (v:version > 703 || (v:version == 703
--         \ && has('patch885')))
-- endfunction
-- elseif (v:version == 800) && (has('python3') || has('python'))
--   use {'maralla/completor.vim'}
-- else
--   if s:meet_neocomplete_requirements()
--     use {'Shougo/neocomplete.vim'}
--   else
--     use {'Shougo/neocomplcache.vim'}
--   endif
--use {'Valloric/ListToggle'} -- -> vim-qf
-- united python-mode
--use {'andviro/flake8-vim'}, {
--      \   'for': ['python']
--      \ }
--use {'hynek/vim-python-pep8-indent'}, {
--      \   'for': ['python']
--     \ }
--use {'tpope/vim-surround'} -- -> vim-sandwich
--use {'greymd/oscyank.vim'} -- -> worked without this
-- use {'Houl/repmo-vim' -- -> can'}t repeat ]]
-- Error Undefined variable: mappings -> switch default to osyo-manga/vim-milfeulle
--use {'inkarkat/vim-ingo-library'}
--use {'inkarkat/vim-EnhancedJumps'}
-- Debugger
--use {'gilligan/vim-lldb'} -- -> only lldb
--use {'dbgx/lldb.nvim'} -- -> require Neovim python2-client
--use {'huawenyu/neogdb.vim'} -- -> Not supoprt lldb
--use {'vim-vdebug/vdebug'} -- -> Not support C++,Rust
--use {'skyshore2001/vgdb-vim'} -- -> Not recently updated. sakhnik/nvim-gdb
--use {'cpiger/NeoDebug'} -- -> Not recently updated.
--use {'vim-scripts/Conque-GDB'} -- -> too old
--use {'idanarye/vim-vebugger'} -- -> require vimproc
-- included polyglot
-- use {'octol/vim-cpp-enhanced-highlight'}, {
--       \   'for': ['c', 'cpp', 'objc']
--       \ }
-- use {'othree/html5.vim'}, {
--       \   'for': ['html']
--       \ }
-- use {'hail2u/vim-css3-syntax'}, {
--       \   'for': ['css']
--       \ }
-- use {'groenewege/vim-less'}, {
--       \   'for': ['css']
--       \ }
-- use {'pangloss/vim-javascript'}, {
--       \   'for': ['javascript']
--       \ }
-- use {'posva/vim-vue'}, {
--       \   'for': ['vue']
--       \ }
-- use {'ryym/vim-riot'}, {
--       \   'for': ['riot']
--       \ }
-- use {'elixir-lang/vim-elixir'}, {
--       \   'for': ['elixir']
--       \ }
-- use {'pearofducks/ansible-vim'}, {
--       \   'for': ['yaml', 'ansible']
--       \ }
-- use {'hashivim/vim-terraform'}, {
--       \   'for': ['terraform']
--       \ }
--
-- Change to LSP from deoplete
--if (s:deoplete_enable == 1)
--  -- use {'zchee/deoplete-clang'}, {
--  --       \   'for': ['c', 'cpp'],
--  --       \ }
--else
--  use {'justmao945/vim-clang'}, {
--        \   'for': ['c', 'cpp'],
--        \ }
--endif
--if (s:deoplete_enable == 1)
--  use {'carlitux/deoplete-ternjs'}
--  --, { 'do': 'npm install -g tern' }
--  use {'mhartington/deoplete-typescript'}, {
--        \   'for': ['typescript']
--        \ }
--endif
--if (s:deoplete_enable == 1)
--  use {'zchee/deoplete-jedi'}, {
--        \   'for': ['python']
--        \ }
--else
--  use {'davidhalter/jedi-vim'}, {
--        \   'for': ['python']
--        \ }
--endif
--if (s:deoplete_enable == 1)
--  use {'zchee/deoplete-go'}, {
--        \   'for': ['go'],
--        \   'do': 'make'
--        \ }
--endif
-- use autozimu/LanguageClient-neovim
-- use {'racer-rust/vim-racer'}, {
--       \   'for': ['rust']
--       \ }
-- if (s:deoplete_enable == 1)
--   use {'sebastianmarkow/deoplete-rust'}, {
--         \   'for': ['rust']
--         \ }
-- endif
--use {'deris/vim-shot-f'} -- -> conflict clever-f
-- -> ludovicchabant/vim-gutentags
-- use {'vim-scripts/gtags.vim'}, {
--       \   'for': ['c', 'cpp', 'java'],
--       \ }
-- vim-matchup
--if (v:version == 704 && has('patch786')) || v:version >= 705
--  let g:loaded_matchparen = 1 | use {'itchyny/vim-parenmatch'}
--endif
--use {'milkypostman/vim-togglelist'} -> Valloric/ListToggle
--use {'bronson/vim-trailing-whitespace'} -> ntpeters/vim-better-whitespace
--use {'tpope/vim-speeddating' -- -> didn'}t use
-- Use fzf.vim
----------------------------------
---- Unite/denite
--if (has('nvim') || v:version >= 800) && has('python3')
--  use {'Shougo/denite.nvim'}
--else
--  use {'Shougo/unite.vim'}
--  use {'ujihisa/unite-locate'}
--  use {'Shougo/neomru.vim'}
--  use {'Shougo/neoyank.vim'}
--  use {'Shougo/unite-build'}
--  use {'thinca/vim-qfreplace'}
--  use {'ujihisa/quicklearn'}
--  use {'Shougo/unite-outline'}
--  use {'tsukkee/unite-tag'}
--  use {'tsukkee/unite-help'}
--  use {'ujihisa/unite-colorscheme'}
--  use {'thinca/vim-unite-history'}
--  use {'osyo-manga/unite-quickfix'}
--  use {'osyo-manga/unite-quickrun_config'}
--  use {'tacroe/unite-mark'}
--  use {'amitab/vim-unite-cscope'}
--  use {'kmnk/vim-unite-giti'}
--  use {'osyo-manga/unite-highlight'}
--  use {'yuku-t/vim-ref-ri'}
--endif
--
----------------------------------
---- CtrlP
--use {'ctrlpvim/ctrlp.vim'}
--use {'sgur/ctrlp-extensions.vim'}
--use {'tacahiroy/ctrlp-funky'}
--use {'jasoncodes/ctrlp-modified.vim'}

-- Conflict with vim-polyglot
--use {'Shougo/neosnippet'}
--use {'Shougo/neosnippet-snippets'}
-- use {'Shougo/vimfiler'}, { -- -> vim-dirvish
--       \   'on': [ 'VimFilerTab', 'VimFiler', 'VimFilerExplorer' ]
--       \ }
--depend 'Shougo/unite.vim'
-- not used recently
-- use {'Shougo/neopairs.vim'}
-- not used recently
--use {'Shougo/vimproc.vim'}, {
--      \   'do': 'make',
--      \ }
--use {'Shougo/vimshell'}, {
--      \   'on': [ 'VimShellBufferDir' ],
--      \ }
----depend 'Shougo/vimproc.vim'
--------------------------------
-- Rarely used
-- use {'FredKSchott/CoVim'}, {
--       \   'on': [ 'CoVim' ]
--       \ }

--------------------------------
-- broken plugins
--use {'fidian/hexmode'} -- -> ;3R display
---- Tag
--use {'szw/vim-tags'} -- -> broken in tmux
---- Fold
--use {'Konfekt/FastFold'} -- -> too slow boot
-- unused plugins
--use {'miyakogi/conoline.vim'} -- -> cool highlight current line
-- use {'gabrielelana/vim-markdown'}, { -- -> plasticboy/vim-markdown
--       \   'for': ['markdown']
--       \ }
-- use {'plasticboy/vim-markdown'}, { -- -> link paste is wrong
-- \   'for': ['markdown']
-- \ }
-- --depend 'godlygeek/tabular'
-- use {'godlygeek/tabular'}

--------------------------------
-- old plugins
-- use {'osyo-manga/vim-snowdrop'}, {
--     \   'for': ['c', 'cpp'],
--     \ }
-- use {'osyo-manga/vim-reunions'}
-- use {'osyo-manga/vim-marching'}, { -- -> difficult include path
-- \   'for': ['c', 'cpp']
-- \ }
-- --depend 'Shougo/vimproc.vim'
-- --depend 'osyo-manga/vim-reunions'
--use {'troydm/easybuffer.vim'} -- -> vim-buffergator
--use {'jiangmiao/auto-pairs'} -- -> ignore autopair if next char is not a blank
--use {'herry/auto-pairs'}
--use {'eapache/auto-pairs'}
--use {'Raimondi/delimitMate'} -- -> lexima
--use {'optroot/auto-pairs' -- -> it's many features than 'delimitMate'}
--use {'bkad/CamelCaseMotion' -- -> 'vim-scripts/camelcasemotion' '{'} wrong motion
--use {'junegunn/gv.vim'} -- -> cohama/agit.vim
--use {'fuenor/im_control.vim'}  -- ibus 制御 -> unused
--use {'scrooloose/syntastic'} -- -> watchdogs
--use {'mkitt/tabline'} -- -> lightline
--use {'gcmt/taboo'} -- -> lightline
--use {'bootleq/vim-tabline'} -- -> lightline
--use {'zefei/vim-wintabs'} -- -> ap/vim-buftabline tabとbufferを分けられて
--                                   素敵だが番号が表示できない
--use {'vim-scripts/BufLine'} -- -> ap/vim-buftabline シンプルでいい
--use {'bling/vim-bufferline'} -- -> ap/vim-buftabline lightlineと組み合わせ
--                                      られる
--use {'zefei/vim-wintabs'}
--use {'terryma/vim-multiple-cursors'} -- -> strange behavior
--use {'xolox/vim-easytags' -- -> syntax highlight use tags. can'}t use.
--use {'bbchung/clighter'} -- -> syntax highlight use libclang.
--                                  can't load libclang.
--use {'jeaye/color_coded' -- -> syntax highlight use clang. can'}t build.
--use {'gregsexton/gitv'} -- -> cohama/agit.vim
--use {'fholgado/minibufexpl.vim'} -- -> easybuffer
--use {'tpope/vim-unimpaired'} -- -> Raimondi/delimitMate
--use {'godlygeek/tabular'} -- -> junegunn/vim-easy-align
--use {'benmills/vimux'} -- -> move tmux and type command
--use {'nathanaelkane/vim-indent-guides'} -- -> Yggdroot/indentLine
--use {'bling/vim-airline'} -- -> itchyny/lightline.vim
--use {'justinmk/vim-sneak'} -- -> easymotion
--use {'t9md/vim-smalls'} -- -> easymotion
--use {'taglist.vim'} -- -> tagbar
--use {'wesleyche/SrcExpl'} -- include many bugs -> autopreview
--use {'Trinity'} -- -> tagbar, nerdtree, autopreview
--use {'thinca/vim-openbuf'} -- -> easybuffer
--use {'sjl/gundo.vim'} -- -> undotree
--use {'thinca/vim-localrc'} -- -> embear/vim-localvimrc
--use {'tpope/vim-commentary'} -- -> The-NERD-Commenter
--use {'tomtom/tcomment_vim'} -- -> The-NERD-Commenter
--use {'tyru/caw.vim'} -- -> The-NERD-Commenter
--use {'Rip-Rip/clang_complete'} -- -> vim-clang
--use {'Valloric/YouCompleteMe'} -- -> vim-clang
--use {'L9'} -- -> dependent on FuzzyFinder
--use {'FuzzyFinder'} -- -> unite
--use {'ZenCoding.vim'} -- -> mattn/emmet-vim
--use {'jelera/vim-javascript-syntax'}
--use {'YankRing.vim'} -- -> LeafCage/yankround.vim
--use {'AutoComplPop'} -- neocomplcache と競合
--use {'ref.vim'} -- インデックス範囲外のエラーが出る
--use {'motemen/hatena-vim'}
--use {'mattn/unite-advent_calendar'}
--use {'Townk/vim-autoclose'} -- 補完時のEscと干渉 -> Raimondi/delimitMate
-- }}}

