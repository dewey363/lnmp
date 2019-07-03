Import-Module downloader
Import-Module unzip
Import-Module command

Function install($VERSION="3.7.3"){
  $url="https://www.python.org/ftp/python/${VERSION}/python-${VERSION}-amd64.exe"
  $name="Python"
  $filename="python-${VERSION}-amd64.exe"
  $unzipDesc="python"

  if($(_command python)){
    $CURRENT_VERSION=($(python --version) -split " ")[1]

    if ($CURRENT_VERSION -eq $VERSION){
      echo "==> $name $VERSION already install"
      return
    }
  }

  # 下载原始 zip 文件，若存在则不再进行下载
  _downloader `
    $url `
    $filename `
    $name `
    $VERSION

  # 验证原始 zip 文件 Fix me

  # 解压 zip 文件 Fix me
  # _unzip $filename $unzipDesc
  # 安装 Fix me
  # Copy-item deno/deno.exe C:\bin

  # https://docs.python.org/3.7/using/windows.html#installing-without-ui
  Start-Process $filename -Wait `
  		-ArgumentList @( `
        '/quiet', `
        'InstallAllUsers=1', `
        'DefaultAllUsersTargetDir=C:\Python',
        'DefaultJustForMeTargetDir=C:\Python',
        'TargetDir=C:\Python', `
        'PrependPath=1', `
        'Shortcuts=0', `
        'Include_doc=0', `
        'Include_pip=1', `
        'Include_test=0' `
  );

  echo "==> Checking ${name} ${VERSION} install ..."
  # 验证 Fix me
  python --version
}

Function uninstall(){
  echo ""
  # Remove-item
}