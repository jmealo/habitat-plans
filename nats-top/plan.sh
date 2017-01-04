pkg_name=nats-top
pkg_origin=core
pkg_version=0.3.2
pkg_description="Top like program monitor for NATS."
pkg_upstream_url=https://github.com/nats-io/nats-top
pkg_license=('MIT')
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_source=https://github.com/nats-io/nats-top/archive/v${pkg_version}.tar.gz
pkg_shasum=98d0df8ebd3c0e0b4c6edc4f084520f643224d8a5d0519023c67c4d05db458b8
pkg_deps=(core/glibc)
pkg_build_deps=(core/go core/coreutils core/gcc core/make)
pkg_bin_dirs=(bin)
pkg_svc_run="${pkg_name}"


do_begin() {
  export GOPATH="/hab/cache"
  parent_go_path="${GOPATH}/src/github.com/nats-io"
  pkg_go_path="${parent_go_path}/${pkg_name}"
}

do_clean() {
  do_default_clean
  rm -rf "${parent_go_path}"
  return $?
}

do_prepare() {
  mkdir -p "${parent_go_path}"
  ln -s "${PWD}" "${pkg_go_path}"
  return $?
}

do_build() {
  pushd "${pkg_go_path}" > /dev/null
  go build
  local code=$?
  popd > /dev/null

  return $code
}

do_install() {
  mkdir -p "${pkg_prefix}/bin"
  cp "${pkg_name}" "${pkg_prefix}/bin/"
  return $?
}
