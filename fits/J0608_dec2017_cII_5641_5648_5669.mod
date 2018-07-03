run blind False
run nsubpix 20
chisq ftol 1.0E-10
chisq atol 0.001
chisq miniter 10
chisq maxiter 1000
out fits TestCII.fits
out plots J0608_cII_5641_5648_5669.pdf
plot dims 3x3
plot labels True
plot fits False

data read
  ../../j0608/data/spec/J0608_ALIS.ascii   specid=0   fitrange=[5641,5678]   loadrange=[5635,5687]   resolution=vfwhm(75.0vtie)   columns=[wave,flux,error]       label=CII5641+5648+5669
data end

model read
lim gaussian amplitude [None,None]
fix vfwhm value False
fix gaussian dispersion False
emission
# Specify the continuum (or background) level
    legendre 21.0   0.01    scale=[1.0,1.0]   specid=0    continuum=True
# Specify the emission lines
    gaussian amplitude=-3   redshift=0.0005   dispersion=42   wave=5642.1 specid=0    IntFlux=True
    gaussian amplitude=20.0   redshift=0.0008   dispersion=42   wave=5642.1 specid=0    IntFlux=True
     gaussian amplitude=-5   redshift=0.0005   dispersion=42   wave=5649.7 specid=0    IntFlux=True
     gaussian amplitude=20.0   redshift=0.0008   dispersion=42   wave=5649.7 specid=0    IntFlux=True
    gaussian amplitude=-10.0   redshift=0.0005   dispersion=42   wave=5664.1 specid=0    IntFlux=True
    gaussian amplitude=20.0   redshift=0.0008   dispersion=42   wave=5664.1 specid=0    IntFlux=True

#link read
#link end