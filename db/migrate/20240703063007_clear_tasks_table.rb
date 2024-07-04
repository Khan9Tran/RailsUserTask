class ClearTasksTable < ActiveRecord::Migration[7.1]
  def up
    Task.delete_all
  end

  def down
    # Không cần thực hiện gì ở đây vì không thể khôi phục dữ liệu đã xóa
  end
end
