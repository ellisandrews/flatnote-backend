class NotesController < ApplicationController

    def index
        # Allow optional filtering on user_id, otherwise return all
        user_id = params[:user_id]
        if user_id
            notes = Note.where(user_id: user_id)
        else
            notes = Note.all
        end
        render json: notes.order(:id)
    end

    def create
        note = Note.new(note_params)
        if note.save
            render json: note, status: :created
        else
            render json: { error: 'Failed to create note', messages: note.errors.full_messages }, status: :bad_request
        end
    end

    def update
        note = Note.find(params[:id])
        note.assign_attributes(note_params)
        if note.save
            render json: note
        else
            render json: { error: 'Failed to update note', messages: note.errors.full_messages }, status: :bad_request
        end
    end

    def destroy
        note = Note.find(params[:id])
        begin
            note.destroy!
            render json: { message: 'Note successfully deleted' }
        rescue ActiveRecord::RecordNotDestroyed => invalid
            render json: { error: 'Failed to delete note', message: invalid.record.errors.full_messages }, status: :internal_server_error
        end
    end

    private

    def note_params
        params.require(:note).permit(:title, :content, :user_id, tag_names: [])
    end

end
