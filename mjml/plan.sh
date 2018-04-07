pkg_name="mjml"
pkg_origin="jarvus"
pkg_version="4.0.3"
pkg_description="MJML: the only framework that makes responsive-email easy"
pkg_upstream_url="https://github.com/mjmlio/mjml"
pkg_license=("MIT")
pkg_maintainer="Chris Alfano <chris@jarv.us>"
pkg_source="https://github.com/mjmlio/mjml/archive/v${pkg_version}.tar.gz"
pkg_shasum="f2dc0f91f1d7bfcdaf2a35255e5bfc98ba4d04a986f553e4cf3385a3d95202b2"

pkg_bin_dirs=(
  packages/mjml/bin
)

pkg_build_deps=(
  core/yarn
)

pkg_deps=(
  core/node
)


# implement build workflow
do_build() {
  pushd "${CACHE_PATH}" > /dev/null


  build_line "Installing dependencies with yarn"
  yarn install --ignore-scripts # won't work until interpreters are patched

  build_line "Fixing build interpreters"
  find -L "./node_modules/.bin" -type f -executable \
    -print \
    -exec bash -c 'sed -e "s#\#\!/usr/bin/env node#\#\!$1/bin/node#" --in-place "$(readlink -f "$2")"' _ "$(pkg_path_for node)" "{}" \;

  build_line "Building with yarn"
  yarn build


  pushd "./packages/mjml" > /dev/null
  build_line "Installing dependencies for mjml with yarn"
  yarn install

  build_line "Fixing mjml"
  sed -e "s#\#\!/usr/bin/env node#\#\!$(pkg_path_for node)/bin/node#" --in-place "./bin/mjml"
  popd > /dev/null


  popd > /dev/null
}

do_install() {
  pushd "${CACHE_PATH}" > /dev/null
  cp -r ./* "${pkg_prefix}/"
  popd > /dev/null
}

do_strip() {
  return 0
}