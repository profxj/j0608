run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits TestCII.fits
out plots J0608_OII_7319_7330.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[7322.8,7343]   loadrange=[7321,7343]   resolution=vfwhm(75.0vtie)   columns=[wave,flux,error]       label=OII7319_7330
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value False
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 10.0   0.01    scale=[1.0,1.0]   specid=0    continuum=True
# Specify the emission lines
    gaussian amplitude=10.0   redshift=0.0011   dispersion=20   wave=7319 specid=0    IntFlux=True
    gaussian amplitude=9.0   redshift=0.0011   dispersion=20   wave=7330 specid=0    IntFlux=True
model end

#link read
#link end