<?php

require_once('../model/Model-Connexion.php');



	$strDate = $_GET['date'];

	$date = strtotime($strDate);
	//$dateRef = date("Y-m-d", strtotime("-7 day" , $date ));

	//echo($dateRef);

	$result = array();
	$result["date_jour"] = $strDate;

	try {	

		$query = $db->prepare("SELECT * FROM gazou.echantillion WHERE date_sql = ? ");
		$query->execute(array($strDate));
		$res = array();

		$tuple = $query->fetch();			
		$conso_jour = $tuple['globale'];
		$degre_jour = str_replace(",", ".", $tuple['degre']);

		//echo "conso jour = " . $conso_jour;
		//echo "degre jour = " . $degre_jour;
		$result["conso_jour"] = $conso_jour;
		$result["degre_jour"] = $degre_jour;

		$query = $db->prepare("SELECT globale FROM gazou.echantillion WHERE date_sql < ? and degre between  ? and ? ");
		
		$degre_jour1 = str_replace(".", ",", (string)($degre_jour-0.2));
		$degre_jour2 = str_replace(".", ",", (string)($degre_jour+0.2));

		$query->execute(array($strDate, $degre_jour1, $degre_jour2));
		$res = array();

		while($tuple = $query->fetch()){			
			$res[] = $tuple['globale'];
		}

		//calcul moyenne des conso pour un même degré
		$conso_moy = array_sum($res)/count($res);
		//echo "conso moyenne=" . $conso_moy;
		$result["conso_moyenne"] = $conso_moy;

		if ($conso_moy == 0 || $conso_jour > $conso_moy) {
			$result["data"] = array(0,0,0);	
			$resultat = array(0,0,0);		
		}else{
			//calcul pourcentage au dessus
			$gain = abs((( $conso_jour - $conso_moy) / $conso_moy) * 100);
			//echo "gain:" . $gain;
			$result["gain"] = $gain;

			if ($gain >= 0 && $gain < 8){
				$resultat = array(1,0,0);			
				$result["data"] = array(1,0,0);	
			}elseif ($gain >= 8 && $gain < 15){
				$resultat = array(1,1,0);		
				$result["data"] = array(1,1,0);		
			}else {
				$resultat = array(1,1,1);	
				$result["data"] = array(1,1,1);		
			}

		}


		//header('Content-type: application/json');


		echo json_encode($result);


		

	} catch (Exception $e) {
    echo 'oups : ',  $e->getMessage(), "\n";
}

	



?>

