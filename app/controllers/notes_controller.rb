class NotesController < ApplicationController

    def index
        user_id = params[:user_id]
        if user_id
            notes = Note.where(user_id: user_id).order(:user_id)
        else
            notes = Note.all
        end
        render json: notes
    end

    def create
        note = Note.new(note_params)
        if note.save
            render json: note, status: :created
        else
            render json: { error: 'Failed to create note' }, status: 400
        end
    end

    def update
        note = Note.find(params[:id])
        note.assign_attributes(note_params)
        if note.save
            render json: note
        else
            render json: { error: 'Failed to update note' }, status: 400
        end
    end

    private

    def note_params
        params.permit(:title, :content, :user_id, tag_names: [])
    end

end
