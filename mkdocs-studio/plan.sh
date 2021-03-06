pkg_name=mkdocs-studio
pkg_origin=jarvus
pkg_version=2.0.0
pkg_maintainer="Chris Alfano <chris@jarv.us>"
pkg_license=('MIT')
pkg_description="Studio tools for MkDocs"
pkg_build_deps=(
)
pkg_deps=(
  jarvus/mkdocs
  jarvus/stoml
)

do_build() {
  return 0
}

do_install() {
  cp -v "studio.sh" "${pkg_prefix}/"
}

do_strip() {
  return 0
}
