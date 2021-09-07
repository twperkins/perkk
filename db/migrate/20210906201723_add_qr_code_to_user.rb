class AddQrCodeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :qr_code, :string
  end
end
