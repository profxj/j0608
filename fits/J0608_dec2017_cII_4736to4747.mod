run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits TestCII.fits
out plots J0608_cII_4736to4747.pdf
plot dims 3x3
plot labels True
plot fits True

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[4735.5,4755.5]   loadrange=[4735,4757]   resolution=vfwhm(75.0vtie)   columns=[wave,flux,error]       label=CII4736to4737
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value False
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 37.0   0.01    scale=[1.0,1.0]   specid=0    continuum=True
# Specify the emission lines
    gaussian amplitude=8.0   redshift=0.0008   dispersion=35.0   wave=4736.8 specid=0    IntFlux=True
    gaussian amplitude=24.0   redshift=0.0008   dispersion=35.0   wave=4739.3 specid=0    IntFlux=True
    gaussian amplitude=37.0   redshift=0.0008   dispersion=35.0   wave=4746.1 specid=0    IntFlux=True
    gaussian amplitude=11.0   redshift=0.0008   dispersion=35.0   wave=4748.6 specid=0    IntFlux=True
model end

#link read
#link end