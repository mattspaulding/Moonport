if(global.isTerminal || isOccupyingRocket)exit;
draw_self();

if (flash > 0)
{
    flash--;
    shader_set(shWhite);
    draw_self();
    shader_reset();
}

if (!global.isSplitScreen)
{
    with (oCamera)
    {
        if (view_zoom == 2)
        {
            draw_set_color(other.image_blend);
            draw_circle(other.x, other.y - 40, 10, false);
            draw_set_color(c_black);
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_text(other.x, other.y - 40, string(other.pId + 1));
        }
        if (view_zoom == 3)
        {
            draw_set_color(other.image_blend);
            draw_circle(other.x, other.y - 60, 20, false);
            draw_set_color(c_black);
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_text_transformed(other.x, other.y - 60, string(other.pId + 1), 2, 2, 0);
        }
        if (view_zoom == 4)
        {
            draw_set_color(other.image_blend);
            draw_circle(other.x, other.y - 80, 40, false);
            draw_set_color(c_black);
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_text_transformed(other.x, other.y - 80, string(other.pId + 1), 4, 4, 0);
        }
    }
}
