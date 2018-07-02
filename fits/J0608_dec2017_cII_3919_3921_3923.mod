run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits False
out plots J0608_dec2017_cII_3919_3921.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[3917.,3930.5]   loadrange=[3915.,3932.0]   resolution=vfwhm(75.0vtie)   columns=[wave,flux,error]       label=CII3919+3921(vac)
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=1   fitrange=[3927,3930.]   loadrange=[3925.,3931.0]   resolution=vfwhm(75.0vtie)   columns=[wave,flux,error]       label=CII?
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value True
#fix gaussian dispersion True
emission
# Specify the continuum (or background) level
    legendre 15.35   0.01    scale=[1.0,1.0]   specid=0    continuum=True
    legendre 15.35   0.01    scale=[1.0,1.0]   specid=1    continuum=True
# Specify the emission lines
    gaussian 150.0   0.0005   20.0   wave=3923 specid=0    IntFlux=True
    gaussian 150.0   0.0005   20.0   wave=3925 specid=0    IntFlux=True
    gaussian 150.0   0.0005   20.0   wave=3928 specid=1    IntFlux=True
model end

#link read
#oiib(oiiflux,oiia) = oiiflux - oiia
#link end