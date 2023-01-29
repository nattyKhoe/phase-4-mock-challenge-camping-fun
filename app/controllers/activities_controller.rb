class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
        activities = Activity.all
        render json: activities
    end

    def destroy
        activity = find_activity
        activity.destroy

        head :no_content
    end

    private

    def find_activity
        Activity.find(params[:id])
    end

    def render_record_not_found
        render json: {error: "Activity not found"}, status: :not_found
    end

    def render_unprocessable_entity(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
