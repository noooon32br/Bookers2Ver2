class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    @comment = BookComment.create(book_comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_back(fallback_location: root_path) } # 前のページに遷移
        format.js  # create.js.erbが呼び出される
      else
        format.html { redirect_back(fallback_location: root_path) } # 前のページに遷移
      end
    end
  end

  def destroy
    BookComment.find(params[:id]).destroy
    redirect_to book_path(params[:book_id])

  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment).merge(user_id: current_user.id, book_id: params[:book_id])
  end

end
