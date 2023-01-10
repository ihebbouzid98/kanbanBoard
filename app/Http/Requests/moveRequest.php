<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class moveRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
           'id'=>'required',
           'new_column_id'=>'required',
           'old_column_id'=>'required',
           'order'=>'required',
        ];
    }
}
