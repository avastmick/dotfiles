-- Rust specific configuration
-- Note that I DO NOT use the LSP for Rust.
-- See: https://github.com/mrcjkb/rustaceanvim for more details.
return {
    'mrcjkb/rustaceanvim',
    version = '^4',
    ft = { 'rust' },
}
