run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits TestCII.fits
out plots J0608_CII_6780_6812.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[6781,6825.1]   loadrange=[6780,6831]   resolution=vfwhm(75.0vtie)   columns=[wave,flux,error]       label=CII6780to6812
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value False
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 15.0   0.01    scale=[1.0,1.0]   specid=0    continuum=True
# Specify the emission lines
    gaussian amplitude=-15.0   redshift=0.0008   dispersion=20   wave=6780.6 specid=0    IntFlux=True
    gaussian amplitude=15.0   redshift=0.0011   dispersion=20   wave=6780.6 specid=0    IntFlux=True
    gaussian amplitude=-10   redshift=0.0008   dispersion=20   wave=6783.9 specid=0    IntFlux=True
    gaussian amplitude=20.0   redshift=0.0011   dispersion=20   wave=6783.9 specid=0    IntFlux=True
    gaussian amplitude=15.0   redshift=0.0011   dispersion=20   wave=6787.2 specid=0    IntFlux=True
    gaussian amplitude=-5.0   redshift=0.0008   dispersion=20   wave=6791.5 specid=0    IntFlux=True
    gaussian amplitude=15.0   redshift=0.0011   dispersion=20   wave=6791.5 specid=0    IntFlux=True
    gaussian amplitude=10.0   redshift=0.0011   dispersion=20   wave=6798.1 specid=0    IntFlux=True
    gaussian amplitude=15.0   redshift=0.0011   dispersion=20   wave=6800.7 specid=0    IntFlux=True
    gaussian amplitude=10.0   redshift=0.0011   dispersion=20   wave=6812.3 specid=0    IntFlux=True


#link read
#link end