function! elixir#hexApi#getPackageInfo(package)
  echom 'Retrieving information from hex.pm ...'
  let info = system('mix hex.info ' . shellescape(a:package))
  redraw!

  if match(info, 'No package with name') != 0
    return split(info, '\n')
  else
    call s:packageNotFound(a:package)
  endif
endfunction

function! elixir#hexApi#getAllReleases(package)
  let json = elixir#hexApi#fetchPackage(a:package)
  if has_key(json, 'releases')
    let format_version = 'v:val.version . " (released on " . s:extractDate(v:val.inserted_at) . ")"'
    return map(json.releases, format_version)
  endif
endfunction

function! elixir#hexApi#getLatestRelease(package)
  let json = elixir#hexApi#fetchPackage(a:package)
  if has_key(json, 'releases')
    return json.releases[0].version
  endif
endfunction

function! elixir#hexApi#fetchPackage(package)
  echom 'Retrieving information from hex.pm ...'

  let uri = 'https://hex.pm/api/packages/' . a:package

  let result = system(printf('curl -sS -L -i -X GET -H "Content-Cache: no-cache" "%s"', uri))
  let pos = stridx(result, "\r\n\r\n")
  let content = strpart(result, pos+4)

  redraw!
  return webapi#json#decode(content)
endfunction

function! s:extractDate(str)
  let date = matchstr(a:str, '[0-9-]\+')
  return date
endfunction

function! s:packageNotFound(package)
  echom 'No package with name ' . a:package
endfunction
