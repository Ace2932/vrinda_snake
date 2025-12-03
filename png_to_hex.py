from PIL import Image

SPRITE_W = 16
SPRITE_H = 16

def png_to_hex(input_png, output_hex):
    img = Image.open(input_png).convert("RGB")
    img = img.resize((SPRITE_W, SPRITE_H), Image.NEAREST)

    with open(output_hex, "w") as f:
        for y in range(SPRITE_H):
            for x in range(SPRITE_W):
                r, g, b = img.getpixel((x, y))
                r4 = r >> 4
                g4 = g >> 4
                b4 = b >> 4
                value = (r4 << 8) | (g4 << 4) | b4
                f.write(f"{value:03X}\n")

    print(f"Wrote {output_hex}")

def main():
    png_to_hex("head_up.png", "head.hex")
    png_to_hex("tail_down.png", "tail.hex")
    png_to_hex("body_vertical.png","body.hex")

if __name__ == "__main__":
    main()
