module Features
  module GroupHelpers
    def add_new_group users, name, description
      visit new_group_path
      fill_in "group_name", with: name
      fill_in "group_description", with: description
    end
  end
end
