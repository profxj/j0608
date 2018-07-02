run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits False
out plots J0608_CII_7231_7236.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[7233,7250]   loadrange=[7230,7253]   resolution=vfwhm(75.0vtie)   columns=[wave,flux,error]       label=CII7231+7236
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value False
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 10   0.01    scale=[1.0,1.0]   specid=0    continuum=True
    gaussian 80   0.0011   20   wave=7231.32   specid=0    IntFlux=True
    gaussian 100   0.0011   20   wave=7236.42   specid=0    IntFlux=True
model end

#link read

#link end