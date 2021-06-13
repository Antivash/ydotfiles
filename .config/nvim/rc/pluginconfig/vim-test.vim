let g:test#strategy = 'asyncrun'
nnoremap <make>   <Nop>
nmap    m <make>
nnoremap <make>n <Cmd>TestNearest<CR>
nnoremap <make>f <Cmd>TestFile<CR>
nnoremap <make>s <Cmd>TestSuite<CR>
nnoremap <make>l <Cmd>TestLast<CR>
nnoremap <make>v <Cmd>TestVisit<CR>
let g:test#rust#cargotest#options = '-- --nocapture'
let g:test#rust#cargotest#executable = 'RUST_BACKTRACE=1 cargo test'
let g:test#javascript#runner = 'jest'

command! TestCurrent wa <Bar> execute 'TestNearest ' . get(b:, 'vista_nearest_method_or_function', '')
nnoremap <make>c <Cmd>TestCurrent<CR>
