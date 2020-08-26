#!/usr/bin/env bats

source "${BATS_TEST_DIRNAME}/test_helper.sh"

@test "It should install PostgreSQL 9.5.22" {
  /usr/lib/postgresql/9.5/bin/postgres --version | grep "9.5.22"
}

@test "This image needs to forever support PostGIS 2.2" {

  check_postgis "2.2"

  full=$(get_full_postgis_version "2.2")

  initialize_and_start_pg
  run su postgres -c "psql --command \"CREATE EXTENSION postgis VERSION '${full}';\""
  [ "$status" -eq "0" ]
}
