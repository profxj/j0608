run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits TestCII.fits
out plots J0608_cII_4409to4413.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[4411,4424]   loadrange=[4408,4427]   resolution=vfwhm(75.0vtie)   columns=[wave,flux,error]       label=CII4409to4413+OII4415ti4417
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value False
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 40.0   0.01    scale=[1.0,1.0]   specid=0    continuum=True
# Specify the emission lines
    gaussian amplitude=1.0  redshift=0.0011   dispersion=20dd   wave=4409.2 specid=0    IntFlux=True
    gaussian amplitude=10.0  redshift=0.0011   dispersion=20dd   wave=4410.0 specid=0    IntFlux=True
    gaussian amplitude=10  redshift=0.0011   dispersion=20dd   wave=4411.2 specid=0    IntFlux=True
    gaussian amplitude=2   redshift=0.0011   dispersion=20dd   wave=4411.5 specid=0    IntFlux=True
    gaussian amplitude=.5  redshift=0.0011   dispersion=20dd   wave=4413.3 specid=0    IntFlux=True
    gaussian amplitude=-10  redshift=0.0011   dispersion=20aa   wave=4414.905 specid=0    IntFlux=True
    gaussian amplitude=-10  redshift=0.0011   dispersion=20aa   wave=4416.974 specid=0    IntFlux=True
model end

#link read
#link end