<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('tanggal_romawi'))
{
	function tanggal_romawi($tanggal){
		$bulan = array (1 =>   'I',
					'II',
					'III',
					'IV',
					'V',
					'VI',
					'VII',
					'VIII',
					'IX',
					'X',
					'XI',
					'XII'
				);
		if($tanggal != 0){
			$split = explode('-', $tanggal);
			return $split[2] . '-' . $bulan[ (int)$split[1] ] . '-' . $split[0];
		}else{
			return '-';
		}
	}

	function bulan_romawi($bulan) {
		switch ($bulan) {
			case '01':
				$bulan = 'I';
				break;

			case '02':
				$bulan = 'II';
				break;

			case '03':
				$bulan = 'III';
				break;

			case '04':
				$bulan = 'IV';
				break;

			case '05':
				$bulan = 'V';
				break;

			case '06':
				$bulan = 'VI';
				break;
				
			case '07':
				$bulan = 'VII';
				break;

			case '08':
				$bulan = 'VIII';
				break;

			case '09':
				$bulan = 'IX';
				break;

			case '10':
				$bulan = 'X';
				break;
				
			case '11':
				$bulan = 'XI';
				break;
			
			default:
				$bulan = 'XII';
				break;
		}

		return $bulan;
	}
}