run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits TestCII.fits
out plots J0608_cII_5535_5538.pdf
plot dims 3x3
plot labels True
plot fits True

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[5539,5546]   loadrange=[5535,5550]   resolution=vfwhm(75.0vtie)   columns=[wave,flux,error]       label=CII5535+5538
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value False
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 25.0   0.01    scale=[1.0,1.0]   specid=0    continuum=True
# Specify the emission lines
    gaussian amplitude=40.0   redshift=0.0008   dispersion=35.962   wave=5536.5 specid=0    IntFlux=True
    gaussian amplitude=35.0   redshift=0.0008   dispersion=35.962   wave=5539.5 specid=0    IntFlux=True
    model end

#link read
#link end