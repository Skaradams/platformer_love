$buildProcess = Start-Process "haxe" -ArgumentList ".\build.hxml" -NoNewWindow -PassThru -Wait

if ($buildProcess.ExitCode -ne 0) {
  exit
}

Start-Process "love" -ArgumentList "bin" -Wait -NoNewWindow
