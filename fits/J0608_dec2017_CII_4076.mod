run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits False
out plots J0608_CII_4076.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[4080,44083]   loadrange=[4079,4086]   resolution=vfwhm(75.0vtie)   columns=[wave,flux,error]       label=CII4076
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value False
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 50   0.01    scale=[1.0,1.0]   specid=0    continuum=True
    gaussian .2   0.00112373   20   wave=4076.4   specid=0    IntFlux=True
model end

#link read

#link end