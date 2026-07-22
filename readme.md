# Hyprland config

Minha configuração pessoal do [Hyprland](https://hypr.land/) com layout scrolling e overview de workspaces via plugin para o [Omarchy](https://omarchy.org/).

## Requisitos

- [Hyprland](https://hypr.land/)
- [Hyprpm](https://wiki.hypr.land/Plugins/Using-Plugins/)
- Plugin [ScrollOverview](https://github.com/yayuuu/hyprland-scroll-overview)

## Instalação

1. Clone este repositório:
```bash
   git clone https://github.com/SKierkegaard/omarchy-hyprland-config
```

2. Copie ou linke os arquivos de `cfg/` para `~/.config/hypr/`:
```bash
   ln -s ~/omarchy-hyprland-config/cfg/* ~/.config/hypr/
```

3. Instale o plugin `scrolloverview`:
```bash
   hyprpm add https://github.com/yayuuu/hyprland-scroll-overview.git
   hyprpm update
   hyprpm enable scrolloverview
```

4. Recarregue o Hyprland:
```bash
   hyprctl reload
```

## Créditos

- [Hyprland](https://github.com/hyprwm/Hyprland)
- [scrolloverview](https://github.com/yayuuu/hyprland-scroll-overview) por yayuuu
