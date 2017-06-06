function array_associative_local_to_dictionary() {

    local jdk_version="${JAVA_INSTALLER_JDK_VERSION:-1.8.0_131}"
    local jdk_filename_version="${JAVA_INSTALLER_JDK_FILENAME_VERSION:-8u131}"
    local jdk_build="${JAVA_INSTALLER_JDK_BUILD:-b11}"
    local jdk_guid="${JAVA_INSTALLER_JDK_GUID:-d54c1d3a095b4ff2b6607d096fa80163}"
    local target_dir="${JAVA_INSTALLER_TARGET_DIR:-/opt}"
    local repo_dir="${JAVA_INSTALLER_REPO_DIR:-/opt/repo/java}"

#    typeset -n my_context=${1}
    local -n my_context=${1}
    my_context=( [jdk_version]="${jdk_version}" \
                   [jdk_filename_version]="${jdk_filename_version}" \
                   [jdk_build]="${jdk_build}" \
                   [jdk_guid]="${jdk_guid}" \
                   [target_dir]="${target_dir}" \
                   [repo_dir]="${repo_dir}" )

#    typeset -p my_context

#[jdk_filename_version]="jdk_filename_version" [jdk_build]="jdk_build" [jdk_guid]="jdk_guid" [target_dir]="target_dir" [repo_dir]="repo_dir" )

#                   [jdk_filename_version]="${jdk_filename_version}" \
#                   [jdk_build]="${jdk_build}" \
#                   [jdk_guid]="${jdk_guid}" \
#                   [target_dir]="${target_dir}" \
#                   [repo_dir]="${repo_dir}" )

    echo "keys:   ${!my_context[@]}"
    echo "values: ${my_context[@]}"
}


function save_state() {

    local -n state_array
    local function_name

    set -a ${function_name}"

}

declare -A some_map
array_associative_local_to_dictionary some_map
    echo "keys:   ${!some_map[@]}"
    echo "values: ${some_map[@]}"
