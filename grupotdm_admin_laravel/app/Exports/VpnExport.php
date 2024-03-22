<?php

namespace App\Exports;

use App\Models\Vpn;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Events\AfterSheet;

class VpnExport implements FromCollection, WithHeadings, ShouldAutoSize, WithEvents
{
    public function collection()
    {
        $data = DB::select("SELECT v.id,  v.name as name_vpn, u.name as name_user, a.area, ch.chargy, sh.shop, c.company, s.state
        FROM vpns v
        INNER JOIN users u ON v.id_user = u.id
        LEFT JOIN areas a ON u.id_area = a.id
        LEFT JOIN charges ch ON u.id_chargy = ch.id
        LEFT JOIN shops sh ON u.id_shop = sh.id
        LEFT JOIN companies c ON sh.id_company = c.id
        INNER JOIN states s ON v.id_state = s.id");

        return collect($data);
    }

    public function headings(): array
    {
        return [
            'ID',
            'VPN',
            'NOMBRE DE USUARIO',
            'AREA DEL USUARIO',
            'CARGO DEL USUARIO',
            'UBICACIÓN',
            'COMPAÑIA',
            'ESTADO DE VPN',
        ];
    }

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function (AfterSheet $event) {
                $event->sheet->getStyle('A1:H' . ($event->sheet->getHighestRow()))
                    ->getBorders()
                    ->getAllBorders()
                    ->setBorderStyle(\PhpOffice\PhpSpreadsheet\Style\Border::BORDER_NONE);

                $event->sheet->getStyle('A1:H' . ($event->sheet->getHighestRow()))
                    ->getBorders()
                    ->getOutline()
                    ->setBorderStyle(\PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THICK);
                $event->sheet->getStyle('A1:H1')->applyFromArray([
                    'font' => [
                        'bold' => true,
                    ],
                ]);
            },
        ];
    }
}
