def save_labels(labels)
    labels_store = labels.map do |label|
      {
        id: label.id,
        title: label.title,
        color: label.color
      }
    end
    file = File.open('./data/labels/labels.json', 'w')
    file.puts(JSON.pretty_generate(labels_store))
    file.close
  end
  
  def read_labels
    if File.exist?('./data/labels/labels.json')
      labels = JSON.parse(File.read('./data/labels/labels.json'))
      labels.map do |label|
        Label.new(label['title'], label['color'], label['id'])
      end
    else
      []
    end
  end
  