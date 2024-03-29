# frozen_string_literal: true

module Categories
  class Create < Base
    validate :name_ok?
    validate :description_ok?

    def items
      serialized_data(serializer, category)
    end

    def category
      current_user.categories.create(category_params)
    end

    def message
      'Success'
    end

    def category_params
      @category_params ||= params.require(:category).permit(:name, :description).merge(user_id: current_user.id)
    end
  end
end
