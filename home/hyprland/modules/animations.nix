{ ... }:

{
  wayland.windowManager.hyprland.extraConfig = ''
    -- Curve for a smooth drop
    hl.curve("dropdown-top", {
      type = "bezier",
      points = { {0.05, 0.9}, {0.1, 1.05} }   -- mild overshoot, adjust to taste
    })

    -- Special-workspace animations (slide from top)
    hl.animation({
      leaf = "specialWorkspace",
      enabled = true,
      speed = 5,                    -- ~500 ms
      curve = "dropdown-top",
      style = "slidevert"           -- or "slidefadevert"
    })
    hl.animation({
      leaf = "specialWorkspaceIn",
      enabled = true,
      speed = 5,
      curve = "dropdown-top",
      style = "slidevert"
    })
    hl.animation({
      leaf = "specialWorkspaceOut",
      enabled = true,
      speed = 4,
      curve = "dropdown-top",
      style = "slidevert"
    })
  '';
}
