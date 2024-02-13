<?php

namespace App\Exports;

use App\Models\Server;
use App\Models\Spreadsheet_rows_tpv;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Events\AfterSheet;

class SpreadsheetsExport implements FromCollection, WithHeadings, ShouldAutoSize, WithEvents
{

    public $id_spreadsheets;
    public $id_company;
    public function __construct($id_spreadsheets, $id_company)
    {
        $this->id_spreadsheets = $id_spreadsheets;
        $this->id_company = $id_company;
    }

    public function collection()
    {
        $id_spreadsheets = $this->id_spreadsheets;
    $id_company = $this->id_company;

        $user = Auth::user();
        $validation_jefe = DB::selectOne("SELECT * FROM users u
       INNER JOIN charges c ON u.id_chargy = c.id
        WHERE (c.chargy = 'JEFE DE AREA' OR c.chargy LIKE '%coordinador%') AND u.id_area = 7 AND u.id = $user->id");

        if ($validation_jefe) {

                $data = Spreadsheet_rows_tpv::leftJoin("payment_methods","spreadsheet_rows_tpvs.id_payment_method","payment_methods.id")
                ->leftJoin("spreadsheet_tpvs","spreadsheet_rows_tpvs.id_spreadsheet_tpv","spreadsheet_tpvs.id")
                ->leftJoin("states","spreadsheet_tpvs.id_state","states.id")
                ->leftJoin("tpvs","spreadsheet_tpvs.id_tpv","tpvs.id")
                ->leftJoin("shops","tpvs.id_shop","shops.id")
                ->leftJoin("companies","shops.id_company","companies.id")
                ->leftJoin("spreadsheets","spreadsheet_tpvs.id_spreadsheet","spreadsheets.id")
                ->leftJoin("spreadsheet_shops","shops.id","spreadsheet_shops.id_shop")
                ->leftJoin("users","spreadsheet_shops.id_user","users.id")
                ->select("users.name",
                "spreadsheets.date_previous","spreadsheets.date_now",
                    "tpvs.tpv","companies.company","shops.shop",
                "spreadsheet_tpvs.total as total_pos","spreadsheet_tpvs.sub_total as sub_total_pos","spreadsheet_tpvs.difference as difference_pos",
                "payment_methods.name as payment_method","spreadsheet_rows_tpvs.value_pos",
                "spreadsheet_rows_tpvs.value_treasurer","spreadsheet_rows_tpvs.difference"
                ,"states.state")
                ->where("spreadsheet_tpvs.id_spreadsheet","=","$id_spreadsheets")
                ->where("shops.id_company","=","$id_company")
                ->orderBy('shops.id', 'desc')
                ->get();


        }else{
            $data = Spreadsheet_rows_tpv::leftJoin("payment_methods","spreadsheet_rows_tpvs.id_payment_method","payment_methods.id")
            ->leftJoin("spreadsheet_tpvs","spreadsheet_rows_tpvs.id_spreadsheet_tpv","spreadsheet_tpvs.id")
            ->leftJoin("states","spreadsheet_tpvs.id_state","states.id")
            ->leftJoin("tpvs","spreadsheet_tpvs.id_tpv","tpvs.id")
            ->leftJoin("shops","tpvs.id_shop","shops.id")
            ->leftJoin("companies","shops.id_company","companies.id")
            ->leftJoin("spreadsheets","spreadsheet_tpvs.id_spreadsheet","spreadsheets.id")
            ->leftJoin("spreadsheet_shops","shops.id","spreadsheet_shops.id_shop")
            ->leftJoin("users","spreadsheet_shops.id_user","users.id")
            ->select("users.name",
                "spreadsheets.date_previous","spreadsheets.date_now",
                "tpvs.tpv","companies.company","shops.shop",
            "spreadsheet_tpvs.total as total_pos","spreadsheet_tpvs.sub_total as sub_total_pos","spreadsheet_tpvs.difference as difference_pos",
            "payment_methods.name as payment_method","spreadsheet_rows_tpvs.value_pos",
            "spreadsheet_rows_tpvs.value_treasurer","spreadsheet_rows_tpvs.difference","states.state")
            ->where("spreadsheet_tpvs.id_spreadsheet","=","$id_spreadsheets")
            ->where("shops.id_company","=","$id_company")
            ->where('spreadsheet_shops.id_user', "=","$user->id")
            ->orderBy('shops.id', 'desc')
            ->get();



        }

        return collect($data);
    }

    public function headings(): array
    {
        return [
            'USUARIO DE GESTION',
            'FECHA DE INFORME',
            'FECHA DE CREACIÓN DE INFORME',
            'TPV',
            'COMAPAÑIA',
            'TIENDA',
            'TOTAL POS',
            'TOTAL CONTEO',
            'TOTAL DIFERENCIA',
            'METODO DE PAGO',
            'VALOR DEL POS',
            'VALOR DEL CONTEO',
            'VALOR DIFERENCIA',
            'ESTADO',

        ];
    }

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function (AfterSheet $event) {
                $event->sheet->getStyle('A1:N' . ($event->sheet->getHighestRow()))
                    ->getBorders()
                    ->getAllBorders()
                    ->setBorderStyle(\PhpOffice\PhpSpreadsheet\Style\Border::BORDER_NONE);

                $event->sheet->getStyle('A1:N' . ($event->sheet->getHighestRow()))
                    ->getBorders()
                    ->getOutline()
                    ->setBorderStyle(\PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THICK);
                $event->sheet->getStyle('A1:N1')->applyFromArray([
                    'font' => [
                        'bold' => true,
                    ],
                ]);
            },
        ];
    }
}
