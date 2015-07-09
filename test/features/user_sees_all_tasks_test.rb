require_relative '../test_helper'

class UserSeesAllTasksTest < FeatureTest
  def test_home_page_displays_welcome_message
    # WWUD
    visit '/'
    assert page.has_content?("Welcome to the Task Manager")
    within('#greeting') do
      assert page.has_content?("Welcome to the Task Manager")
    end
  end

  def test_user_can_fill_in_task_form
    visit '/'
    click_link("New Task")
    assert_equal "/tasks/new", current_path

    fill_in('task_title', with: "pizza")
    fill_in('task_description', with: "more pizza")
    click_button("Create Task")
    assert_equal "/tasks", current_path

    within('.all_tasks') do
      assert page.has_content? "pizza"
    end
  end

  def test_user_can_edit_a_task
    visit '/'
    click_link("New Task")
    assert_equal "/tasks/new", current_path

    fill_in('task_title', with: "pizza")
    fill_in('task_description', with: "more pizza")
    click_button("Create Task")
    assert_equal "/tasks", current_path

    click_link("Edit")
    fill_in('task[title]', with: "dessert!")
    fill_in('task[description]', with: "ice cream")
    click_button("Update")

    within('h1') do
      assert page.has_content? "dessert!"
    end
  end

  def test_user_sees_index_of_tasks
  end
end
