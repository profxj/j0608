run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits TestCII.fits
out plots J0608_cII_4368to4377.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[4367,4385]   loadrange=[4364,4388]   resolution=vfwhm(75.0vtie)   columns=[wave,flux,error]       label=OII_4367+CII4368to4377
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value False
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 45.0   0.01    scale=[1.0,1.0]   specid=0    continuum=True
# Specify the emission lines
    gaussian amplitude=-10.0  redshift=0.0011   dispersion=20   wave=4366.530 specid=0    IntFlux=True
    gaussian amplitude=5.0  redshift=0.0011   dispersion=20   wave=4368.1 specid=0    IntFlux=True
    gaussian amplitude=.5  redshift=0.0011   dispersion=20   wave=4369.0 specid=0    IntFlux=True
    gaussian amplitude=0  redshift=0.0011   dispersion=20   wave=4370.7 specid=0    IntFlux=True
    gaussian amplitude=25.0  redshift=0.0011   dispersion=20   wave=4372.4 specid=0    IntFlux=True
    gaussian amplitude=10.0  redshift=0.0011   dispersion=20   wave=4374.3 specid=0    IntFlux=True
    gaussian amplitude=6.0  redshift=0.0011   dispersion=20   wave=4375.0 specid=0    IntFlux=True
    gaussian amplitude=12.0  redshift=0.0011   dispersion=20   wave=4376.6 specid=0    IntFlux=True
    model end

#link read
#link end