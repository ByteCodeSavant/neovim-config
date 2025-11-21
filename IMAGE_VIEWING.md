# Image Viewing in Neovim

This configuration includes several plugins to help you view and work with images in Neovim:

## Plugins

1. **image.nvim** - A plugin for viewing images directly in Neovim
2. **clipboard-image.nvim** - A plugin for pasting images from clipboard

## Keybindings

- `<leader>io` - Toggle image display
- `<leader>ir` - Render image
- `<leader>ic` - Clear images
- `<leader>ip` - Paste clipboard image

## Usage

### Viewing Images

To view an image file in Neovim:
1. Open an image file (png, jpg, jpeg, gif, webp) in Neovim
2. Use `<leader>ir` to render the image
3. Use `<leader>io` to toggle image display on/off
4. Use `<leader>ic` to clear all displayed images

### Pasting Images from Clipboard

To paste an image from your clipboard:
1. Copy an image to your clipboard (e.g., taking a screenshot)
2. In Neovim, use `<leader>ip` to paste the image
3. The image will be saved to the `images/` directory in your current working directory
4. The plugin will insert a markdown link to the image at your current cursor position

## Notes

- Image rendering works best in terminals that support image display protocols
- For iTerm2 users, make sure you're using a recent version that supports image display
- Large images may affect Neovim performance, so the plugin limits image size by default