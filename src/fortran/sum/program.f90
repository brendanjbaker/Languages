program program
	implicit none
	integer :: i, total

	total = 0
	do i = 0, 100
		total = total + i
	end do

	write(*,'(I0)') total
end program program
