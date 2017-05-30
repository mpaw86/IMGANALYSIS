;; Image preparation/analysis warrper 

PRO RUN_ALL, mockimgs=mockimgs

    If not(keyword_set(mockimgs)) then begin
        
        filters = ['r']
        ;samples = ['z1m2/main_qPSB','z1m2/main_agnPSB','z1m2/main_ePSB','z1m2/main_dPSB','z1m2/control_PAS','z1m2/control_SF','z1m2/control_SBpure','z1m2/control_SFdusty','z1m2/control_AGN']
        samples = ['z1m1/main_ePSB']

        For f = 0, n_elements(filters)-1 do begin
            filter = filters[f]
            For i = 0, n_elements(samples)-1 do begin
                sample = 'SDSSPSB/'+samples[i]
                run_imgprep, sample, filter, /sdss, /cutout
                ; run_imganalysis, sample, /imglist, /sdsscutout, /sdsshdr, /largeimg, /savecleanimg, /savepixelmap
            Endfor
        Endfor
        
    Endif else begin
        
        ;filters = ['u','g','r','i','z']
        filters = ['r']
        orientations = ['0','1','2','3','4','5','6']
        
        For f = 0, n_elements(filters)-1 do begin
        
            For o = 0, n_elements(orientations)-1 do begin
                
               ; If (f eq 0 and o eq 0) then run_mockimganalysis, '2xSc_13',  orientations[o], filters[f], $
               ;  /convertunits, /aperpixmap, /savepixelmap
                 
               ; If (f ne 0 or o ne 0) then run_mockimganalysis, '2xSc_13',  orientations[o],filters[f], $
                ;  /convertunits, /savepixelmap
               run_mockimgprep, '2xSd_07',orientations[o], filters[f], /trim
               run_mockimganalysis, '2xSd_07',  orientations[o], filters[f], /convertunits, /aperpixmap, /savepixelmap
                 
            Endfor
            
        Endfor
  
        
    Endelse

END