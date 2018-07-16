run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits False
out plots J0608_CII_7112to7144.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[7114,7155]   loadrange=[7110,7160]   resolution=vfwhm(75.0vtie)   columns=[wave,flux,error]       label=CII

data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value False
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 11   0.01    scale=[1.0,1.0]   specid=0    continuum=True
    gaussian    5    0.0008    20   wave=7114.5   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=7115.0   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=7117.6   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=7127.7   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=7134.4   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=7136.1   specid=0    IntFlux=True
    gaussian    5    0.0008    20   wave=7146.2   specid=0    IntFlux=True

model end

#link read

#link end