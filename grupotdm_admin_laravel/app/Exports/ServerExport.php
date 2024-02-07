<?php

namespace App\Exports;

use App\Models\Server;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Events\AfterSheet;

class ServerExport implements FromCollection, WithHeadings, ShouldAutoSize, WithEvents
{
    public function collection()
    {
        $data = DB::select("SELECT s.id, s.name, s.OS, s.service, s.RAM, s.vcpu, s.totaldd, s.ip, s.SPLA_RDP_TS, s.SPLA_EXCEL, st.state,s.observations
        FROM servers s
        INNER JOIN states st ON s.id_state = st.id");

        return collect($data);
    }

    public function headings(): array
    {
        return [
            'ID',
            'NOMBRE',
            'OS',
            'SERVICIO',
            'RAM',
            'VCPU',
            'TOTALDD',
            'IP',
            'SPLA_RDP_TS',
            'SPLA_EXCEL',
            'ESTADO',
            'OBSERVACIONES',
        ];
    }

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function (AfterSheet $event) {
                $event->sheet->getStyle('A1:L' . ($event->sheet->getHighestRow()))
                    ->getBorders()
                    ->getAllBorders()
                    ->setBorderStyle(\PhpOffice\PhpSpreadsheet\Style\Border::BORDER_NONE);

                $event->sheet->getStyle('A1:L' . ($event->sheet->getHighestRow()))
                    ->getBorders()
                    ->getOutline()
                    ->setBorderStyle(\PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THICK);
                $event->sheet->getStyle('A1:L1')->applyFromArray([
                    'font' => [
                        'bold' => true,
                    ],
                ]);
            },
        ];
    }
}
