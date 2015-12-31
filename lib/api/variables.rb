module API
  # Projects variables API
  class Variables < Grape::API
    before { authenticate! }
    before { authorize_admin_project }

    resource :projects do
      # Get project variables
      #
      # Parameters:
      #   id (required) - The ID of a project
      #   page (optional) - The page number for pagination
      #   per_page (optional) - The value of items per page to show
      # Example Request:
      #   GET /projects/:id/variables
      get ':id/variables' do
        variables = user_project.variables
        present paginate(variables), with: Entities::Variable
      end

      # Get specifica bariable of a project
      #
      # Parameters:
      #   id (required) - The ID of a project
      #   variable_id (required) - The ID OR `key` of variable to show; if variable_id contains only digits it's treated
      #                            as ID other ways it's treated as `key`
      # Example Request:
      #   GET /projects/:id/variables/:variable_id
      get ':id/variables/:variable_id' do
        variable_id = params[:variable_id]
        variables = user_project.variables
        variables =
          if variable_id.match(/^\d+$/)
            variables.where(id: variable_id.to_i)
          else
            variables.where(key: variable_id)
          end

        present variables.first, with: Entities::Variable
      end

      # Update existing variable of a project
      #
      # Parameters:
      #   id (required) - The ID of a project
      #   variable_id (required) - The ID of a variable
      #   key (optional) - new value for `key` field of variable
      #   value (optional) - new value for `value` field of variable
      # Example Request:
      #   PUT /projects/:id/variables/:variable_id
      put ':id/variables/:variable_id' do
        variable = user_project.variables.where(id: params[:variable_id].to_i).first

        variable.key = params[:key]
        variable.value = params[:value]
        variable.save!

        present variable, with: Entities::Variable
      end
    end
  end
end
