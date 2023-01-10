<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class cardResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'column_id' => $this->column_id,
            'description' => $this->description,
            'created_at' => $this->created_at->format('Y-m-d'),
            'order'=>$this->order,
            'deleted' => $this->deleted_at == null ? false : true
        ];
    }
}
