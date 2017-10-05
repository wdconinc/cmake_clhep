#!/bin/sh

version=$1
origdir=`dirname $0`

echo "Downloading clhep-${version}.tgz..."
until test -f clhep-${version}.tgz
do wget http://proj-clhep.web.cern.ch/proj-clhep/DISTRIBUTION/tarFiles/clhep-${version}.tgz
done

echo "Unpacking clhep${version}.tar.gz..."
until test -d clhep-${version}
do
	tar -zxvf clhep-${version}.tgz
	mv ${version}/CLHEP clhep-${version}
	rmdir ${version}
done

prefix=/usr/local/clhep/clhep-${version}
if [ -f clhep-${version}/CMakeLists.txt ] ; then
	mkdir -p clhep-${version}-build
	cd clhep-${version}-build

	echo "Configuring clhep${version}..."
	cmake \
	 -DCMAKE_INSTALL_PREFIX=${prefix} \
	 -DCMAKE_BUILD_TYPE=RelWithDebInfo \
	 ../clhep-${version}
else
	cd clhep-${version}
	./configure --prefix=${prefix}
fi

j=`cat /proc/cpuinfo | grep processor | wc -l`
echo "Make will use $j parallel jobs."

echo "Building clhep-${version}..."
make -j $j -k

echo "Installing clhep-${version}..."
make -j $j install

cd "${origdir}"
