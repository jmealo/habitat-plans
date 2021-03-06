pkg_name=gdal
pkg_origin=core
pkg_version=2.2.1
pkg_description="GDAL is a translator library for raster and vector geospatial data formats"
pkg_upstream_url=http://www.gdal.org/
pkg_license=('MIT')
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_source=http://download.osgeo.org/gdal/${pkg_version}/gdal-${pkg_version}.tar.gz
pkg_shasum=61837706abfa3e493f3550236efc2c14bd6b24650232f9107db50a944abf8b2f
pkg_build_deps=(
  core/gcc
  core/make
)
pkg_deps=(
  core/glibc
)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)
