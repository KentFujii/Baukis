class CustomerMessage < Message
  scope :unprocessed, -> { where(status: 'new', deletd: false) }
end
