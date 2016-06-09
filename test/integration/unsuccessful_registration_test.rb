require 'test_helper'
require 'integration/concerns/authentication'

class UnsuccessfulRegistrationTest < ActionDispatch::IntegrationTest
  include Authentication

  before do
    visit root_path
    click_link 'nuevo usuario'
    click_button 'Regístrate'
  end

  it 'shows errors' do
    assert_content 'Ocurrieron 3 errores'
  end
end
