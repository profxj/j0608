run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits False
out plots J0608_HeI_6678.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[6679,6691]   loadrange=[6678,6695]   resolution=vfwhm(75.0vtie)   columns=[wave,flux,error]       label=HeI_5876
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value False
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 15   0.01    scale=[1.0,1.0]   specid=0    continuum=True
    gaussian -15   0.0005   20   wave=6679.9   specid=0    IntFlux=True
    gaussian 80   0.0008   20   wave=6679.9   specid=0    IntFlux=True
model end

#link read

#link end