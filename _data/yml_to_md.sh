for i in {0..56}; do
	title=$(yq '.['$i'].title' books.yml)
	filen=$(echo $title | tr " ,.!" "-"| awk '{print tolower($0)}')
	author=$(yq '.['$i'].author' books.yml)
	cover=$(yq '.['$i'].cover' books.yml)
	start=$(yq '.['$i'].start' books.yml)
	ending=$(yq '.['$i'].end' books.yml)
	desc=$(yq '.['$i'].summary' books.yml)
	echo $filen.md
	echo -e "---\nlayout: book\ntitle: $title\nauthor: $author\ncover: $cover\nstart: $start\nend: $ending\ndescription: $desc\n---" >> ./test/$filen.md
done
