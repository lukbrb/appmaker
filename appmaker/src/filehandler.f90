module filehandler
    implicit None

    private

    public :: GetFileName

    contains

    subroutine GetFileName(fullPath, fileName)
        character(len=*), intent(in) :: fullPath
        character(len=:), allocatable, intent(out) :: fileName
        integer :: i, lastIndex, lenFileName
    
        ! Trouver l'index du dernier slash dans le chemin
        lastIndex = len(fullPath)
        do i = len(fullPath), 1, -1
            if (fullPath(i:i) == '/') then
                lastIndex = i
                exit
            end if
        end do
    
        ! Extraire le nom de fichier à partir du chemin
        lenFileName = len(fullPath) - lastIndex
        allocate(character(len=lenFileName) :: fileName)
        fileName = fullPath(lastIndex + 1:)
        print *, "Chemin du sript:",  fullPath
        print *, "Nom du script:", fileName
    end subroutine GetFileName

end module filehandler
