
# Bookstore Management System

 The bookstore management system allows the bookstore to keep track of the inventory, sell books, add/remove/modify books, and search for books. The main idea of the projects is to convert the given text file into a list, then execute the orders on the list, and finally overwrite the same file with the ending list. Also, each book will be given a number that is not recorded in the text file for easier operation on the books.
 
 ## Functions and Description:

```
readFile(inFile): this function takes the name of the text file and open it, then convert it
into a list. So, this function is the start of our system.
```
```
overWrite(): This function is the ending function. After executing every given function
on the list, this function will overwrite the text file with the new list.
```
```
addBook(): This function interacts with the user unlike the previous two. It will start a
loop that will not stop until the book is added or the users chooses to quit. It will ask the
user for the information of the book, then add it to the list and return it.
```
```
ShowList(): This function prints the current list every book at a line and numbered.
```
```
remove(Book_Number): This function deletes the book with the given number (used in
removeBook() and buyBook()) and update the list.
```
```
removeBook(): This function interacts with the user. First, it will print the list of books
(using showList()). Then, it will ask the user to enter the number of the book he wants to
remove. Finally, it will use the given number after validating it in remove(book_Number)
function.
```
```
buyBook(): This function interacts with the user the same way as removeBook(), but it
prints the chosen book and asks the user to confirm it.
```
```
findBook(): This function interacts with the user and give him the choice of searching
method (ISBN number, Book title, Author name) and prints the book if found. Otherwise,
it will print that that there is no such book.
modifyBook(): This function interacts with the user by asking for the selection method.
After selecting the book, it will ask the user to choose the information to change and
update the list.
```
```
GenerateRandomBook(): The function uses the random library to generate a number that
is less or equal to the number of books, then prints the book with this number.
```
```
main(): This function executes the program and inputs the name of the text file for the
program to open and starts a loop that doesn’t stop until the user chooses so. Then, it will
print my name.
```

## 🛠 Skills Used
Python: expressions, decision structures, looping, functions, lists, files and exceptions.


## 🚀 About Me
👋 Hi, I’m @Raed-Alshehri

👀 I’m interested in data science, machine learning, and statistics.

🌱 I’m applying my skills in the data analytics field using Python, R, and SQL


## 🔗 Links
[![portfolio](https://img.shields.io/badge/my_portfolio-000?style=for-the-badge&logo=ko-fi&logoColor=white)](https://raed-alshehri.github.io/RaedAlshehri.github.io/)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/raedalshehri/)


## Feedback

If you have any feedback, please reach out to me at alshehri.raeda@gmail.com



