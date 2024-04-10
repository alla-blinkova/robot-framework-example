def get_expected_vegetables(*vegetable_names: str):
    return ", ".join(vegetable_names)


def verify_result_lines(actual_lines: list, expected: dict) -> bool:
    for key, value in expected.items():
        expected_str = f"{key}: {value}"
        if expected_str not in actual_lines:
            return False
    return True
