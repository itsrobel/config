import dracula.draw
# Load existing settings made via :set
config.load_autoconfig()
config.set("colors.webpage.darkmode.enabled", True)
dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})


