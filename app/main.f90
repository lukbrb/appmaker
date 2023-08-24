program main
  use appmaker, only: create_dirs, create_file
  character(256) :: appPath
  character(256) :: commandPath
  character(256) :: commandContents
  character(256) :: iconPath
  character(256) :: plistPath
  character(256) :: plistContents
  character(256) :: appName

  ! Vérifier si le nom de l'application est fourni en argument
  if (command_argument_count() == 0) then
      print *, "Veuillez fournir le nom de l'application en argument de commande."
      stop
  end if

  ! Récupérer le nom de l'application à partir des arguments
  call get_command_argument(1, value=appName)

  ! Chemin vers le dossier de l'application
  ! appPath = "/Applications/" // trim(appName) // ".app/"
  appPath = trim(appName) // ".app/"

  ! Chemin vers le fichier de commande
  commandPath = trim(appPath) // "Contents/MacOS/" // trim(appName) // "/run.command"
  commandContents =  & 
                    '#!/bin/bash\n\n' // &
                    'cd "$(dirname "$0")"\n' // &
                    './test.sh\n'
  
  ! Chemin vers le fichier d'icône (facultatif)
  iconPath = "Icon.icns"

  ! Chemin vers le fichier Info.plist
  plistPath = trim(appPath) // "Contents/Info.plist"

  ! Contenu du fichier Info.plist
  plistContents =  & 
                  '<?xml version="1.0" encoding="UTF-8"?>' // &
                  '<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">' // &
                  '<plist version="1.0">' // &
                  '  <dict>' // &
                  '      <key>CFBundleExecutable</key>' // &
                  '      <string>' // trim(commandPath) // '</string>' // &
                  '      <key>CFBundleIconFile</key>' // &
                  '      <string>' // trim(iconPath) // '</string>' // &
                  '  </dict>' // &
                  '</plist>'

  ! Création de l'application --> TODO: Transformer en installation
  ! call system("mkdir -p " // trim(appPath))
  ! call system("cp " // trim(commandPath) // " " // trim(appPath) // "Contents/MacOS/" // trim(appName))
  ! call system("cp " // trim(iconPath) // " " // trim(appPath) // "Contents/Resources/Icon.icns")
  ! call system("echo '" // trim(plistContents) // "' > " // trim(appPath) // "Contents/Info.plist")
  call create_dirs(appName)
  call create_file(filePath=commandPath, fileContent=commandContents)
  call create_file(filePath=plistPath, fileContent=plistContents)
  ! call system("touch " // trim(appPath) // trim(commandPath))
  ! call system("touch " // trim(appPath) // trim(commandPath))
  ! call system("cp " // trim(appPath) // trim(commandPath) // " " // trim(appPath) // "Contents/MacOS/" // trim(appName))
  call system("cp " // trim(iconPath) // " " // trim(appPath) // "Contents/Resources/Icon.icns")
  ! call system("echo '" // trim(plistContents) // "' > " // trim(appPath) // "Contents/Info.plist")

  print *, "Application créée avec succès!"
end program main
