<?php

namespace App\Exports;

use App\Models\Product;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Events\AfterSheet;

class Report_productExport implements FromCollection, WithHeadings, ShouldAutoSize, WithEvents
{
    public function collection()
    {
        $data = DB::select("SELECT p.id, p.name, p.brand, p.serie, o.origin_certificate, s.state_certificate, t.type_component, st.state,u.name as name_user,sh.shop , r.report
        FROM products p
        LEFT JOIN users u ON p.id_user = u.id
        LEFT JOIN shops sh ON u.id_shop = sh.id
        INNER JOIN origins_certificates o ON p.id_origin_certificate = o.id
        INNER JOIN states_certificates s ON p.id_state_certificate = s.id
        INNER JOIN type_components t ON p.id_type_component = t.id
        INNER JOIN states st ON p.id_state = st.id
        LEFT JOIN (
            SELECT rp.id_product, rp.report
            FROM report_products rp
            JOIN (
                SELECT id_product, MAX(created_at) AS max_report_date
                FROM report_products
                GROUP BY id_product
            ) AS rp_max ON rp.id_product = rp_max.id_product AND rp.created_at = rp_max.max_report_date
        ) AS r ON p.id = r.id_product
ORDER BY `p`.`id` ASC");

        return collect($data);
    }

    public function headings(): array
    {
        return [
            'ID',
            'NOMBRE DEL PRODUCTO',
            'MARCA',
            'SERIAL',
            'ESTADO DE ORIGEN',
            'ESTADO DE VIDA',
            'TIPO DE COMPONENTE',
            'ESTADO',
            'NOMBRE DE USUARIO CREADOR',
            'UBICACIÓN DEL USUARIO',
            'ULTIMO REPORTE',
        ];
    }

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function (AfterSheet $event) {
                $event->sheet->getStyle('A1:K' . ($event->sheet->getHighestRow()))
                    ->getBorders()
                    ->getAllBorders()
                    ->setBorderStyle(\PhpOffice\PhpSpreadsheet\Style\Border::BORDER_NONE);

                $event->sheet->getStyle('A1:K' . ($event->sheet->getHighestRow()))
                    ->getBorders()
                    ->getOutline()
                    ->setBorderStyle(\PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THICK);
                $event->sheet->getStyle('A1:K1')->applyFromArray([
                    'font' => [
                        'bold' => true,
                    ],
                ]);
            },
        ];
    }
}
