class NotesController < ApplicationController

    def create
        note = Note.new(note_params)
        if note.save
            render json: note, status: :created
        else
            render json: { error: 'Failed to create note' }, status: :not_acceptable
        end
    end

    private

    def note_params
        params.require(:note).permit(:title, :content, :user_id)
    end

end
