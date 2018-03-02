;; Make the mage structure
rawpath = '/scratch/REDUX/Magellan/MagE/J0608/MagE_J0608-7157/Raw/'
mage_mkstrct, mage, rawpath = rawpath

;; Use Xe Flash for trace flat and illumflat
itrace = where(((mage.FRAME GE 48) AND (mage.FRAME LE 57)) or ((mage.FRAME LE 42) and (mage.FRAME GE 40)))
illumflatfiles = rawpath + mage[itrace].FITSFILE

;; GREEN: Xe Flash 5.0" slit
igreen = itrace
greenflatfiles = rawpath + mage[igreen].FITSFILE

;; RED: Dome flat
ired = where((mage.FRAME GE 28 AND mage.FRAME LE 42))
redflatfiles = rawpath + mage[ired].FITSFILE

;; BLUE: Twilight flats 5.0" slit
iblue = igreen
blueflatfiles = rawpath + mage[iblue].FITSFILE

;; 
iarc = where(mage.FRAME EQ 11)
pixarcfile = rawpath + mage[iarc].FITSFILE

;; Trace slits
tset_slits = mage_findslits(illumflatfiles)

;; Make Flat
flatinter = 1
mage_makeflat, red = redflatfiles, green = greenflatfiles $
               , blue = blueflatfiles, illum = illumflatfiles $
               , orders = 'Orders.fits', arcfile = pixarcfile[0] $
               , chk = flatinter


;; STD 
istd = where(mage.FRAME EQ 1)
mage[istd].EXPTYPE = 'STD'
mage[istd].pixflatfile = 'Flat/Pixflat.fits'
mage[istd].illumflatfile = 'Flat/Illumflat_1.00.fits'
mage[istd].orderfile      = 'OStr_mage.fits'
mage[istd].slitfile       = 'Orders.fits'
istdarc = where(mage.FRAME EQ 2)

stdarcfile = rawpath + mage[istdarc].FITSFILE
stdfile = rawpath + mage[istd].FITSFILE
stdflxfile = getenv('XIDL_DIR') + '/Spec/Flux/ESOFIL/fltt1788.dat'
stdoutfile = 'LTT1788_std_1.00.sav'
illumflatfile = 'Flat/Illumflat_1.00.fits'
;mage_sensfunc_old, mage, stdfile[0], stdflxfile[0], stdoutfile[0] $
;               , illumflatfile = illumflatfile, /CLOBBER, arcfile=stdarcfile
mage_sensfunc, mage, stdfile[0], stdflxfile[0], stdoutfile[0], /clobber


END

