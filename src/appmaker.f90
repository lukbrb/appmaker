module appmaker
  implicit none
  private

  public :: create_dirs, create_file
contains
  subroutine create_dirs(appName)
    character(len=*), intent(in) :: appName
    character(256) :: appPath
    appPath = trim(appName) // ".app/"
    call system("mkdir -p " // trim(appPath))
    call system("mkdir -p " // trim(appPath) // "/Contents")
    call system("mkdir -p " // trim(appPath) // "Contents/MacOS/")
    call system("mkdir -p " // trim(appPath) // "Contents/MacOS/" // trim(appName))
    call system("mkdir -p " // trim(appPath) // "Contents/Resources")
  end subroutine create_dirs

  subroutine create_file(filePath, fileContent)
    character(len=*), intent(in) :: filePath, fileContent
    call system("echo '" // trim(fileContent) // "' > " // trim(filePath))
  end subroutine create_file
end module appmaker
