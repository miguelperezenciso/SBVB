all:	kind.f90 ALliball.f90 aux_sub11.f90 sbvb.f90
	gfortran -O3 kind.f90 ALliball.f90 aux_sub11.f90 sbvb.f90 -o sbvb -lblas
clean:
	rm *.mod
install:	sbvb README.sbvb
	cp sbvb /usr/local/bin/.
	cp README.ms2gs /usr/local/bin/.

