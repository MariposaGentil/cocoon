import os
import base64

def gen_index_page():
    return f'{gen_header_md()}\n{gen_index_body()}'


def gen_header_md() -> str:
    with open('./posts/index_header.md', 'r') as f:
        md_text = f.read()
        return md_text

def gen_index_body():
    image_directory = './encoded_assets/img'
    output = ''
    for file in os.listdir(image_directory):
        is_png = file.endswith('.png')
        is_jpg = file.endswith('.jpg')
        if not is_png and not is_jpg:
            continue
    
        image_path = os.path.join(image_directory, file)
        with open(image_path, 'rb') as img_file:
            img_data = base64.b64encode(img_file.read())
            image_b64 = str(img_data, encoding='utf-8') + '\n'
            _format = 'png' if is_png else 'jpg'
            image_tag = f'<img src="data:image/{_format};base64,{image_b64}" alt="{file}">'
            output += f'<div class="gallery_img">{image_tag}</div>\n'
    return output
    



if __name__ == "__main__":
    result = gen_index_page()
    print(result or "")

