class ChangeQuizAnswersTable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :quiz_answers, :price, true
  end
end
