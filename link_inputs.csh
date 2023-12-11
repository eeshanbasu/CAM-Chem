#!/bin/csh

set yyyy = 2014
set mon = 04
set file_path = /glade/scratch/ebasu/ICBC/CAM_CHEM/${yyyy}

foreach day (00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32)
 
if ($mon == 01) then 
	if ($day == 00) then
        	set prev_year = `expr $yyyy - 1`
        	set dates = 2013-12-31
    	else
        	set dates = ${yyyy}-${mon}-${day}
	endif

    	if ($day == 32) then
        	set dates = ${yyyy}-${month}-01
    	endif
endif

if ($mon == 05 || $mon == 07 || $mon == 08 || $mon == 10) then
	if ($day == 00) then
		set last_month = `expr $mon - 1`	
		if ($last_month < 10) then
			set last_month = "0$last_month"
        	endif
		set dates = ${yyyy}-${last_month}-30
        else if ($day == 32) then
            	set last_month = `expr $mon + 1`
            	if ($last_month < 10) then
                	set last_month = "0$last_month"
            	endif
            	set dates = ${yyyy}-${last_month}-01
        else
            set dates = ${yyyy}-${mon}-${day}
        endif
endif

if ($mon == 04 || $mon == 06 || $mon == 09 || $mon == 11) then
        if ($day == 00) then
                set last_month = `expr $mon - 1`
                if ($last_month < 10) then
                        set last_month = "0$last_month"
                endif
                set dates = ${yyyy}-${last_month}-31
        else if ($day == 31) then
                set last_month = `expr $mon + 1`
                if ($last_month < 10) then
                        set last_month = "0$last_month"
                endif
                set dates = ${yyyy}-${last_month}-01
        else if ($day == 32) then
		continue
	else
            set dates = ${yyyy}-${mon}-${day}
        endif
endif

if ($mon == 03) then
        if ($day == 00) then
                set last_month = `expr $mon - 1`
                if ($last_month < 10) then
                        set last_month = "0$last_month"
                endif
                set dates = ${yyyy}-${last_month}-28
        else if ($day == 32) then
                set last_month = `expr $mon + 1`
                if ($last_month < 10) then
                        set last_month = "0$last_month"
                endif
                set dates = ${yyyy}-${last_month}-01
        else
            set dates = ${yyyy}-${mon}-${day}
        endif
endif

if ($mon == 12) then
        if ($day == 00) then
                set last_month = `expr $mon - 1`    
                set last_month = "$last_month"
                set dates = ${yyyy}-${last_month}-30
        else if ($day == 32) then
		set next_year = `expr $yyyy + 1`
		set dates = ${next_year}-01-01
	else
	    set dates = ${yyyy}-${mon}-${day}
	endif
endif

ln -sf ${file_path}/fmerra.2.1003.FCSD.f09.qfedcmip.56L.001.cam.h1.${dates}-00000.nc $cwd/data/hb00${day}.nc

end
