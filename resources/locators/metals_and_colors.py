# Summary form locators
odd_numbers = "xpath://*[@id='odds-selector']//label[text()='{}']"
even_numbers = "xpath://*[@id='even-selector']//label[text()='{}']"

# Color dropdown locators
colors_dropdown_button = "css:#colors button"
colors_dropdown_option = "//*[@id='colors']//a[descendant::*[text()='{}']]"

# Metals dropdown locators
metals_dropdown_button = "css:#metals button"
metals_dropdown_toggle = "css:#metals .caret"
metals_dropdown_option = "xpath://*[@id='metals']//a[descendant::*[text()='{}']]"

# Vegetables dropdown locators
vegetables_label = "css:label[for='vegetables']"
vegetables_button = "css:#vegetables button"
vegetable_checkbox = "xpath://*[@id='vegetables']//a[descendant::*[text()='{}']]"

# Elements checklist
element_checkbox = "xpath://*[@id='elements-block']//p[descendant::*[text()='{}']]"

submit_button = "id:submit-button"

result_line = "css:.results li"
