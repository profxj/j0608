run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits TestCII.fits
out plots J0608_cII_3919_3920.pdf
plot dims 3x3
plot labels True
plot fits True

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[3920,3927.1]   loadrange=[3918,3940]   resolution=vfwhm(75.0vtie)   columns=[wave,flux,error]       label=CII3919+3920+?
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value True
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 50.0   0.01    scale=[1.0,1.0]   specid=0    continuum=True
# Specify the emission lines
    gaussian amplitude=30.0   redshift=0.00106138   dispersion=35.962   wave=3919 specid=0    IntFlux=True
    gaussian amplitude=50.0   redshift=0.00106138   dispersion=35.962   wave=3920.7 specid=0    IntFlux=True
    model end

#link read
#link end