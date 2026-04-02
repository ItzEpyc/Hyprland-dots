" --- ОСНОВНЫЕ НАСТРОЙКИ ---
set termguicolors
set number
set relativenumber
set hidden
set mouse=a

" --- ПЛАГИНЫ ---
call plug#begin('~/.vim/plugged')
  Plug 'shaunsingh/nord.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'goolord/alpha-nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
call plug#end()

" --- НАСТРОЙКА ТЕМЫ И ПРОЗРАЧНОСТИ ---
let g:nord_disable_background = v:true
colorscheme nord

" Этот блок гарантирует, что твой узор на фоне будет виден
highlight Normal guibg=none
highlight NonText guibg=none
highlight NormalFloat guibg=none
highlight SignColumn guibg=none
highlight EndOfBuffer guibg=none

" --- ГОРЯЧИЕ КЛАВИШИ ---
" Открыть/закрыть дерево на Ctrl+n (без ошибок при старте)
nnoremap <C-n> :NERDTreeToggle<CR>

lua << EOF
require('lualine').setup {
  options = {
    theme = 'nord',
    component_separators = '',
    section_separators = { left = '', right = '' },
    globalstatus = true,
    -- Отключаем "черный список", чтобы стиль работал везде:
    disabled_filetypes = { statusline = {} },
    -- Заставляем lualine игнорировать смену фокуса на плагины:
    ignore_focus = { "plug", "nerdtree" },
  },
  sections = {
    lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
    -- Мы принудительно задаем прозрачность для пустых мест
    lualine_b = { { 'branch', color = { bg = 'none' } } },
    lualine_c = {
  {
    function()
      local name = vim.fn.expand('%:t') -- Получаем имя файла
      if name == "" or name == "[No Name]" then
        -- Если файл не открыт, пишем твой пафосный текст с иконкой молнии
        return " Epyc Vim" 
      end
      return name -- Если файл открыт, показываем его имя
    end,
    -- Цвет: #88C0D0 — это фирменный голубой из палитры Nord
    color = { fg = '#88C0D0', gui = 'bold,italic' } 
  }
}, 
    lualine_x = { { 'encoding', color = { bg = 'none' } } },
    lualine_y = {},
    lualine_z = { { 'location', separator = { right = '' }, left_padding = 2 } },
  }
}
EOF

" Полная прозрачность для статусбара во всех окнах
highlight StatusLine guibg=none ctermbg=none
highlight StatusLineNC guibg=none ctermbg=none

" Убираем тот самый серый фон под скруглениями
highlight MsgArea guibg=none ctermbg=none
highlight NormalFloat guibg=none ctermbg=none

" Если ты видишь белую полосу в окне Plug, это её уберет:
highlight PlugBracket guifg=#81A1C1 guibg=none

lua << EOF
local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

-- Твоя стильная надпись 'Epyc Vim' в виде ASCII-арта
dashboard.section.header.val = {
        '', '', '',
        ' ██████╗ ███████╗███╗   ██╗███████╗███████╗██╗███████╗',
        '██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔════╝██║██╔════╝',
        '██║  ███╗█████╗  ██╔██╗ ██║█████╗  ███████╗██║███████╗',
        '██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ╚════██║██║╚════██║',
        '╚██████╔╝███████╗██║ ╚████║███████╗███████║██║███████║',
        ' ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚══════╝╚═╝╚══════╝',
        '', '', ''
    }

-- Кнопки навигации
dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
    dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.vim<CR>"),
    dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
}

-- Цвет для заголовка (Nord Blue)
alpha.setup(dashboard.opts)
vim.cmd('highlight AlphaHeader guifg=#88C0D0')
EOF
