command! -nargs=0 HexAppendRelease call elixir#hex#appendRelease()
nnoremap <plug>(hex-append-release) :<c-u>HexAppendRelease<cr>

command! -nargs=? HexAllReleases call elixir#hex#allReleases(<q-args>)
nnoremap <plug>(hex-all-releases) :<c-u>HexAllReleases<cr>

" Just an alias for :HexAllReleases
command! -nargs=? HexAllVersions call elixir#hex#allReleases(<q-args>)
nnoremap <plug>(hex-all-versions) :<c-u>HexAllVersions<cr>

command! -nargs=? HexPackageInfo call elixir#hex#packageInfo(<q-args>)
nnoremap <plug>(hex-package-info) :<c-u>HexPackageInfo<cr>

command! -nargs=? HexOpenHexDocs call elixir#hex#openHexDocs(<q-args>)
nnoremap <plug>(hex-open-hex-docs) :<c-u>HexOpenHexDocs<cr>

command! -nargs=? HexOpenGithub call elixir#hex#openGithub(<q-args>)
nnoremap <plug>(hex-open-github) :<c-u>HexOpenGithub<cr>

