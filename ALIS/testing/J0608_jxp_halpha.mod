run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits False
out plots J0608.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[6566.6,6572.72]   loadrange=[6562,6579.]   resolution=vfwhm(150.0vtie)   columns=[wave,flux,error]       label=Hb4863
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value False
fix gaussian dispersion True
emission
# Specify the continuum (or background) level
    legendre 15.35   0.01    scale=[1.0,1.0]   specid=0    continuum=True
# Specify the emission lines
    gaussian 62.0   0.0005ra   10.0dh   wave=6564.613 specid=0    IntFlux=True
model end

#link read
#oiib(oiiflux,oiia) = oiiflux - oiia
#link end