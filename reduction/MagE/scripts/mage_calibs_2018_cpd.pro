;; Make the mage structure
rawpath = '/scratch/REDUX/Magellan/MagE/J0608/feb2018/Raw/'
mage_mkstrct, mage, rawpath = rawpath

;; Use Xe Flash for trace flat and illumflat
;; Add in a few dome flats
itrace = where(((mage.FRAME GE 52) AND (mage.FRAME LE 66)) or ((mage.FRAME LE 50) and (mage.FRAME GE 48)))
illumflatfiles = rawpath + mage[itrace].FITSFILE

;; GREEN: Xe Flash 5.0" slit
igreen = where( (mage.FRAME GE 52) AND (mage.FRAME LE 66)) 
greenflatfiles = rawpath + mage[igreen].FITSFILE

;; RED: Dome flat
ired = where((mage.FRAME GE 40 AND mage.FRAME LE 50))
redflatfiles = rawpath + mage[ired].FITSFILE

;; BLUE: Twilight flats 5.0" slit
iblue = igreen
blueflatfiles = rawpath + mage[iblue].FITSFILE

;; 
iarc = where(mage.FRAME EQ 136)
pixarcfile = rawpath + mage[iarc].FITSFILE

;; Trace slits
tset_slits = mage_findslits(illumflatfiles)

;; Make Flat -- Had to turn off order 20
flatinter = 1
mage_makeflat, red = redflatfiles, green = greenflatfiles $
               , blue = blueflatfiles, illum = illumflatfiles $
               , orders = 'Orders.fits', arcfile = pixarcfile[0] $
               , chk = flatinter, /NO_ILLUM


;; STD  -- Will use the analysis from December 2017
