import json

# Sample JSON data
data = '''
[
    {"group": "Group A", "members": ["Alice", "Bob", "Charlie"]},
    {"group": "Group B", "members": ["David", "Eva"]},
    {"group": "Group C", "members": ["Frank"]}
]
'''

# Parse JSON string into Python object
groups = json.loads(data)

# Iterate through the groups
for group in groups:
    print(f"Group: {group['group']}")
    for member in group['members']:
        print(f" - {member}")