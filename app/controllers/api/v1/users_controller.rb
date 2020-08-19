class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :update]

  def profile
    render json: { user: UserSerializer.new(current_user), presets: @user.synth_settings }, status: :accepted
  end

  def create
      @user = User.create(user_params)
      if @user.valid?
        @token = encode_token(user_id: @user.id)
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
  end

  def update
      @user = User.find(user_params[:id])
      if @user.valid?
        @synth_setting = SynthSetting.create(gain: user_params[:synth_settings_attributes][:gain], reverb_wet: user_params[:synth_settings_attributes][:reverb_wet], reverb_decay: user_params[:synth_settings_attributes][:reverb_decay], bitcrush: user_params[:synth_settings_attributes][:bitcrush], cheby: user_params[:synth_settings_attributes][:cheby])
        if @synth_setting.valid?
          @preset = Preset.create(user: @user, synth_setting: @synth_setting)
          render json: { user: UserSerializer.new(@user), jwt: @token, synth_setting: @synth_setting }, status: :created
        else
          render json: { error: 'failed to create preset' }, status: :not_acceptable
        end
      else 
        render json: { error: 'failed to find user' }, status: :not_acceptable
      end
  end

  private
  def user_params
      params.require(:user).permit(:username, :password, :id, synth_settings_attributes: [:synth, :gain, :reverb_wet, :reverb_decay, :bitcrush, :cheby])
  end
    
end
