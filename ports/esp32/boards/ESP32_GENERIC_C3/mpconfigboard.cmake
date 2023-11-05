set(IDF_TARGET esp32c3)

set(SDKCONFIG_DEFAULTS
    boards/sdkconfig.base
    boards/sdkconfig.ble
    boards/ESP32_GENERIC_C3/sdkconfig.c3usb
)

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
