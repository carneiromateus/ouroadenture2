CKEDITOR.editorConfig = function (config) {
  // ... other configuration ...

  config.toolbar_minimal = [
    [ 'Bold','Italic','Underline','Strike' ],
    [ 'Font','FontSize' ],
    [ 'TextColor','BGColor' ],
  ];

  config.toolbar_Trampolim = [
    [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ],
    [ 'Image','Table','HorizontalRule','SpecialChar','Iframe', 'Youtube' ],
    [ 'Link','Unlink' ],
    [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote', '-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
    [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ],
    [ 'Styles','Format','Font','FontSize' ],
    [ 'TextColor','BGColor' ],
    [ 'ShowBlocks'],
  ];

  config.toolbar = "Trampolim";

  /* Filebrowser routes */
  // The location of an external file browser, that should be launched when "Browse Server" button is pressed.
  config.filebrowserBrowseUrl = "/ckeditor/attachment_files";

  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Flash dialog.
  config.filebrowserFlashBrowseUrl = "/ckeditor/attachment_files";

  // The location of a script that handles file uploads in the Flash dialog.
  config.filebrowserFlashUploadUrl = "/ckeditor/attachment_files";

  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Link tab of Image dialog.
  config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";

  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Image dialog.
  config.filebrowserImageBrowseUrl = "/ckeditor/pictures";

  // The location of a script that handles file uploads in the Image dialog.
  config.filebrowserImageUploadUrl = "/ckeditor/pictures";

  // The location of a script that handles file uploads.
  config.filebrowserUploadUrl = "/ckeditor/attachment_files";

  config.allowedContent = true;

  // ... rest of the original config.js  ...
}
;
