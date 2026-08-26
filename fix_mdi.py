import os
import re

cache_path = os.path.expanduser('../../.pub-cache/hosted/pub.dev')
for d in os.listdir(cache_path):
    if d.startswith('material_design_icons_flutter'):
        file_path = os.path.join(cache_path, d, 'lib', 'icon_map.dart')
        with open(file_path, 'r') as f:
            content = f.read()
        
        while re.search(r", fontFamily: 'Material Design Icons', fontPackage: 'material_design_icons_flutter', fontFamily: 'Material Design Icons', fontPackage: 'material_design_icons_flutter'", content):
            content = content.replace(", fontFamily: 'Material Design Icons', fontPackage: 'material_design_icons_flutter', fontFamily: 'Material Design Icons', fontPackage: 'material_design_icons_flutter'", ", fontFamily: 'Material Design Icons', fontPackage: 'material_design_icons_flutter'")
        
        with open(file_path, 'w') as f:
            f.write(content)
