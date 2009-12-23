install :
	cp scala.snippets ~/.vim/snippets/
extract :
	cp ~/.vim/snippets/scala.snippets ./
check :
	cat scala.snippets | ruby check.rb
