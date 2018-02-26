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
  J0608.dat   specid=0   fitrange=[4850.0,4880.0]   loadrange=[4840.0,4885.0]   resolution=vfwhm(150.0vtie)   columns=[wave,flux,error]       label=Hb4863
  J0608.dat   specid=1   fitrange=[4335.0,4365.0]   loadrange=[4330.0,4370.0]   resolution=vfwhm(150.0vtie)   columns=[wave,flux,error]       label=Hg4342
  J0608.dat   specid=2   fitrange=[4095.0,4120.0]   loadrange=[4090.0,4125.0]   resolution=vfwhm(150.0vtie)   columns=[wave,flux,error]       label=Hd4103
  J0608.dat   specid=3   fitrange=[3955.0,3990.0]   loadrange=[3945.0,3995.0]   resolution=vfwhm(150.0vtie)   columns=[wave,flux,error]       label=Heps3970
  J0608.dat   specid=4   fitrange=[3717.0,3747.0]   loadrange=[3712.0,3752.0]   resolution=vfwhm(150.0vtie)   columns=[wave,flux,error]       label=[OII]3727+3729
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value False
fix gaussian dispersion True
emission
# Specify the continuum (or background) level
    legendre 0.35   0.01    scale=[1.0,1.0]   specid=0    continuum=True
    legendre 0.5   0.01    scale=[1.0,1.0]   specid=1    continuum=True
    legendre 0.52   0.01    scale=[1.0,1.0]   specid=2    continuum=True
    legendre 0.55   0.01    scale=[1.0,1.0]   specid=3    continuum=True
    legendre 0.6   0.01    scale=[1.0,1.0]   specid=4    continuum=True
# Specify the emission lines
    gaussian 4.5   0.0005ra   10.0dh   wave=4862.721    specid=0    IntFlux=True
    gaussian 3.0   0.0005ra   10.0dh   wave=4341.684    specid=1    IntFlux=True
    gaussian 1.0   0.0005ra   10.0dh   wave=4102.891    specid=2    IntFlux=True
    gaussian 0.9   0.0005ra   10.0dh   wave=3971.195    specid=3    IntFlux=True
    gaussian 6.5oiia   0.0005rao   10.0do   wave=3727.092    specid=4    IntFlux=True
    gaussian 9.0oiib   0.0005rao   10.0do   wave=3729.874    specid=4    IntFlux=True
    variable 16.0oiiflux    specid=4
model end

link read
oiib(oiiflux,oiia) = oiiflux - oiia
link end