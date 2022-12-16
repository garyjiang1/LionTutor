json.extract! tutor, :id, :first_name, :last_name, :email, :phone, :bio, :created_at, :updated_at
json.url tutor_url(tutor, format: :json)
