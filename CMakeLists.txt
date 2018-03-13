    project (com.github.mkinitcpio.ellyrics)

    cmake_minimum_required (VERSION 2.6)

    list (APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
    list (APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/src)

    set (DATADIR "${CMAKE_INSTALL_PREFIX}/share")

    set (PKGDATADIR "${DATADIR}/com.github.mkinitcpio.ellyrics")

    set (EXEC_NAME "com.github.mkinitcpio.ellyrics")
    set (RELEASE_NAME "Ellyrics")
    set (VERSION "0.1")
    set (VERSION_INFO "Alpha")

    find_package(PkgConfig)

    pkg_check_modules(DEPS REQUIRED gtk+-3.0 granite>=0.3.0)

    add_definitions(${DEPS_CFLAGS})
    link_libraries(${DEPS_LIBRARIES})
    link_directories(${DEPS_LIBRARY_DIRS})

    find_package(Vala REQUIRED)
    include(ValaVersion)
    ensure_vala_version("0.16" MINIMUM)

    include(ValaPrecompile)

    set (program_DEPS
        gtk+-3.0
        granite
    )

    vala_precompile(VALA_C ${EXEC_NAME}
        src/EllyricsApplication.vala
        src/EllyricsApplicationWindow.vala
        src/Widgets/HeaderBar.vala
        src/Widgets/NetworkStatusNotification.vala
        src/Widgets/ContentLayout.vala
        src/Services/NetworkConnectionService.vala
        src/Models/ViewModeEnum.vala

    PACKAGES
        ${program_DEPS}

    OPTIONS
        --thread
    )

    add_executable(${EXEC_NAME} ${VALA_C})

    install (TARGETS ${EXEC_NAME} RUNTIME DESTINATION bin)

    install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/data/ellyrics.desktop DESTINATION ${DATADIR}/applications/)