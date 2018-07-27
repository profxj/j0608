run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits False
out plots CPD56_4feb2018_HeI_4472.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../CPD-56/fits/CPD56.ascii   specid=0   fitrange=[4466,4478]   loadrange=[4460,4480]   resolution=vfwhm(73.1)   columns=[wave,flux,error]       label=
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value True
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 1000   0.01    scale=[1.0,1.0]   specid=0    continuum=True
    gaussian    -900    -0.0003    35   wave=4471.5   specid=0    IntFlux=True
    gaussian    5000    0.00001    35   wave=4471.5   specid=0    IntFlux=True
model end

#link read

#link end