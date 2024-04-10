from typing import Union


def format_locator(locator_template: str, *values: Union[str, int]):
    return locator_template.format(*values)
