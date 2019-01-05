class ApiController < ApplicationController

	# rescue_from Execption
  rescue_from 'ApiException' do |exception|
    render json: error_result_hash(exception.code, exception.error_message)
  end

  def error_result_hash(resp_code, resp_message)
    er_hash = {'response' => {'code' => resp_code, 'message' => resp_message}}
    er_hash
  end

  def generate_success_response_hash(status, message)
    er_hash = {'response' => {'code' => status, 'message' => message}}
    render_json_hash(er_hash)
  end

  def render_json_hash(resp_hash)
    render json: hash_to_json(resp_hash), status: 200
  end

  def hash_to_json(hash_obj)
    Oj.dump(hash_obj)
  end

	def get_nearby_places
		validate_request
		respond_to do |format|
			# By default units is considered as kms. However user can pass either miles or kms
			units = params[:units].present? ? params[:units] : "kms"
			# By default radius is considered as 10. However user can pass any radius
			radius = params[:radius].present? ? params[:radius].to_f : 10
			resp_hash = Place.get_nearby_places(params[:latitude], params[:longitude], units, radius)
			format.json {render_json_hash(resp_hash)}
			format.html {render text: 'Access Denied', status: 401}
		end
	end

	def validate_request
		raise ApiException.new(400, 'Not a Valid Request') unless request.get?
		raise ApiException.new(500, 'Please send Longitude and Latitude') if params[:latitude].blank? || params[:longitude].blank?

	end
end

class ApiException < Exception
  attr_accessor :code, :error_message

  def initialize(code, error_message)
    @code, @error_message = code, error_message
    er_hash = {'response' => {'code' => code, 'message' => error_message}}
    super(error_message)
  end

end