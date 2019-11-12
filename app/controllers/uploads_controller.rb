class UploadsController < ApplicationController

  def create
    @upload = Upload.new(upload_params)
    @upload.save

    respond_to do |format|
      format.json { render :json => { url: @upload.pic.url, upload_id: @upload.id } }
    end
  end

  def destroy
    @upload = Upload.find(params[:id])
    @remember_id = @upload.id
    @upload.destroy

    s3 = Aws::S3::Resource.new(
                             :region => ENV['REGION'],
                             :access_key_id => ENV['AWS_ACCESS_KEY'],
                             :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
                             )

    folder = "https://story-photo.s3.amazonaws.com/uploads/upload/pic/#{@remember_id}"
    objects = s3.bucket("story-photo").objects({prefix: folder})
    objects.batch_delete!
    respond_to do |format|
      format.json { render :json => { status: :ok } }
    end
  end

  private

  def upload_params
    params.require(:upload).permit(:pic)
  end
end
