set(IDF_TARGET esp32s3)

set(SDKCONFIG_DEFAULTS
    boards/sdkconfig.base
    boards/sdkconfig.usb
    boards/sdkconfig.ble
    boards/sdkconfig.spiram_sx
    boards/ESP32_GENERIC_S3/sdkconfig.board
)

if(MICROPY_BOARD_VARIANT STREQUAL "SPIRAM_OCT")
    set(SDKCONFIG_DEFAULTS
        ${SDKCONFIG_DEFAULTS}
        boards/sdkconfig.240mhz
        boards/sdkconfig.spiram_oct
    )

    list(APPEND MICROPY_DEF_BOARD
        MICROPY_HW_BOARD_NAME="Generic ESP32S3 module with Octal-SPIRAM"
    )
endif()

if(DEFINED MICROPY_BOARD_FLASH_SIZE)
    if (EXISTS "${MICROPY_BOARDS_DIR}/sdkconfig.${MICROPY_BOARD_FLASH_SIZE}")
    set(SDKCONFIG_DEFAULTS
        ${SDKCONFIG_DEFAULTS}
        boards/sdkconfig.${MICROPY_BOARD_FLASH_SIZE}
    )
    else()
        message(FATAL_ERROR "Unsupported flash size: ${MICROPY_BOARD_FLASH_SIZE}")
    endif()
endif()
