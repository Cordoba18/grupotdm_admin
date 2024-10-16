<?php

namespace App\Exports;

use App\Models\Vpn;
use App\Models\Wifi_channel;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Events\AfterSheet;

class Wifi_channeExport implements FromCollection, WithHeadings, ShouldAutoSize, WithEvents
{
    public function collection()
    {
        $data = Wifi_channel::select("id","code","detail","amount","date_start","date_finish","unit_value")
        ->where("id_state","=","1")->get();

        return collect($data);
    }

    public function headings(): array
    {
        return [
            'ID',
            'CODIGO',
            'DETALLE',
            'CANTIDAD',
            'FECHA DE INICIO',
            'FECHA FINAL',
            'VALOR UNITARIO',
        ];
    }

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function (AfterSheet $event) {
                $event->sheet->getStyle('A1:G' . ($event->sheet->getHighestRow()))
                    ->getBorders()
                    ->getAllBorders()
                    ->setBorderStyle(\PhpOffice\PhpSpreadsheet\Style\Border::BORDER_NONE);

                $event->sheet->getStyle('A1:G' . ($event->sheet->getHighestRow()))
                    ->getBorders()
                    ->getOutline()
                    ->setBorderStyle(\PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THICK);
                $event->sheet->getStyle('A1:G1')->applyFromArray([
                    'font' => [
                        'bold' => true,
                    ],
                ]);
            },
        ];
    }
}
