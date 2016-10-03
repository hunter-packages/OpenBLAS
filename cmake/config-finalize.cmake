if(NOT TARGET OpenBLAS::OpenBLAS)
  add_library(OpenBLAS::OpenBLAS UNKNOWN IMPORTED)
  set_target_properties(
      OpenBLAS::OpenBLAS
      PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES
      "${OpenBLAS_INCLUDE_DIRS}"
  )

  set_property(
      TARGET OpenBLAS::OpenBLAS PROPERTY IMPORTED_CONFIGURATIONS RELEASE
  )
  set_target_properties(
      OpenBLAS::OpenBLAS
      PROPERTIES
      IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
      IMPORTED_LOCATION_RELEASE "${OpenBLAS_LIBRARIES}"
  )

  find_package(Threads REQUIRED)
  set_property(
      TARGET OpenBLAS::OpenBLAS
      APPEND PROPERTY INTERFACE_LINK_LIBRARIES Threads::Threads
  )
endif()
