class Upload < ApplicationRecord
    mount_uploader :pic, PicUploader
end
