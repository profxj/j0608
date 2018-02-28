  ;; Create the mage structure
  CLOBBER = 1
  rawpath = '/scratch/REDUX/Magellan/MagE/J0608/feb2018/Raw/'
  mage_mkstrct, mage, rawpath = rawpath

  ;; Read in frame structure for this setup
  nobj = 1L
  frame_proto = create_struct('OBJECT', ' ', 'OBJ_ID', 0L $
                             , 'FRAMES', lonarr(15L)-1L $
                             , 'NFRAMES', 0L)
 frame_struct = replicate(frame_proto, nobj)
 frame_struct.OBJ_ID = lindgen(nobj)

 ;; J0608
 frame_struct[0].OBJECT = 'CPD-56'
 frame_struct[0].FRAMES[0:2] = [133, 134, 135]

  nobj = n_elements(frame_struct)

  ;; Grab the standard filename
  istd = where(mage.FRAME EQ 1)
  mage[istd].EXPTYPE = 'STD'
  stdfile = mage[istd].FITSFILE

  ;;set various files in the mage structure
  mage.pixflatfile    = 'Flat/Pixflat.fits'
  mage.illumflatfile  = 'Flat/Illumflat_' $
                        + strcompress(mage.SLIT, /rem) + '.fits'
  mage.orderfile      = 'OStr_mage.fits'
  mage.slitfile       = 'Orders.fits'
  objfile             = 'Object/ObjStr' + $
                        strcompress(strsplit(fileandpath(stdfile[0]) $
                                             , 'mage', /extract), /rem)
  mage.stdfile        = objfile[0]
  mage.sensfunc = 'LTT1788_std_1.00.sav'  ; Taken from Dec 2017



;  FOR iobj = 0L, nobj-1L DO BEGIN
     iobj = 0L
     ikeep = mage_frames(mage, frame_struct[iobj].FRAMES)
     mage_now = mage[ikeep]

  ; Set arcfile to frame 2 as frame 11 appears to be crashing
     mage_now[0].arcfile = 'mage0002.fits'
     mage_now[1].arcfile = 'mage0002.fits'
     mage_now[2].arcfile = 'mage0002.fits'
     mage_now[3].arcfile = 'mage0002.fits'

     mage_now.OBJ_ID = frame_struct[iobj].OBJ_ID
     mage_now.OBJECT = frame_struct[iobj].OBJECT
     mage_now.EXPTYPE = 'SCIENCE'
     ;;Run pipeline
     mage_pipe, mage_now, CLOBBER = CLOBBER
;  ENDFOR

; COADD failed
; Rerun with orders cut down in 

END
