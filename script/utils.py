import os
import yaml


def abs_path(rel_path: str):
    return os.path.join(os.path.dirname(__file__), rel_path)


def read_text(file_rel_path: str):
    with open(abs_path(file_rel_path), 'r', encoding='utf8') as f:
        text = f.read()
    return text


def read_file(file_rel_path: str):
    return open(abs_path(file_rel_path), 'r', encoding='utf8')


def load_db_config():
    with open(abs_path('../db_config.yaml'), 'r', encoding='utf8') as f:
        db_config = yaml.safe_load(f)
    return db_config
