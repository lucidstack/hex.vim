
function! elixir#hexUtils#render(input)
  silent keepalt belowright split markdown
  setlocal nosmartindent noautoindent noswapfile nobuflisted nospell nowrap modifiable
  setlocal buftype=nofile bufhidden=hide

  normal! ggdG
  call setline(1, a:input)

  exec 'resize 10'
  setlocal nomodifiable filetype=elixir
  nnoremap <silent> <buffer> q :bd<CR>
endfunction

function! elixir#hexUtils#appendRelease(package, release)
  let regex        = a:package . ',\?\s*}\?'
  let with_version = a:package . ', "\~> ' . a:release . '"'
  let new_line = substitute(getline('.'), regex, with_version, "")

  call s:check_after_release(new_line, a:release)
  normal! $
endfunction


function! s:check_after_release(line, release)
  let after_version = matchstr(a:line, a:release . '"\zs.')
  if empty(after_version) || after_version == ']'
    let line = substitute(a:line, a:release . '"', a:release . '"}', "")
  else
    let line = substitute(a:line, a:release . '"', a:release . '", ', "")
  endif

  call setline('.', line)
endfunction


function! elixir#hexUtils#openHexDocs(package)
  let uri = 'https://hexdocs.pm/' . a:package
  call s:openUri(uri)
endfunction

function! elixir#hexUtils#openGithub(package)
  let json = elixir#hexApi#fetchPackage(a:package)

  if has_key(json, 'meta')
    let links = json.meta.links

    if has_key(links, 'GitHub')
      call s:openUri(links.GitHub)
    elseif has_key(links, 'github')
      call s:openUri(links.github)
    elseif has_key(links, 'Github')
      call s:openUri(links.Github)
    else
      redraw
      echo 'No Github link found for ' . a:package . '!'
    endif
  endif
endfunction

function! elixir#hexUtils#getPackageName(qarg)
  if empty(a:qarg)
    let package = s:scanForPackage()
    if s:packageNotFound(package)
      return
    endif

    return package
  endif

  return a:qarg
endfunction

function! s:scanForPackage()
  let line = getline('.')
  return matchstr(line, '{:\zs[a-z]\w*\ze')
endfunction

function! s:packageNotFound(package)
  if empty(a:package)
    redraw
    echom 'No package found on this line!'
    return 1
  endif

  return 0
endfunction

let s:is_unix = has('unix')
let s:is_macunix = (has('mac') || has('macunix') || has('gui_macvim') || (!executable('xdg-open') && system('uname') =~? '^darwin'))

function! s:openUri(uri)
  if s:is_macunix
    call system('open ' . shellescape(a:uri))
  elseif s:is_unix
    system('xdg-open ' . shellescape(a:uri))
  endif
endfunction
