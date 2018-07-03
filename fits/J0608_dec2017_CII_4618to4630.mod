run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits False
out plots J0608_CII_4618to4630.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[4618.,4638]   loadrange=[4615.5,4640]   resolution=vfwhm(75.0vtie)   columns=[wave,flux,error]       label=H-gamma
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value True
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 40   0.01    scale=[1.0,1.0]   specid=0    continuum=True
    gaussian 15   0.0008   20   wave=4619.69   specid=0    IntFlux=True
    gaussian 30   0.0008  20   wave=4620.49   specid=0    IntFlux=True
    gaussian 10   0.0008   20   wave=4626.89   specid=0    IntFlux=True
    gaussian 5   0.0008   20   wave=4628.69   specid=0    IntFlux=True
    gaussian 10   0.0008   20   wave=4631.29   specid=0    IntFlux=True
model end

#link read

#link end