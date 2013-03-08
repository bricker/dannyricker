CKEDITOR.editorConfig = (config) ->
    config.toolbar = [
        ['Bold', 'Italic', 'Underline', "RemoveFormat"]
        ['NumberedList', 'BulletedList', 'Blockquote']
        ['Link', 'Unlink', 'Image']
        ['Find', 'Paste']
        ['Source', 'Maximize']
    ]

    config.language = 'en'
    config.height = "400px"
    config.width  = "635px"
    config.bodyClass = 'ckeditor-body'
    config.contentsCss = "/assets/application.css"
    
    config.disableNativeSpellChecker = false
    
    true
