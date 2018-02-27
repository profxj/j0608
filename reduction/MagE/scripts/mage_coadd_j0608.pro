;; 
frames = string(objframes.frame)

;;
sxaddpar, master_hdr, 'COMMENT',  'mage_pipe: co-added ' + $
          strcompress(strjoin(frames, ','), /rem)
res = 299792.458D/4200.D*objframes[0].slit
IF KEYWORD_SET(singles) AND N_ELEMENTS(allframes) GT 15 THEN BEGIN
   print, 'Extracting each spectrum before co-add'
   nexp = N_ELEMENTS(allframes)
   FOR kk=0, nexp-1, 15 DO BEGIN
      mage_combspec, allframes[kk:kk+14], fspec
      outflux = 'FSpec/'+strcompress(objframes[0].object,/rem)+ $
                '_s_'+strtrim(string(kk/15), 2)+'_F.fits'
      outerr  = 'FSpec/'+strcompress(objframes[0].object,/rem)+ $
                '_s_'+strtrim(string(kk/15), 2)+'_E.fits'
      combname = 'FSpec/'+strcompress(objframes[0].object,/rem)+ $
                 '_s_'+strtrim(string(kk/15), 2)+'_comb.fits'
      mage_1dspec, fspec, outflux, outerr, combname $
                   , hdr=master_hdr, resvel=res
   ENDFOR

ENDIF
;;Always do the whole combine
mage_combspec, allframes, fspec

outflux = 'FSpec/'+strcompress(objframes[0].object,/rem)+'_F.fits'
outerr  = 'FSpec/'+strcompress(objframes[0].object,/rem)+'_E.fits'
combname = 'FSpec/'+strcompress(objframes[0].object,/rem)+'_comb.fits'
mage_1dspec, fspec, outflux, outerr, combname $
             , hdr=master_hdr, resvel=res
