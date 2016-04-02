function! elixir#hex#appendRelease()
  let package = elixir#hexUtils#getPackageName('')
  if !empty(package)
    let latest_release = elixir#hexApi#getLatestRelease(package)
    if !empty(latest_release)
      call elixir#hexUtils#appendRelease(package, latest_release)
    endif
  end
endfunction

function! elixir#hex#allReleases(package_name)
  let package = elixir#hexUtils#getPackageName(a:package_name)
  if !empty(package)
    let releases = elixir#hexApi#getAllReleases(package)
    if !empty(releases)
      call elixir#hexUtils#render(releases)
    endif
  end
endfunction

function! elixir#hex#packageInfo(package_name)
  let package = elixir#hexUtils#getPackageName(a:package_name)
  if !empty(package)
    let package_info = elixir#hexApi#getPackageInfo(package)
    if !empty(package_info)
      call elixir#hexUtils#render(package_info)
    endif
  endif
endfunction

function! elixir#hex#openHexDocs(package_name)
  let package = elixir#hexUtils#getPackageName(a:package_name)
  if !empty(package)
    call elixir#hexUtils#openHexDocs(package)
  endif
endfunction

function! elixir#hex#openGithub(package_name)
  let package = elixir#hexUtils#getPackageName(a:package_name)
  if !empty(package)
    call elixir#hexUtils#openGithub(package)
  endif
endfunction
